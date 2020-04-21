part of 'database.dart';

abstract class SystemDao {
  bool get ready;
  Future getReady();
  List<Group> get sharedGroupList;
  Future<List<Member>> getGroupOnlyMembers(String groupId);
  Stream<List<Member>> watchGroupOnlyMembers(String groupId);
  Future<List<Transaction>> getGroupTransactions(String groupId);
  Stream<List<Transaction>> watchGroupTransactions(String groupId);
  Future<List<Group>> getGroups(GroupType type);
  Stream<List<Group>> watchGroups(GroupType type);
  Future<Group> getGroup(String groupId);
  Future<Member> getMember(String memberId);
  Future<Account> getAccount(String accountId);
  Future<bool> groupWithNameExists(String groupName);
  Future<Group> createGroup(String name, [GroupType type = GroupType.Shared]);
  Future<Member> addMember(String idValue,
      {String id,
      String name,
      String nickName,
      MemberIdType idType,
      String secondaryIdValue,
      bool isGroupExpense = false});
  Future<Member> addGroupMember(String groupId, String idValue,
      {String id,
      String name,
      String nickName,
      MemberIdType idType = MemberIdType.GroupMember,
      String secondaryIdValue,
      bool isGroupExpense = false});
}

abstract class SettingsDao {
  bool get ready;
  Future getReady();
}
