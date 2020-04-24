library sprightly.dao;

import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/db/database.dart';

String get groupAccountPrefix => 'GroupAccount';

abstract class SystemDao {
  bool get ready;
  Future getReady();

  List<Group> get sharedGroupList;

  Future<List<Member>> getGroupAccountMembers(String groupId);
  Stream<List<Member>> watchGroupAccountMembers(String groupId);
  Future<List<Member>> getGroupOnlyMembers(String groupId);
  Stream<List<Member>> watchGroupOnlyMembers(String groupId);
  Future<bool> memberWithNameExists(String name);
  Future<Member> getMember(String memberId);
  Future<Member> addMember(String idValue,
      {String id,
      String name,
      String nickName,
      String avatar,
      MemberIdType idType,
      String secondaryIdValue,
      bool isGroupExpense = false,
      String signature});
  Future<Member> addGroupMember(String groupId, String idValue,
      {String id,
      String name,
      String nickName,
      String avatar,
      MemberIdType idType = MemberIdType.GroupMember,
      String secondaryIdValue,
      bool isGroupExpense = false,
      String signature});
  Future<Member> updateMember(String memberId,
      {String name,
      String nickName,
      String avatar,
      MemberIdType idType,
      String idValue,
      String secondaryIdValue,
      String signature});
  Future<int> deleteMember(String memberId);
  Future<int> deleteMemberFromGroup(String memberId, String groupId);

  Future<List<Settlement>> getGroupSettlements(String groupId,
      {bool isTemporary});
  Stream<List<Settlement>> watchGroupSettlements(String groupId,
      {bool isTemporary});
  Future<Settlement> getSettlement(String settlementId);
  Future<Settlement> newSettlementForGroup(
    String groupId,
    String fromMemberId,
    String toMemberId,
    double amount, {
    String id,
    double settledAmount,
    bool isTemporary = true,
    String transactionId,
    String signature,
  });
  Future<void> addGroupSettlements(
      String groupId, List<Settlement> settlementList);
  Future<bool> finalizeSettlement(String groupId, String id, String signature,
      {double settledAmount, String notes, String attachments});
  Future<int> deleteTempSettlements(String groupId);

  Future<List<Transaction>> getGroupTransactions(String groupId);
  Stream<List<Transaction>> watchGroupTransactions(String groupId);
  Future<Transaction> getTransaction(String transactionId);
  Future<Transaction> addGroupTransaction(
      String groupId, String memberId, double amount,
      {String id,
      String groupMemberIds,
      int fromAccountId,
      int toAccountId,
      int categoryId,
      String settlementId,
      String notes,
      String attachments});
  Future<Transaction> updateTransaction(String transactionId,
      {String memberId,
      double amount,
      String groupMemberIds,
      int fromAccountId,
      int toAccountId,
      int categoryId,
      String notes,
      String attachments});
  Future<int> deleteTransaction(String transactionId);

  Future<Account> getAccount(int accountId);
  Future<Account> addAccount(String name,
      {int parentId, AccountType type, String memberId});
  Future<Account> updateAccount(int accountId,
      {String name, int parentId, AccountType type, String memberId});
  Future<int> deleteAccount(int accountId);

  Future<List<Group>> getGroups(GroupType type);
  Stream<List<Group>> watchGroups(GroupType type);
  Future<bool> groupWithNameExists(String groupName);
  Future<Group> getGroup(String groupId);
  Future<Group> createGroup(String name,
      {GroupType type = GroupType.Shared, bool isHidden = false});
  Future<Group> updateGroup(String groupId,
      {String name, GroupType type, bool isHidden});

  /// Use with caution. No turn-back
  ///
  /// use [updateGroup](groupId, isHidden: true) instead
  Future<int> deleteGroup(String groupId);
}

abstract class SettingsDao {
  bool get ready;
  Future getReady();
}
