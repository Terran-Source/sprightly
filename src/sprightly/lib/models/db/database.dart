import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:sprightly/utils/file_provider.dart';

part 'database.g.dart';
part '../models.dart';

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
      "CHECK (idType IN ('Phone','Email','NickName','Group','GroupMember')) NOT NULL")();
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
      .customConstraint("CHECK (type IN ('Personal','Budget','Shared'))"
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
      "CHECK (type IN ('Group','Cash','Credit','Bank','Investment')) NULLABLE")();
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
      "CHECK (type IN ('Expense','Liability','Income','Investment','Misc'))"
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

  TextColumn get id => text().named('id').withLength(min: 16)();
  TextColumn get memberId => text()
      .named('memberId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL')();
  RealColumn get amount => real().named('amount')();
  TextColumn get groupId => text()
      .named('groupId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL')();
  TextColumn get groupMemberIds => text().named('groupMemberIds').nullable()();
  IntColumn get fromAccountId => integer()
      .named('fromAccountId')
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULLABLE')();
  IntColumn get toAccountId => integer()
      .named('toAccountId')
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULLABLE')();
  IntColumn get categoryId => integer()
      .named('categoryId')
      .nullable()
      .customConstraint('REFERENCES Categories(id) NULLABLE')();
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
      .customConstraint("CHECK (type IN ('Regular','Mono')) NOT NULL")();
  TextColumn get style => text().named('style').customConstraint(
      "CHECK (style IN ('Regular','Italic','Bold','BoldItalic')) NOT NULL")();
  IntColumn get weight =>
      integer().named('weight').withDefault(const Constant(100))();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("FontCombo")
class FontCombos extends Table {
  @override
  String get tableName => "FontCombos";

  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get name => text().named('name').withLength(max: 50)();
  IntColumn get headerFont => integer()
      .named('headerFont')
      .customConstraint('REFERENCES AppFonts(id) NOT NULL')();
  IntColumn get bodyFont => integer()
      .named('bodyFont')
      .customConstraint('REFERENCES AppFonts(id) NOT NULL')();
  IntColumn get bodyFontBig => integer()
      .named('bodyFontBig')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id)')();
  IntColumn get bodyFontMedium => integer()
      .named('bodyFontMedium')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id)')();
  IntColumn get bodyFontSmall => integer()
      .named('bodyFontSmall')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id)')();
  IntColumn get bodyFontTiny => integer()
      .named('bodyFontTiny')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id)')();
  IntColumn get valueFont => integer()
      .named('valueFont')
      .customConstraint('REFERENCES AppFonts(id) NOT NULL')();
  IntColumn get valueFontBig => integer()
      .named('valueFontBig')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id)')();
  IntColumn get valueFontMedium => integer()
      .named('valueFontMedium')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id)')();
  IntColumn get valueFontSmall => integer()
      .named('valueFontSmall')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id)')();
  IntColumn get valueFontTiny => integer()
      .named('valueFontTiny')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id)')();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("ColorCombo")
class ColorCombos extends Table {
  @override
  String get tableName => "ColorCombos";

  IntColumn get id => integer().named('id').autoIncrement()();
  TextColumn get name => text().named('name').withLength(max: 50)();
  TextColumn get mode => text()
      .named('mode')
      .customConstraint("CHECK (mode IN ('Bright','Dark')) NOT NULL")();
  TextColumn get backColor =>
      text().named('backColor').withLength(min: 3, max: 6)();
  TextColumn get foreColor =>
      text().named('foreColor').withLength(min: 3, max: 6)();
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
String get groupOnlyMembersQuery => "SELECT m.*"
    " FROM Members m"
    " JOIN GroupMembers gm ON gm.memberId=m.id"
    " WHERE idType='GroupMember' AND gm.groupId=:groupId";
//#endregion Custom query & classes

LazyDatabase _openConnection(String dbFile,
        {bool isSupportFile = false, bool logStatements = false}) =>
    LazyDatabase(() async => VmDatabase(await getFile(dbFile, isSupportFile),
        logStatements: logStatements));

@UseDao(
  tables: [Members, Groups, GroupMembers, Accounts, Categories, Transactions],
)
class SprightlyDao extends DatabaseAccessor<SprightlyDatabase>
    with _$SprightlyDaoMixin {
  SprightlyDao(SprightlyDatabase _db) : super(_db);

  Selectable<Member> selectGroupOnlyMembers(String groupId) =>
      customSelectQuery(
        groupOnlyMembersQuery,
        variables: [Variable.withString(groupId)],
        readsFrom: {members, groupMembers},
      ).map((row) => Member.fromJson(row.data));

  Future<List<Member>> getGroupOnlyMembers(String groupId) {
    return selectGroupOnlyMembers(groupId).get();
  }

  Stream<List<Member>> watchGroupOnlyMembers(String groupId) {
    return selectGroupOnlyMembers(groupId).watch();
  }
}

@UseDao(
  tables: [AppFonts, FontCombos, ColorCombos],
)
class SprightlySetupDao extends DatabaseAccessor<SprightlySetupDatabase>
    with _$SprightlySetupDaoMixin {
  SprightlySetupDao(SprightlySetupDatabase _db) : super(_db);
}

@UseMoor(
  tables: [Members, Groups, GroupMembers, Accounts, Categories, Transactions],
  daos: [SprightlyDao],
)
class SprightlyDatabase extends _$SprightlyDatabase {
  SprightlyDatabase({bool enableDebug = false})
      : super(_openConnection(appDataDbFile, logStatements: enableDebug));

  @override
  int get schemaVersion => 1;
}

@UseMoor(
  tables: [AppFonts, FontCombos, ColorCombos],
  daos: [SprightlySetupDao],
)
class SprightlySetupDatabase extends _$SprightlySetupDatabase {
  SprightlySetupDatabase({bool enableDebug = false})
      : super(_openConnection(setupDataDbFile, logStatements: enableDebug));

  @override
  int get schemaVersion => 1;
}
