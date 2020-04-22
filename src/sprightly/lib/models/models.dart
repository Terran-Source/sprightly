import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/db/database.dart';

abstract class BaseData {
  final SystemDao _dao;

  BaseData(this._dao);
}

class GroupAccountMember extends BaseData {
  final String groupId;
  Future<List<Member>> get members => _dao.getGroupAccountMembers(groupId);
  Stream<List<Member>> get watchedMembers =>
      _dao.watchGroupAccountMembers(groupId);

  GroupAccountMember(SystemDao _dao, this.groupId) : super(_dao);
}

class GroupOnlyMember extends BaseData {
  final String groupId;
  Future<List<Member>> get members => _dao.getGroupOnlyMembers(groupId);
  Stream<List<Member>> get watchedMembers =>
      _dao.watchGroupOnlyMembers(groupId);

  GroupOnlyMember(SystemDao _dao, this.groupId) : super(_dao);
}

class GroupSettlement extends BaseData {
  final String groupId;
  Future<List<Settlement>> get settlements => _dao.getGroupSettlements(groupId);
  Stream<List<Settlement>> get watchedSettlements =>
      _dao.watchGroupSettlements(groupId);
  Future<List<Settlement>> get doneSettlements =>
      _dao.getGroupSettlements(groupId, false);
  Stream<List<Settlement>> get watchedDoneSettlements =>
      _dao.watchGroupSettlements(groupId, false);
  Future<List<Settlement>> get tempSettlements =>
      _dao.getGroupSettlements(groupId, true);
  Stream<List<Settlement>> get watchedTempSettlements =>
      _dao.watchGroupSettlements(groupId, true);

  GroupSettlement(SystemDao _dao, this.groupId) : super(_dao);
}

class GroupTransaction extends BaseData {
  final String groupId;
  Future<List<Transaction>> get transactions =>
      _dao.getGroupTransactions(groupId);
  Stream<List<Transaction>> get watchedTransactions =>
      _dao.watchGroupTransactions(groupId);

  GroupTransaction(SystemDao _dao, this.groupId) : super(_dao);
}

/// The callback type delegator for [GroupActivity] events
typedef bool GroupActivityTrigger(GroupActivityType activityUpdate);

class Contribution {
  final String memberId;
  final double amount;
  final int split;

  Contribution(this.memberId, this.amount, this.split);

  /// to be used as a comparator operator.
  ///
  /// Example:
  /// ```dart
  /// List<Contribution> someList;
  /// // do some stuff & populate someList
  /// someList.sort((a, b) => a > b);
  /// ```
  /// You get a list sorted by [amount]
  operator >(Contribution compared) => this.amount - compared.amount;

  /// to be used as a comparator operator for **_reverse sort_** i.e. Descending order.
  ///
  /// Example:
  /// ```dart
  /// List<Contribution> someList;
  /// // do some stuff & populate someList
  /// someList.sort((a, b) => a < b);
  /// ```
  /// You get a list inversely sorted (bigger to smaller) by [amount]
  operator <(Contribution compared) => compared.amount - this.amount;
}

class GroupActivity extends BaseData {
  final String groupId;
  final GroupAccountMember groupAccountMember;
  final GroupOnlyMember groupMember;
  final GroupSettlement groupSettlement;
  final GroupTransaction groupTransaction;

  GroupActivity(SystemDao _dao, this.groupId)
      : this.groupAccountMember = GroupAccountMember(_dao, groupId),
        this.groupMember = GroupOnlyMember(_dao, groupId),
        this.groupSettlement = GroupSettlement(_dao, groupId),
        this.groupTransaction = GroupTransaction(_dao, groupId),
        super(_dao);

  Group _group;
  Group get group =>
      _group ??= _dao.sharedGroupList.firstWhere((g) => g.id == groupId);
  String get name => _group.name;
  Future<List<Member>> get groupAccounts => groupAccountMember.members;
  Stream<List<Member>> get watchedGroupAccounts =>
      groupAccountMember.watchedMembers;
  Future<List<Member>> get members => groupMember.members;
  Stream<List<Member>> get watchedMembers => groupMember.watchedMembers;
  Future<List<Settlement>> get settlements => groupSettlement.settlements;
  Stream<List<Settlement>> get watchedSettlements =>
      groupSettlement.watchedSettlements;
  Future<List<Settlement>> get doneSettlements =>
      groupSettlement.doneSettlements;
  Stream<List<Settlement>> get watchedDoneSettlements =>
      groupSettlement.watchedDoneSettlements;
  Future<List<Settlement>> get tempSettlements =>
      groupSettlement.tempSettlements;
  Stream<List<Settlement>> get watchedTempSettlements =>
      groupSettlement.watchedTempSettlements;
  Future<List<Transaction>> get transactions => groupTransaction.transactions;
  Stream<List<Transaction>> get watchedTransactions =>
      groupTransaction.watchedTransactions;

  /// Event handler to handle change in [GroupActivity] on runtime.
  ///
  /// Use this to define the application behavior to handle state change
  static GroupActivityTrigger onGroupActivity;

  Future<Member> addMember(String idValue,
      {String id,
      String name,
      String nickName,
      MemberIdType idType = MemberIdType.GroupMember,
      String secondaryIdValue,
      bool isGroupExpense = false}) {
    var result = _dao.addGroupMember(groupId, idValue,
        id: id,
        name: name,
        nickName: nickName,
        idType: idType,
        secondaryIdValue: secondaryIdValue,
        isGroupExpense: isGroupExpense);
    onGroupActivity(GroupActivityType.Member);
    return result;
  }

  Future<Member> addGroupAccount({String idValue}) {
    var result = addMember('$groupAccountPrefix:${idValue ?? name}',
        idType: MemberIdType.Group, isGroupExpense: true);
    onGroupActivity(GroupActivityType.Account);
    return result;
  }

  Future<List<Settlement>> calculateSettlements() async {
    await _dao.deleteTempSettlements(groupId);
    List<Settlement> finalSettlements = await doneSettlements;
    var splitContributions = List<Contribution>();
    (await transactions).forEach((t) {
      var amount = t.amount;
      if (null != t.settlementId) {
        var existingSettlement = finalSettlements.firstWhere(
            (s) => s.id == t.settlementId && t.amount == s.settledAmount);
        if (null != existingSettlement) amount = existingSettlement.amount;
      }
      splitContributions.add(Contribution(t.memberId, amount, 1));
      var participants = t.groupMemberIds.split(',').map((gm) => gm.trim());
      var split = participants.length;
      participants.forEach(
          (p) => splitContributions.add(Contribution(p, amount * -1, split)));
    });
    var allMembers = (await members).map((m) => m.id).toSet();
    var sumContributions = List<Contribution>();
    var needSettlement = false;
    allMembers.forEach((m) {
      var memberContributedAmount = splitContributions
          .where((c) => c.memberId == m)
          .fold(0.0, (sum, c) => sum + (c.amount / c.split));
      sumContributions.add(Contribution(m, memberContributedAmount, 0));
      if (memberContributedAmount > 0) needSettlement = true;
    });
    // sort in descending order
    sumContributions.sort((a, b) => a < b);
    var summedThreshold =
        sumContributions.fold(0.0, (sum, c) => sum + c.amount);

    // todo: calculate optimized settlements

    if (needSettlement) {
      // todo: add new temporary settlements if required
      onGroupActivity(GroupActivityType.Settlement);
    }
    return finalSettlements;
  }

  static Future<bool> isUniqueGroupName(SystemDao _dao, String name) async =>
      !(await _dao.groupWithNameExists(name));

  static Future<GroupActivity> createNew(SystemDao _dao, String name) async {
    var newGroup = await _dao.createGroup(name, GroupType.Shared);
    onGroupActivity(GroupActivityType.GroupActivity);
    return GroupActivity(_dao, newGroup.id);
  }
}
