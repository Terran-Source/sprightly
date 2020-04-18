import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:sprightly/utils/file_provider.dart';

part 'database.g.dart';

const String appDataDbFile = 'sprightly_db.lite';
const String setupDataDbFile = 'sprightly_setup.lite';

//#region Database
//#region Database: sprightly_db
@DataClassName("Member")
class Members extends Table {
  @override
  String get tableName => "Members";

  TextColumn get id => text().named('id').withLength(min: 16)();
  TextColumn get name => text().named('name').nullable().withLength(max: 50)();
  TextColumn get nickName => text().named('nickName').withLength(max: 10)();
  BlobColumn get avatar => blob().named('avatar').nullable()();
  TextColumn get idType => text().named('idType').customConstraint(
      "CHECK (idType IN ('Phone', 'Email', 'NickName', 'Group')) NOT NULL")();
  TextColumn get idValue => text().named('idValue').withLength(max: 50)();
  TextColumn get secondaryIdValue =>
      text().named('secondaryIdValue').nullable().withLength(max: 50)();
  BoolColumn get isGroupExpense =>
      boolean().named('isGroupExpense').withDefault(const Constant(false))();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("Group")
class Groups extends Table {
  @override
  String get tableName => "Groups";

  TextColumn get id => text().named('id').withLength(min: 16)();
  TextColumn get name => text().named('name').withLength(max: 50)();
  TextColumn get type => text()
      .named('type')
      .nullable()
      .customConstraint("CHECK (type IN ('Personal', 'Budget', 'Shared'))"
          " NOT NULL DEFAULT 'Shared'")();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("GroupMember")
class GroupMembers extends Table {
  @override
  String get tableName => "GroupMembers";

  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get groupId => text()
      .named('groupId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL ON UPDATE CASCADE')();
  TextColumn get memberId => text()
      .named('memberId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL ON UPDATE CASCADE')();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName("Account")
class Accounts extends Table {
  @override
  String get tableName => "Accounts";

  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get name => text().named('name').withLength(max: 15)();
  IntColumn get parentId => integer()
      .named('parentId')
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULLABLE')();
  TextColumn get type => text().named('type').nullable().customConstraint(
      "CHECK (type IN ('Group', 'Cash', 'Credit', 'Bank', 'Investment')) NULLABLE")();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("Category")
class Categories extends Table {
  @override
  String get tableName => "Categories";

  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get name => text().named('name').withLength(max: 15)();
  IntColumn get parentId => integer()
      .named('parentId')
      .nullable()
      .customConstraint('REFERENCES Categories(id) NULLABLE')();
  TextColumn get type => text().named('type').nullable().customConstraint(
      "CHECK (type IN ('Expense', 'Liability', 'Income', 'Investment', 'Misc'))"
      " NOT NULL DEFAULT 'Misc'")();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("Transaction")
class Transactions extends Table {
  @override
  String get tableName => "Transactions";

  TextColumn get id => text().named('id').withLength(min: 18)();
  TextColumn get memberId => text()
      .named('memberId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL')();
  RealColumn get amount => real().named('amount')();
  IntColumn get categoryId => integer()
      .named('categoryId')
      .nullable()
      .customConstraint('REFERENCES Categories(id) NULLABLE')();
  TextColumn get groupId => text()
      .named('groupId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL')();
  IntColumn get fromAccountId => integer()
      .named('fromAccountId')
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULLABLE')();
  IntColumn get toAccountId => integer()
      .named('toAccountId')
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULLABLE')();
  TextColumn get notes => text().named('notes').nullable()();
  TextColumn get attachments => text().named('attachments').nullable()();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
}

//#endregion Database: sprightly_db
//#region Database: sprightly_setup
@DataClassName("AppFont")
class AppFonts extends Table {
  @override
  String get tableName => "AppFonts";

  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get name => text().named('name').withLength(max: 50)();
  TextColumn get family => text().named('family').withLength(max: 20)();
  TextColumn get type => text()
      .named('type')
      .customConstraint("CHECK (type IN ('Regular', 'Mono')) NOT NULL")();
  TextColumn get style => text().named('style').customConstraint(
      "CHECK (style IN ('Regular', 'Italic', 'Bold', 'BoldItalic')) NOT NULL")();
  IntColumn get weight =>
      integer().named('weight').withDefault(const Constant(100))();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();
}
//#endregion Database: sprightly_setup
//#endregion Database

//#region Custom query & classes
const String groupOnlyMembersQuery = "SELECT m.* "
    "FROM Members m"
    " JOIN GroupMembers gm ON gm.memberId=m.id"
    " WHERE idType='Group' AND gm.groupId=:groupId";

class GroupOnlyMembers {
  final String groupId;
  List<Member> _members;
  List<Member> get members => _members;

  GroupOnlyMembers(this.groupId);
}
//#endregion Custom query & classes

LazyDatabase _openConnection(String dbFile, [bool isSupportFile = false]) =>
    LazyDatabase(() async => VmDatabase(await getFile(dbFile, isSupportFile)));

@UseMoor(
    tables: [Members, Groups, GroupMembers, Accounts, Categories, Transactions],
    queries: {'groupOnlyMembers': groupOnlyMembersQuery})
class SprightlyData extends _$SprightlyData {
  SprightlyData() : super(_openConnection(appDataDbFile));

  @override
  int get schemaVersion => 1;
}

@UseMoor(tables: [AppFonts])
class SprightlySetupData extends _$SprightlySetupData {
  SprightlySetupData() : super(_openConnection(setupDataDbFile));

  @override
  int get schemaVersion => 1;
}
