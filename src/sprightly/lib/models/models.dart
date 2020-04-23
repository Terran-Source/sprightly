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
  /// someList.sort((a, b) => a < b);
  /// ```
  /// You get a list sorted by [amount]
  operator <(Contribution compared) => this.amount - compared.amount;

  /// to be used as a comparator operator for **_reverse sort_** i.e. Descending order.
  ///
  /// Example:
  /// ```dart
  /// List<Contribution> someList;
  /// // do some stuff & populate someList
  /// someList.sort((a, b) => a > b);
  /// ```
  /// You get a list inversely sorted (bigger to smaller) by [amount]
  operator >(Contribution compared) => compared.amount - this.amount;
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
    var positiveContributions = List<Contribution>();
    var negativeContributions = List<Contribution>();
    var needSettlement = false;
    allMembers.forEach((m) {
      var memberContributedAmount = splitContributions
          .where((c) => c.memberId == m)
          .fold(0.0, (sum, c) => sum + (c.amount / c.split));
      if (memberContributedAmount > 0)
        positiveContributions.add(Contribution(m, memberContributedAmount, 0));
      else if (memberContributedAmount < 0)
        negativeContributions.add(Contribution(m, memberContributedAmount, 0));
    });
    needSettlement =
        positiveContributions.length > 0 && negativeContributions.length > 0;
    if (needSettlement) {
      // sort in descending order for positive contributions
      positiveContributions.sort((a, b) => a > b);
      negativeContributions.sort((a, b) => a < b);
      List<String> settledMember = [];
      List<Contribution> alfa;
      List<Contribution> beta;
      bool isPFwd = true;
      if (positiveContributions.length <= negativeContributions.length) {
        alfa = [...positiveContributions];
        beta = [...negativeContributions];
      } else {
        alfa = [...negativeContributions];
        beta = [...positiveContributions];
        isPFwd = false;
      }
      // var summedThreshold =
      //     positiveContributions.fold(0.0, (sum, c) => sum + c.amount) +
      //         negativeContributions.fold(0.0, (sum, c) => sum + c.amount);

      // todo: calculate optimized settlements
      do {
        var aCon = alfa[0];
        var alfaAmountAbs = aCon.amount.abs();
        var sameBIndex =
            beta.indexWhere((bCon) => alfaAmountAbs == bCon.amount.abs());
        if (-1 != sameBIndex) {
          var sameBCon = beta[sameBIndex];
          finalSettlements.add(await _dao.newSettlementForGroup(
              groupId,
              isPFwd ? sameBCon.memberId : aCon.memberId,
              isPFwd ? aCon.memberId : sameBCon.memberId,
              alfaAmountAbs));
          settledMember.add(sameBCon.memberId);
          beta.removeAt(sameBIndex);
        } else {
          var greaterBIndex =
              beta.indexWhere((bCon) => alfaAmountAbs < bCon.amount.abs());
          if (-1 != greaterBIndex) {
            var greaterBCon = beta[greaterBIndex];
            var remainingBConAmount = greaterBCon.amount + aCon.amount;
            finalSettlements.add(await _dao.newSettlementForGroup(
                groupId,
                isPFwd ? greaterBCon.memberId : aCon.memberId,
                isPFwd ? aCon.memberId : greaterBCon.memberId,
                alfaAmountAbs));
            beta.add(
                Contribution(greaterBCon.memberId, remainingBConAmount, 0));
            beta.removeAt(greaterBIndex);
          }
        }
        settledMember.add(aCon.memberId);
        alfa.removeAt(0);
      } while (alfa.length > 0);

      // positiveContributions.forEach((pCon) async {
      //   var sameNCon = negativeContributions
      //       .firstWhere((nCon) => pCon.amount == nCon.amount.abs());
      //   if (null != sameNCon) {
      //     finalSettlements.add(await _dao.newSettlementForGroup(
      //         groupId, sameNCon.memberId, pCon.memberId, pCon.amount));
      //     settledMember.addAll([sameNCon.memberId, pCon.memberId]);
      //     //positiveContributions.remove(value)
      //   } else {}
      // });

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
