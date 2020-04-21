part of 'db/database.dart';

class GroupOnlyMembers {
  final SprightlyDao _dao;
  final String groupId;
  Future<List<Member>> get members => _dao.getGroupOnlyMembers(groupId);
  Stream<List<Member>> get watchedMembers =>
      _dao.watchGroupOnlyMembers(groupId);

  GroupOnlyMembers(this._dao, this.groupId);
}

class GroupTransactions {
  final SprightlyDao _dao;
  final String groupId;
  Future<List<Transaction>> get transactions =>
      _dao.getGroupTransactions(groupId);
  Stream<List<Transaction>> get watchedTransactions =>
      _dao.watchGroupTransactions(groupId);

  GroupTransactions(this._dao, this.groupId);
}

class GroupActivities {
  final SprightlyDao _dao;
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

  GroupActivities(this._dao, this.groupId)
      : this.groupMembers = GroupOnlyMembers(_dao, groupId),
        this.groupTransactions = GroupTransactions(_dao, groupId);

  static Future<GroupActivities> createNew(
      SprightlyDao _dao, String name) async {
    if (!await _dao.groupWithNameExists(name)) {
      var newGroup =
          await _dao.createGroup(name, GroupType.Shared.toEnumString());
      return GroupActivities(_dao, newGroup.id);
    }
    return null;
  }
}
