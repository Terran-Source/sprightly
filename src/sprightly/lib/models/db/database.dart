import 'dart:async';

import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:sprightly/extensions/enum_extensions.dart';
import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/utils/file_provider.dart';
import 'package:sprightly/utils/happy_hash.dart';

part 'database.g.dart';
part '../models.dart';

const String appDataDbFile = 'sprightly_db.lite';
const String setupDataDbFile = 'sprightly_setup.lite';
const int hashedIdMinLength = 16;
const int uniqueRetry = 5;

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
      .nullable()
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
      .nullable()
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
      .nullable()
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
      .nullable()
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
      .nullable()
      .clientDefault(() => DateTime.now().toUtc())();
}

@DataClassName("Settlement")
class Settlements extends Table {
  @override
  String get tableName => "Settlements";

  TextColumn get id => text().named('id').withLength(min: 16)();
  TextColumn get groupId => text()
      .named('groupId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL')();
  TextColumn get fromMemberId => text()
      .named('fromMemberId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL')();
  TextColumn get toMemberId => text()
      .named('toMemberId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL')();
  RealColumn get amount => real().named('amount')();
  RealColumn get settledAmount => real().named('settledAmount').nullable()();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .nullable()
      .clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {id};
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
  IntColumn get settlementId => integer()
      .named('settlementId')
      .nullable()
      .customConstraint('REFERENCES Settlements(id) NULLABLE')();
  TextColumn get notes => text().named('notes').nullable()();
  TextColumn get attachments => text().named('attachments').nullable()();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .nullable()
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
      .nullable()
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
      .nullable()
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
      .nullable()
      .clientDefault(() => DateTime.now().toUtc())();
}
//#endregion Database: sprightly_setup
//#endregion Database

//#region Custom query & classes
class SprightlyQueries {
  static SprightlyQueries _cache = SprightlyQueries();
  bool initialized = false;
  bool _working = false;
  String _selectGroupOnlyMembers = "selectGroupOnlyMembers";
  String get selectGroupOnlyMembers => _selectGroupOnlyMembers;
  String _selectGroupTransactions = "selectGroupTransactions";
  String get selectGroupTransactions => _selectGroupTransactions;

  factory SprightlyQueries() => _cache;

  Future _init() async {
    if (!initialized && !_working) {
      _working = true;
      _selectGroupOnlyMembers = await getSqlQuery(_selectGroupOnlyMembers);
      _selectGroupTransactions = await getSqlQuery(_selectGroupTransactions);
      initialized = true;
      _working = false;
    }
  }
}

mixin _GenericDaoMixin<T extends GeneratedDatabase> on DatabaseAccessor<T> {
  SprightlyQueries _queries = SprightlyQueries();

  bool get ready => _queries.initialized;

  Future getReady() => _queries._init();

  Future<String> uniqueId(String tableName, List<String> items) async {
    var result = '';
    var foundUnique = false;
    var attempts = 0;
    do {
      var hashFunc = HashLibrary.values.random;
      result =
          hashedAll(items, hashLength: hashedIdMinLength, library: hashFunc);
      foundUnique = !await recordWithIdExists(tableName, result);
      attempts++;
    } while (attempts < uniqueRetry && !foundUnique);
    throw TimeoutException(
        'Can not found a suitable unique Id for $tableName after $attempts attempts');
  }

  Future<bool> recordWithIdExists(String tableName, String id) async =>
      await customSelectQuery(
        "SELECT COUNT(1) AS counting FROM $tableName g WHERE g.id=:id",
        variables: [Variable.withString(id)],
      ).map((row) => row.readInt("counting")).getSingle() >
      0;
}
//#endregion Custom query & classes

@UseDao(
  tables: [
    Members,
    Groups,
    GroupMembers,
    Accounts,
    Categories,
    Settlements,
    Transactions
  ],
)
class SprightlyDao extends DatabaseAccessor<SprightlyDatabase>
    with _$SprightlyDaoMixin, _GenericDaoMixin {
  SprightlyDao(SprightlyDatabase _db) : super(_db);

  Selectable<Member> _selectGroupOnlyMembers(String groupId) =>
      customSelectQuery(
        _queries.selectGroupOnlyMembers,
        variables: [Variable.withString(groupId)],
        readsFrom: {members, groupMembers},
      ).map((row) => Member.fromJson(row.data));

  Future<List<Member>> getGroupOnlyMembers(String groupId) =>
      _selectGroupOnlyMembers(groupId).get();

  Stream<List<Member>> watchGroupOnlyMembers(String groupId) =>
      _selectGroupOnlyMembers(groupId).watch();

  Selectable<Transaction> _selectGroupTransactions(String groupId) =>
      customSelectQuery(
        _queries.selectGroupTransactions,
        variables: [Variable.withString(groupId)],
        readsFrom: {transactions, groups},
      ).map((row) => Transaction.fromJson(row.data));

  Future<List<Transaction>> getGroupTransactions(String groupId) =>
      _selectGroupTransactions(groupId).get();

  Stream<List<Transaction>> watchGroupTransactions(String groupId) =>
      _selectGroupTransactions(groupId).watch();

  Future<Group> getGroup(String groupId) =>
      (select(groups)..where((g) => g.id.equals(groupId))).getSingle();

  Future<bool> groupWithNameExists(String groupName) async =>
      await customSelectQuery(
        "SELECT COUNT(1) AS counting FROM Groups g WHERE g.name=:groupName",
        variables: [Variable.withString(groupName)],
        readsFrom: {groups},
      ).map((row) => row.readInt("counting")).getSingle() >
      0;

  Future<Group> createGroup(String name, String type) async {
    var groupId = await uniqueId('Groups', [name]);
    var newGroupComp = GroupsCompanion(
        id: Value(groupId), name: Value(name), type: Value(type));
    await into(groups).insert(newGroupComp);
    return getGroup(groupId);
  }
}

@UseDao(
  tables: [AppFonts, FontCombos, ColorCombos],
)
class SprightlySetupDao extends DatabaseAccessor<SprightlySetupDatabase>
    with _$SprightlySetupDaoMixin, _GenericDaoMixin {
  SprightlySetupDao(SprightlySetupDatabase _db) : super(_db);
}

LazyDatabase _openConnection(String dbFile,
        {bool isSupportFile = false, bool logStatements = false}) =>
    LazyDatabase(() async => VmDatabase(await getFile(dbFile, isSupportFile),
        logStatements: logStatements));

@UseMoor(
  tables: [
    Members,
    Groups,
    GroupMembers,
    Accounts,
    Categories,
    Settlements,
    Transactions
  ],
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
