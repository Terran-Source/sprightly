import 'package:moor/moor.dart';

part 'database.g.dart';

// class DataTable extends Table {
//   DateTimeColumn get createdOn =>
//       dateTime().clientDefault(() => DateTime.now().toUtc())();
//   DateTimeColumn get updatedOn =>
//       dateTime().clientDefault(() => DateTime.now().toUtc())();
// }

@DataClassName("Member")
class Members extends Table {
  TextColumn get id => text().withLength(max: 16)();
  TextColumn get name => text().nullable().withLength(max: 50)();
  TextColumn get nickName => text().withLength(max: 10)();
  BlobColumn get avatar => blob().nullable()();
  // EnumColumn<MemberIdType> get idType => enumText<MemberIdType>(MemberIdType.values)();
  TextColumn get idValue => text().withLength(max: 50)();
  TextColumn get secondaryIdValue => text().nullable().withLength(max: 50)();
  @JsonKey("isGroupExpense")
  BoolColumn get groupExpense => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("Group")
class Groups extends Table {
  TextColumn get id => text().withLength(max: 16)();
  TextColumn get name => text().withLength(max: 50)();
  // EnumColumn<GroupType> get idType => enumText<GroupType>(GroupType.values)();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("GroupMember")
class GroupMembers extends Table {
  TextColumn get id => text().withLength(max: 16)();
  TextColumn get groupId =>
      text().withLength(max: 16).customConstraint('REFERENCES Groups(id)')();
  TextColumn get memberId =>
      text().withLength(max: 16).customConstraint('REFERENCES Members(id)')();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("Account")
class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 15)();
  IntColumn get parentId =>
      integer().customConstraint('NULLABLE REFERENCES Accounts(id)')();
  // EnumColumn<CategoryType> get idType => enumText<CategoryType>(CategoryType.values)();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 15)();
  IntColumn get parentId =>
      integer().customConstraint('NULLABLE REFERENCES Categories(id)')();
  // EnumColumn<AccountType> get idType => enumText<AccountType>(AccountType.values)();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("Transaction")
class Transactions extends Table {
  TextColumn get id => text().withLength(max: 18)();
  TextColumn get memberId =>
      text().withLength(max: 16).customConstraint('REFERENCES Members(id)')();
  RealColumn get amount => real()();
  IntColumn get categoryId =>
      integer().customConstraint('NULLABLE REFERENCES Categories(id)')();
  TextColumn get groupId => text()
      .withLength(max: 16)
      .customConstraint('NULLABLE REFERENCES Groups(id)')();
  IntColumn get fromAccountId =>
      integer().customConstraint('NULLABLE REFERENCES Accounts(id)')();
  IntColumn get toAccountId =>
      integer().customConstraint('NULLABLE REFERENCES Accounts(id)')();
  TextColumn get notes => text().nullable()();
  TextColumn get attachments => text().nullable()();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}
