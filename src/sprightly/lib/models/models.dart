part of 'db/database.dart';

class GroupOnlyMembers {
  final String groupId;
  List<Member> _members;
  List<Member> get members => _members;

  GroupOnlyMembers(this.groupId);
}

class Settlement {
  final double amount;
  double settledAmount;
  final Member fromMember;
  final Member toMember;

  Settlement(this.amount, this.fromMember, this.toMember);
}
