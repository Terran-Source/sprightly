import 'package:moor/moor.dart';
import 'package:sprightly/extensions/enum_extensions.dart';
import 'package:sprightly/models/constants/enums.dart';

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
  TextColumn get idType => text().customConstraint(
      '${MemberIdType.values.getConstraints('id_type')} NOT NULL')();
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
  TextColumn get type => text().customConstraint(
      '${GroupType.values.getConstraints('type')}'
      'NOT NULL DEFAULT ${Enums.convertToString(GroupType.Shared, true)}')();
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
  TextColumn get groupId => text()
      .withLength(max: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL ON UPDATE CASCADE')();
  TextColumn get memberId => text()
      .withLength(max: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL ON UPDATE CASCADE')();
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
      integer().customConstraint('REFERENCES Accounts(id)')();
  TextColumn get type =>
      text().customConstraint('${AccountType.values.getConstraints('type')}')();
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
      integer().customConstraint('REFERENCES Categories(id)')();
  TextColumn get type => text()
      .customConstraint('${CategoryType.values.getConstraints('type')}')();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("Transaction")
class Transactions extends Table {
  TextColumn get id => text().withLength(max: 18)();
  TextColumn get memberId => text()
      .withLength(max: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL')();
  RealColumn get amount => real()();
  IntColumn get categoryId =>
      integer().customConstraint('REFERENCES Categories(id)')();
  TextColumn get groupId => text()
      .withLength(max: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL')();
  IntColumn get fromAccountId =>
      integer().customConstraint('REFERENCES Accounts(id)')();
  IntColumn get toAccountId =>
      integer().customConstraint('REFERENCES Accounts(id)')();
  TextColumn get notes => text().nullable()();
  TextColumn get attachments => text().nullable()();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(
    tables: [Members, Groups, GroupMembers, Accounts, Categories, Transactions])
class SprightlyData {}
