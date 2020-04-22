part of 'database.dart';

String get groupAccountPrefix => 'GroupAccount';

abstract class SystemDao {
  bool get ready;
  Future getReady();
  List<Group> get sharedGroupList;
  Future<List<Member>> getGroupAccountMembers(String groupId);
  Stream<List<Member>> watchGroupAccountMembers(String groupId);
  Future<List<Member>> getGroupOnlyMembers(String groupId);
  Stream<List<Member>> watchGroupOnlyMembers(String groupId);
  Future<List<Settlement>> getGroupSettlements(String groupId,
      [bool isTemporary]);
  Stream<List<Settlement>> watchGroupSettlements(String groupId,
      [bool isTemporary]);
  Future<int> deleteTempSettlements(String groupId);
  Future<List<Transaction>> getGroupTransactions(String groupId);
  Stream<List<Transaction>> watchGroupTransactions(String groupId);
  Future<List<Group>> getGroups(GroupType type);
  Stream<List<Group>> watchGroups(GroupType type);
  Future<Group> getGroup(String groupId);
  Future<Member> getMember(String memberId);
  Future<Account> getAccount(int accountId);
  Future<bool> groupWithNameExists(String groupName);
  Future<bool> memberWithNameExists(String name);
  Future<Group> createGroup(String name, [GroupType type = GroupType.Shared]);
  Future<Account> addAccount(String name,
      {int parentId, AccountType type, String memberId});
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
