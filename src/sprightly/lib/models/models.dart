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

class GroupActivity extends BaseData {
  final String groupId;
  final GroupAccountMember groupAccountMembers;
  final GroupOnlyMember groupMembers;
  final GroupTransaction groupTransactions;

  GroupActivity(SystemDao _dao, this.groupId)
      : this.groupAccountMembers = GroupAccountMember(_dao, groupId),
        this.groupMembers = GroupOnlyMember(_dao, groupId),
        this.groupTransactions = GroupTransaction(_dao, groupId),
        super(_dao);

  Group _group;
  Group get group =>
      _group ??= _dao.sharedGroupList.firstWhere((g) => g.id == groupId);
  String get name => _group.name;
  Future<List<Member>> get groupAccounts => groupAccountMembers.members;
  Stream<List<Member>> get watchedGroupAccounts =>
      groupAccountMembers.watchedMembers;
  Future<List<Member>> get members => groupMembers.members;
  Stream<List<Member>> get watchedMembers => groupMembers.watchedMembers;
  Future<List<Transaction>> get transactions => groupTransactions.transactions;
  Stream<List<Transaction>> get watchedTransactions =>
      groupTransactions.watchedTransactions;

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

  static Future<bool> isUniqueGroupName(SystemDao _dao, String name) async =>
      !(await _dao.groupWithNameExists(name));

  static Future<GroupActivity> createNew(SystemDao _dao, String name) async {
    var newGroup = await _dao.createGroup(name, GroupType.Shared);
    onGroupActivity(GroupActivityType.GroupActivity);
    return GroupActivity(_dao, newGroup.id);
  }
}
