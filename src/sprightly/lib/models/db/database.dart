import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:sprightly/utils/file_provider.dart';

part 'database.g.dart';

// class DataTable extends Table {
//   DateTimeColumn get createdOn =>
//       dateTime().clientDefault(() => DateTime.now().toUtc())();
//   DateTimeColumn get updatedOn =>
//       dateTime().clientDefault(() => DateTime.now().toUtc())();
// }

const String appDataDbFile = 'sprightly_db.lite';
const String userDataDbFile = 'sprightly_user.lite';

@DataClassName("Member")
class Members extends Table {
  TextColumn get id => text().withLength(max: 16)();
  TextColumn get name => text().nullable().withLength(max: 50)();
  TextColumn get nickName => text().withLength(max: 10)();
  BlobColumn get avatar => blob().nullable()();
  TextColumn get idType => text().customConstraint(
      "CHECK (id_type IN ('Phone', 'Email', 'NickName', 'Group')) NOT NULL")();
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
  TextColumn get type => text()
      .nullable()
      .customConstraint("CHECK (type IN ('Personal', 'Budget', 'Shared'))"
          " NOT NULL DEFAULT 'Shared'")();
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
  IntColumn get parentId => integer()
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULLABLE')();
  TextColumn get type => text().nullable().customConstraint(
      "CHECK (type IN ('Group', 'Cash', 'Credit', 'Bank', 'Investment')) NULLABLE")();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 15)();
  IntColumn get parentId => integer()
      .nullable()
      .customConstraint('REFERENCES Categories(id) NULLABLE')();
  TextColumn get type => text().nullable().customConstraint(
      "CHECK (type IN ('Expense', 'Liability', 'Income', 'Investment', 'Misc'))"
      " NOT NULL DEFAULT 'Misc'")();
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
  IntColumn get categoryId => integer()
      .nullable()
      .customConstraint('REFERENCES Categories(id) NULLABLE')();
  TextColumn get groupId => text()
      .withLength(max: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL')();
  IntColumn get fromAccountId =>
      integer().customConstraint('REFERENCES Accounts(id) NOT NULL')();
  IntColumn get toAccountId => integer()
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULLABLE')();
  TextColumn get notes => text().nullable()();
  TextColumn get attachments => text().nullable()();
  DateTimeColumn get createdOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

LazyDatabase _openConnection(String dbFile, [bool isSupportFile = false]) =>
    LazyDatabase(() async => VmDatabase(await getFile(dbFile, isSupportFile)));

@UseMoor(
    tables: [Members, Groups, GroupMembers, Accounts, Categories, Transactions])
class SprightlyData extends _$SprightlyData {
  SprightlyData() : super(_openConnection(appDataDbFile));

  @override
  int get schemaVersion => 1;
}
