import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/db/database.dart';

class BaseData {
  final SystemDao _dao;

  BaseData(this._dao);
}

class GroupOnlyMembers extends BaseData {
  final String groupId;
  Future<List<Member>> get members => _dao.getGroupOnlyMembers(groupId);
  Stream<List<Member>> get watchedMembers =>
      _dao.watchGroupOnlyMembers(groupId);

  GroupOnlyMembers(SystemDao _dao, this.groupId) : super(_dao);
}

class GroupTransactions extends BaseData {
  final String groupId;
  Future<List<Transaction>> get transactions =>
      _dao.getGroupTransactions(groupId);
  Stream<List<Transaction>> get watchedTransactions =>
      _dao.watchGroupTransactions(groupId);

  GroupTransactions(SystemDao _dao, this.groupId) : super(_dao);
}

class GroupActivities extends BaseData {
  final String groupId;
  final GroupOnlyMembers groupMembers;
  final GroupTransactions groupTransactions;

  Group _group;

  Future<Group> get group async => _group ??= await _dao.getGroup(groupId);
  String get name => _group.name;
  Future<List<Member>> get members => groupMembers.members;
  Stream<List<Member>> get watchedMembers => groupMembers.watchedMembers;
  Future<List<Transaction>> get transactions => groupTransactions.transactions;
  Stream<List<Transaction>> get watchedTransactions =>
      groupTransactions.watchedTransactions;

  GroupActivities(SystemDao _dao, this.groupId)
      : this.groupMembers = GroupOnlyMembers(_dao, groupId),
        this.groupTransactions = GroupTransactions(_dao, groupId),
        super(_dao);

  static Future<bool> isUniqueGroupName(SystemDao _dao, String name) async =>
      !(await _dao.groupWithNameExists(name));

  static Future<GroupActivities> createNew(SystemDao _dao, String name) async {
    var newGroup = await _dao.createGroup(name, GroupType.Shared);
    _dao.sharedGroupList.add(newGroup);
    return GroupActivities(_dao, newGroup.id);
  }
}
