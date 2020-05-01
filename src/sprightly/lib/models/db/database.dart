library sprightly.moor_database;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:sprightly/extensions/enum_extensions.dart';
import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/dao.dart';
import 'package:sprightly/utils/file_provider.dart';
import 'package:sprightly/utils/happy_hash.dart';

part 'database.g.dart';

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
  TextColumn get nickName =>
      text().named('nickName').nullable().withLength(max: 10)();
  TextColumn get avatar => text().named('avatar').nullable()();
  TextColumn get idType => text().named('idType').customConstraint(
      "CHECK (idType IN ('Phone','Email','NickName','Group','GroupMember')) NOT NULL")();
  TextColumn get idValue => text().named('idValue').withLength(max: 50)();
  TextColumn get secondaryIdValue =>
      text().named('secondaryIdValue').nullable().withLength(max: 50)();
  BoolColumn get isGroupExpense =>
      boolean().named('isGroupExpense').withDefault(const Constant(false))();
  TextColumn get signature => text().named('signature').nullable()();
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
  BoolColumn get isHidden =>
      boolean().named('isHidden').withDefault(const Constant(false))();
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
  TextColumn get groupId => text()
      .named('groupId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL ON UPDATE CASCADE')();
  IntColumn get parentId => integer()
      .named('parentId')
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULL ON UPDATE CASCADE')();
  TextColumn get type => text().named('type').nullable().customConstraint(
      "CHECK (type IN ('Group','Cash','Credit','Bank','Investment')) NULL")();
  TextColumn get memberId => text()
      .named('memberId')
      .nullable()
      .withLength(min: 16)
      .customConstraint('REFERENCES Members(id) NULL ON UPDATE CASCADE')();
  RealColumn get balance =>
      real().named('balance').withDefault(const Constant(0))();
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
      .customConstraint('REFERENCES Categories(id) NULL ON UPDATE CASCADE')();
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
      .customConstraint('REFERENCES Groups(id) NOT NULL ON UPDATE CASCADE')();
  TextColumn get fromMemberId => text()
      .named('fromMemberId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL ON UPDATE CASCADE')();
  TextColumn get toMemberId => text()
      .named('toMemberId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Members(id) NOT NULL ON UPDATE CASCADE')();
  RealColumn get amount => real().named('amount')();
  RealColumn get settledAmount => real().named('settledAmount').nullable()();
  BoolColumn get isTemporary =>
      boolean().named('isTemporary').withDefault(const Constant(true))();
  TextColumn get transactionId => text()
      .named('transactionId')
      .nullable()
      .withLength(min: 16)
      .customConstraint('REFERENCES Transactions(id) NULL ON UPDATE CASCADE')();
  TextColumn get signature => text().named('signature').nullable()();
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
      .customConstraint('REFERENCES Members(id) NOT NULL ON UPDATE CASCADE')();
  RealColumn get amount => real().named('amount')();
  TextColumn get groupId => text()
      .named('groupId')
      .withLength(min: 16)
      .customConstraint('REFERENCES Groups(id) NOT NULL ON UPDATE CASCADE')();
  TextColumn get groupMemberIds => text().named('groupMemberIds').nullable()();
  IntColumn get fromAccountId => integer()
      .named('fromAccountId')
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULL ON UPDATE CASCADE')();
  IntColumn get toAccountId => integer()
      .named('toAccountId')
      .nullable()
      .customConstraint('REFERENCES Accounts(id) NULL ON UPDATE CASCADE')();
  IntColumn get categoryId => integer()
      .named('categoryId')
      .nullable()
      .customConstraint('REFERENCES Categories(id) NULL ON UPDATE CASCADE')();
  TextColumn get settlementId => text()
      .named('settlementId')
      .nullable()
      .customConstraint('REFERENCES Settlements(id) NULL ON UPDATE CASCADE')();
  TextColumn get notes => text().named('notes').nullable()();
  TextColumn get attachments => text().named('attachments').nullable()();
  TextColumn get tags => text().named('tags').nullable()();
  DateTimeColumn get doneOn =>
      dateTime().named('doneOn').clientDefault(() => DateTime.now().toUtc())();
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
      .customConstraint('REFERENCES AppFonts(id) NOT NULL ON UPDATE CASCADE')();
  IntColumn get bodyFont => integer()
      .named('bodyFont')
      .customConstraint('REFERENCES AppFonts(id) NOT NULL ON UPDATE CASCADE')();
  IntColumn get bodyFontBig => integer()
      .named('bodyFontBig')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id) NULL ON UPDATE CASCADE')();
  IntColumn get bodyFontMedium => integer()
      .named('bodyFontMedium')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id) NULL ON UPDATE CASCADE')();
  IntColumn get bodyFontSmall => integer()
      .named('bodyFontSmall')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id) NULL ON UPDATE CASCADE')();
  IntColumn get bodyFontTiny => integer()
      .named('bodyFontTiny')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id) NULL ON UPDATE CASCADE')();
  IntColumn get valueFont => integer()
      .named('valueFont')
      .customConstraint('REFERENCES AppFonts(id) NOT NULL ON UPDATE CASCADE')();
  IntColumn get valueFontBig => integer()
      .named('valueFontBig')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id) NULL ON UPDATE CASCADE')();
  IntColumn get valueFontMedium => integer()
      .named('valueFontMedium')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id) NULL ON UPDATE CASCADE')();
  IntColumn get valueFontSmall => integer()
      .named('valueFontSmall')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id) NULL ON UPDATE CASCADE')();
  IntColumn get valueFontTiny => integer()
      .named('valueFontTiny')
      .nullable()
      .customConstraint('REFERENCES AppFonts(id) NULL ON UPDATE CASCADE')();
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

@DataClassName("AppSetting")
class AppSettings extends Table {
  @override
  String get tableName => "AppSettings";

  TextColumn get name => text().named('name').withLength(max: 50)();
  TextColumn get value => text().named('value')();
  TextColumn get type => text().named('type').nullable().customConstraint(
      "CHECK (type IN ('String','Number','Bool','List','AppInfo')) NOT NULL  DEFAULT 'String'")();
  DateTimeColumn get createdOn => dateTime()
      .named('createdOn')
      .clientDefault(() => DateTime.now().toUtc())();
  DateTimeColumn get updatedOn => dateTime()
      .named('updatedOn')
      .nullable()
      .clientDefault(() => DateTime.now().toUtc())();

  @override
  Set<Column> get primaryKey => {name};
}
//#endregion Database: sprightly_setup
//#endregion Database

//#region Custom query & classes
/// asset path for custom sql files
String get sqlAssetDirectory => 'assets/queries_min';
Future<String> _getSqlQueryFromAsset(String fileName) => getAssetText(fileName,
    assetDirectory: sqlAssetDirectory, extension: '.sql');
Future<String> _getSqlQueryFromRemote(CustomQuery customQuery) =>
    RemoteFileCache.current.getRemoteText(customQuery.source,
        identifier: customQuery.identifier, headers: customQuery.headers);

enum SourceFrom { Asset, Web }

/// Used to get complex queries from outside.
///
/// Either a filename(without extension) inside [sqlAssetDirectory]
/// or an accessible web address of the file
///
/// Example:
/// ```dart
/// var customQueryFromFile = CustomQuery.fromAsset('queryFileName');
/// // or
/// var customQueryFromWeb = CustomQuery.fromWeb('customQueryFromWeb',
///   'https://example.com/some/source/queryFileName.sql');
/// // or if any custom header is required
/// var customQueryFromWeb = CustomQuery.fromWeb('customQueryFromWeb',
///   'https://example.com/some/source/queryFileName.sql',
///   headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
/// ```
class CustomQuery {
  /// Either a filename(without extension) inside [sqlAssetDirectory]
  /// or an accessible web address of the file
  ///
  /// Example:
  /// ```dart
  /// var customQueryFromFile = CustomQuery.fromAsset('queryFileName');
  /// // or
  /// var customQueryFromWeb = CustomQuery.fromWeb('customQueryFromWeb',
  ///   'https://example.com/some/source/queryFileName.sql');
  /// // or if any custom header is required
  /// var customQueryFromWeb = CustomQuery.fromWeb('customQueryFromWeb',
  ///   'https://example.com/some/source/queryFileName.sql',
  ///   headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  /// ```
  final String source;
  final String identifier;
  final SourceFrom _from;
  final Map<String, String> headers;

  String _query;

  CustomQuery._(this.source, this._from, this.identifier,
      {this.headers = const {}});

  factory CustomQuery.fromAsset(String fileNameWithoutExtension,
          {String identifier}) =>
      CustomQuery._(fileNameWithoutExtension, SourceFrom.Asset,
          identifier ?? fileNameWithoutExtension);

  factory CustomQuery.fromWeb(String identifier, String address,
      {Map<String, String> headers = const {}}) {
    Uri.parse(address);
    return CustomQuery._(address, SourceFrom.Web, identifier, headers: headers);
  }

  Future<String> _load() {
    switch (_from) {
      case SourceFrom.Asset:
        return compute(_getSqlQueryFromAsset, source);
      case SourceFrom.Web:
        return compute(_getSqlQueryFromRemote, this);
      default:
        return null;
    }
  }

  /// Asynchronously load the sql file content
  Future<String> load() async => _query ??= await _load();

  /// the actual sql statements after the [load] is called at least once
  String get query => _query;
}

class SprightlyQueries {
  static SprightlyQueries _cache = SprightlyQueries();
  factory SprightlyQueries() => _cache;

  bool initialized = false;
  bool _working = false;

  // startup queries
  CustomQuery get defaultStartupStatement =>
      CustomQuery.fromAsset("defaultStartupStatement");

  // custom queries
  CustomQuery get selectGroupAccountMembers =>
      CustomQuery.fromAsset("selectGroupAccountMembers");
  CustomQuery get selectGroupOnlyMembers =>
      CustomQuery.fromAsset("selectGroupOnlyMembers");
  CustomQuery get selectGroupSettlements =>
      CustomQuery.fromAsset("selectGroupSettlements");
  CustomQuery get selectGroupTransactions =>
      CustomQuery.fromAsset("selectGroupTransactions");

  // beforeOpen queries
  CustomQuery get dataInitiation => CustomQuery.fromAsset("dataInitiation");
  CustomQuery get setupInitiation => CustomQuery.fromAsset("setupInitiation");

  // Migration queries
  Map<int, CustomQuery> dataMigrations = {
    // 1: CustomQuery.fromWeb("sprightly.moor_database.dataMigrationFrom1",
    //     'https://example.com/some/source/dataMigrationFrom1.sql'),
  };
  Map<int, CustomQuery> setupMigrations = {
    // 1: CustomQuery.fromWeb("sprightly.moor_database.setupMigrationFrom1",
    //     'https://example.com/some/source/setupMigrationFrom1.sql'),
  };

  Future _init() async {
    if (!initialized && !_working) {
      _working = true;
      // Required for fetching file from web
      await RemoteFileCache.current.init();

      // custom queries
      await selectGroupAccountMembers.load();
      await selectGroupOnlyMembers.load();
      await selectGroupSettlements.load();
      await selectGroupTransactions.load();

      initialized = true;
      _working = false;
    }
  }
}

mixin _GenericDaoMixin<T extends GeneratedDatabase> on DatabaseAccessor<T> {
  SprightlyQueries _queries = SprightlyQueries();

  bool get ready => _queries.initialized;

  Future getReady() async {
    await _queries._init();
    await customStatement(await _queries.defaultStartupStatement.load());
  }

  Future<void> onCreate(Migrator m) async {
    await m.createAll();
  }

  Future<void> onUpgrade(Migrator m, int from, int to);
  Future<void> beforeOpen(OpeningDetails details, Migrator m);

  Future<String> _uniqueId(String tableName, List<String> items,
      {HashLibrary hashLibrary}) async {
    var result = '';
    var foundUnique = false;
    var attempts = 0;
    do {
      if (null == hashLibrary) hashLibrary = HashLibrary.values.random;
      result =
          hashedAll(items, hashLength: hashedIdMinLength, library: hashLibrary);
      foundUnique = !await recordWithIdExists(tableName, result);
      attempts++;
    } while (attempts < uniqueRetry && !foundUnique);
    throw TimeoutException(
        'Can not found a suitable unique Id for $tableName after $attempts attempts');
  }

  Future<bool> recordWithIdExists(String tableName, String id) =>
      recordWithColumnValueExists(tableName, 'id', id);

  Future<bool> recordWithColumnValueExists(
          String tableName, String column, String value) async =>
      await customSelectQuery(
        "SELECT COUNT(1) AS counting FROM $tableName t WHERE t.$column=:value",
        variables: [Variable.withString(value)],
      ).map((row) => row.readInt("counting")).getSingle() >
      0;

  Selectable<QueryRow> getRecordsWithColumnValue(
          String tableName, String column, String value,
          {TableInfo table}) =>
      customSelectQuery(
        "SELECT t.* AS counting FROM $tableName t WHERE t.$column=:value",
        variables: [Variable.withString(value)],
        readsFrom: null == table ? null : {table},
      );

  /// **_caution_**: use this function only if the query returns only 1 record or none
  Future<Map<String, dynamic>> getRecordWithColumnValue(
          String tableName, String column, String value,
          {TableInfo table}) async =>
      (await getRecordsWithColumnValue(tableName, column, value, table: table)
              .getSingle())
          .data;

  Future<Map<String, dynamic>> getRecord(String tableName, String id,
          {TableInfo table}) async =>
      (await getRecordsWithColumnValue(tableName, 'id', id, table: table)
              .getSingle())
          .data;

  Future<bool> updateRecord<Tbl extends Table, R extends DataClass>(
          TableInfo<Tbl, R> table, Insertable<R> record,
          {bool dontExecute = false}) =>
      update(table).replace(record, dontExecute: dontExecute);

  Future<int> deleteRecord<Tbl extends Table, R extends DataClass>(
          TableInfo<Tbl, R> table, Insertable<R> record) =>
      delete(table).delete(record);
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
    with _$SprightlyDaoMixin, _GenericDaoMixin
    implements SystemDao {
  SprightlyDao(SprightlyDatabase _db) : super(_db);

  bool _initialized = false;
  bool _working = false;
  @override
  bool get ready => super.ready && _initialized;
  @override
  Future getReady() async {
    if (!_initialized && !_working) {
      _working = true;
      await super.getReady();
      _sharedGroupList = await getGroups(GroupType.Shared);
      _initialized = true;
      _working = false;
    }
  }

  @override
  Future<void> onCreate(Migrator m) async {
    await super.onCreate(m);
    await m.issueCustomQuery(await _queries.dataInitiation.load());
  }

  @override
  Future<void> onUpgrade(Migrator m, int from, int to) async {
    for (var i = from; i < to; i++)
      await m.issueCustomQuery(await _queries.dataMigrations[i].load());
  }

  @override
  Future<void> beforeOpen(OpeningDetails details, Migrator m) async {
    await getReady();
    if (details.wasCreated) {
      // todo: do first time activity
      // creating default Group & Accounts
      var defaultGroup = await createGroup('Sprightly Default',
          type: GroupType.Personal, isHidden: true);
      await addAccount('Cash', defaultGroup.id, type: AccountType.Cash);
      await addAccount('Bank Accounts', defaultGroup.id,
          type: AccountType.Bank);
      await addAccount('Credit Cards', defaultGroup.id,
          type: AccountType.Credit);
      await addAccount('Investments', defaultGroup.id,
          type: AccountType.Investment);
    }
  }

  List<Group> _sharedGroupList;
  List<Group> get sharedGroupList => _sharedGroupList;

  Selectable<Member> _selectGroupAccountMembers(String groupId) =>
      customSelectQuery(
        _queries.selectGroupAccountMembers.query,
        variables: [Variable.withString(groupId)],
        readsFrom: {members, groupMembers},
      ).map((row) => Member.fromData(row.data, db));

  Future<List<Member>> getGroupAccountMembers(String groupId) =>
      _selectGroupAccountMembers(groupId).get();

  Stream<List<Member>> watchGroupAccountMembers(String groupId) =>
      _selectGroupAccountMembers(groupId).watch();

  Selectable<Member> _selectGroupOnlyMembers(String groupId) =>
      customSelectQuery(
        _queries.selectGroupOnlyMembers.query,
        variables: [Variable.withString(groupId)],
        readsFrom: {members, groupMembers},
      ).map((row) => Member.fromData(row.data, db));

  Future<List<Member>> getGroupOnlyMembers(String groupId) =>
      _selectGroupOnlyMembers(groupId).get();

  Stream<List<Member>> watchGroupOnlyMembers(String groupId) =>
      _selectGroupOnlyMembers(groupId).watch();

  Future<bool> memberWithNameExists(String name) =>
      recordWithColumnValueExists(members.actualTableName, 'name', name);

  Future<Member> getMember(String memberId) async =>
      Member.fromJson(await getRecord(members.actualTableName, memberId));

  Future<Member> addMember(String idValue,
      {String id,
      String name,
      String nickName,
      String avatar,
      MemberIdType idType,
      String secondaryIdValue,
      bool isGroupExpense = false,
      String signature}) async {
    if (null != id) id = await _uniqueId(members.actualTableName, [idValue]);
    var membersComp = MembersCompanion.insert(
        id: id,
        name: Value(name),
        nickName: Value(nickName),
        avatar: Value(avatar),
        idType: idType.toEnumString(),
        idValue: idValue,
        secondaryIdValue: Value(secondaryIdValue),
        isGroupExpense: Value(isGroupExpense),
        signature: Value(signature));
    await into(members).insert(membersComp);
    return getMember(id);
  }

  Future<Member> addGroupMember(String groupId, String idValue,
      {String id,
      String name,
      String nickName,
      String avatar,
      MemberIdType idType = MemberIdType.GroupMember,
      String secondaryIdValue,
      bool isGroupExpense = false,
      String signature}) async {
    Member member;
    var existingMember = false;
    if (null != id) {
      if (await recordWithIdExists(members.actualTableName, id)) {
        member = await getMember(id);
        existingMember = true;
      }
    }

    if (!existingMember) {
      if (idType == MemberIdType.Group) isGroupExpense = true;

      member = await addMember(idValue,
          id: id,
          name: name,
          nickName: nickName,
          avatar: avatar,
          idType: idType,
          secondaryIdValue: secondaryIdValue,
          isGroupExpense: isGroupExpense,
          signature: signature);

      if (idType == MemberIdType.Group)
        await addAccount(idValue, groupId,
            memberId: member.id, type: AccountType.Group);
    }
    var groupMembersComp =
        GroupMembersCompanion.insert(groupId: groupId, memberId: member.id);
    await into(groupMembers).insert(groupMembersComp);
    return member;
  }

  Future<Member> updateMember(String memberId,
      {String name,
      String nickName,
      String avatar,
      MemberIdType idType,
      String idValue,
      String secondaryIdValue,
      String signature}) async {
    var member = await getMember(memberId);
    member.copyWith(
        name: name,
        nickName: nickName,
        avatar: avatar,
        idType: idType.toEnumString(),
        idValue: idValue,
        secondaryIdValue: secondaryIdValue,
        signature: signature,
        updatedOn: DateTime.now().toUtc());
    await updateRecord(members, member);
    return getMember(memberId);
  }

  Future<int> deleteMember(String memberId) =>
      deleteRecord(members, MembersCompanion(id: Value(memberId)));

  Future<int> deleteMemberFromGroup(String memberId, String groupId) async {
    var groupMember = await (select(groupMembers)
          ..where((gm) =>
              gm.groupId.equals(groupId) & gm.memberId.equals(memberId)))
        .getSingle();
    return deleteRecord(groupMembers, groupMember);
  }

  Selectable<Settlement> _selectGroupSettlements(String groupId,
          {bool isTemporary}) =>
      customSelectQuery(
        _queries.selectGroupSettlements.query,
        variables: [
          Variable.withString(groupId),
          Variable.withBool(isTemporary)
        ],
        readsFrom: {settlements, groups},
      ).map((row) => Settlement.fromData(row.data, db));

  Future<List<Settlement>> getGroupSettlements(String groupId,
          {bool isTemporary}) =>
      _selectGroupSettlements(groupId, isTemporary: isTemporary).get();

  Stream<List<Settlement>> watchGroupSettlements(String groupId,
          {bool isTemporary}) =>
      _selectGroupSettlements(groupId, isTemporary: isTemporary).watch();

  Future<Settlement> getSettlement(String settlementId) async =>
      Settlement.fromJson(
          await getRecord(settlements.actualTableName, settlementId));

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
  }) async {
    if (null == id) {
      id = await _uniqueId(settlements.actualTableName,
          [groupId, fromMemberId, toMemberId, amount.toString()],
          hashLibrary: HashLibrary.hmac_sha256);
    }
    return Settlement(
        id: id,
        groupId: groupId,
        fromMemberId: fromMemberId,
        toMemberId: toMemberId,
        amount: amount,
        settledAmount: settledAmount,
        isTemporary: isTemporary,
        transactionId: transactionId,
        signature: signature,
        createdOn: DateTime.now().toUtc(),
        updatedOn: DateTime.now().toUtc());
  }

  Future<void> addGroupSettlements(
          String groupId, List<Settlement> settlementList) =>
      batch((b) => b.insertAll(settlements, settlementList));

  Future<bool> finalizeSettlement(
    String groupId,
    String id,
    String signature, {
    double settledAmount,
    String notes,
    List<String> attachments,
    List<String> tags,
    DateTime doneOn,
  }) async {
    var recordExists =
        await recordWithIdExists(settlements.actualTableName, id);
    if (recordExists) {
      var settleMent = await getSettlement(id);
      var transaction = await addGroupTransaction(
        groupId,
        settleMent.fromMemberId,
        settledAmount ?? settleMent.amount,
        groupMemberIds: settleMent.toMemberId,
        settlementId: settleMent.id,
        notes: notes,
        attachments: attachments,
        tags: tags,
        doneOn: doneOn,
      );
      settleMent.copyWith(
        settledAmount: settledAmount,
        isTemporary: false,
        transactionId: transaction.id,
        signature: signature,
        updatedOn: DateTime.now().toUtc(),
      );
      return updateRecord(settlements, settleMent);
    }
    return false;
  }

  Future<int> deleteTempSettlements(String groupId) =>
      transaction(() => (delete(settlements)
            ..where(
                (s) => s.groupId.equals(groupId) & s.isTemporary.equals(true)))
          .go());

  Selectable<Transaction> _selectGroupTransactions(String groupId) =>
      customSelectQuery(
        _queries.selectGroupTransactions.query,
        variables: [Variable.withString(groupId)],
        readsFrom: {transactions, groups},
      ).map((row) => Transaction.fromData(row.data, db));

  Future<List<Transaction>> getGroupTransactions(String groupId) =>
      _selectGroupTransactions(groupId).get();

  Stream<List<Transaction>> watchGroupTransactions(String groupId) =>
      _selectGroupTransactions(groupId).watch();

  Future<Transaction> getTransaction(String transactionId) async =>
      Transaction.fromJson(
          await getRecord(transactions.actualTableName, transactionId));

  Future<Transaction> addGroupTransaction(
    String groupId,
    String memberId,
    double amount, {
    String id,
    String groupMemberIds,
    int fromAccountId,
    int toAccountId,
    int categoryId,
    String settlementId,
    String notes,
    List<String> attachments,
    List<String> tags,
    DateTime doneOn,
  }) async {
    if (null != id)
      id = await _uniqueId(
          transactions.actualTableName, [groupId, memberId, amount.toString()],
          hashLibrary: HashLibrary.hmac_sha256);
    var transactionComp = TransactionsCompanion.insert(
      id: id,
      memberId: memberId,
      amount: amount,
      groupId: groupId,
      groupMemberIds: Value(groupMemberIds),
      fromAccountId: Value(fromAccountId),
      toAccountId: Value(toAccountId),
      categoryId: Value(categoryId),
      settlementId: Value(settlementId),
      notes: Value(notes),
      attachments: Value(attachments.join(',')),
      tags: Value(tags.join(',')),
      doneOn: Value(doneOn ?? DateTime.now().toUtc()),
    );
    into(transactions).insert(transactionComp);
    return getTransaction(id);
  }

  Future<Transaction> updateTransaction(
    String transactionId, {
    String memberId,
    double amount,
    String groupMemberIds,
    int fromAccountId,
    int toAccountId,
    int categoryId,
    String notes,
    List<String> attachments,
    List<String> tags,
    DateTime doneOn,
  }) async {
    var transaction = await getTransaction(transactionId);
    if (null == transaction.settlementId) {
      transaction.copyWith(
        memberId: memberId,
        amount: amount,
        groupMemberIds: groupMemberIds,
        fromAccountId: fromAccountId,
        toAccountId: toAccountId,
        categoryId: categoryId,
        notes: notes,
        attachments: attachments.join(','),
        tags: tags.join(','),
        doneOn: doneOn,
        updatedOn: DateTime.now().toUtc(),
      );
      await updateRecord(transactions, transaction);
      return getTransaction(transactionId);
    }
    return transaction;
  }

  Future<int> deleteTransaction(String transactionId) async {
    var transaction = await getTransaction(transactionId);
    if (null == transaction.settlementId)
      return deleteRecord(
          transactions, TransactionsCompanion(id: Value(transactionId)));
    return 0;
  }

  Future<Account> getAccount(int accountId) async => Account.fromJson(
      await getRecord(accounts.actualTableName, accountId.toString()));

  Future<Account> addAccount(String name, String groupId,
      {int parentId, AccountType type, String memberId, double balance}) async {
    var accountsComp = AccountsCompanion.insert(
      name: name,
      groupId: groupId,
      parentId: Value(parentId),
      type: Value(type.toEnumString()),
      memberId: Value(memberId),
      balance: Value(balance),
    );
    var accountId = await into(accounts).insert(accountsComp);
    return getAccount(accountId);
  }

  Future<Account> updateAccount(int accountId,
      {String name,
      String groupId,
      int parentId,
      AccountType type,
      String memberId,
      double balance}) async {
    var account = await getAccount(accountId);
    account.copyWith(
      name: name,
      groupId: groupId,
      parentId: parentId,
      type: type.toEnumString(),
      memberId: memberId,
      balance: balance,
      updatedOn: DateTime.now().toUtc(),
    );
    await updateRecord(accounts, account);
    return getAccount(accountId);
  }

  Future<int> deleteAccount(int accountId) =>
      deleteRecord(accounts, AccountsCompanion(id: Value(accountId)));

  Selectable<Group> _selectGroupBy(
    String column,
    String value,
  ) =>
      getRecordsWithColumnValue(
        groups.actualTableName,
        column,
        value,
        table: groups,
      ).map((row) => Group.fromData(row.data, db));

  Future<List<Group>> getGroups(GroupType type) async =>
      await _selectGroupBy('type', type.toEnumString()).get();

  Stream<List<Group>> watchGroups(GroupType type) =>
      _selectGroupBy('type', type.toEnumString()).watch();

  Future<bool> groupWithNameExists(String groupName) =>
      recordWithColumnValueExists(groups.actualTableName, 'name', groupName);

  Future<Group> getGroup(String groupId) async =>
      Group.fromJson(await getRecord(groups.actualTableName, groupId));

  Future<Group> createGroup(String name,
      {GroupType type = GroupType.Shared, bool isHidden = false}) async {
    var groupId =
        await _uniqueId(groups.actualTableName, [name, type.toEnumString()]);
    var newGroupComp = GroupsCompanion.insert(
      id: groupId,
      name: name,
      type: Value(type.toEnumString()),
      isHidden: Value(isHidden),
    );
    await into(groups).insert(newGroupComp);
    var newGroup = await getGroup(groupId);
    if (type == GroupType.Shared) _sharedGroupList.add(newGroup);
    return newGroup;
  }

  Future<Group> updateGroup(String groupId,
      {String name, GroupType type, bool isHidden}) async {
    var group = await getGroup(groupId);
    group.copyWith(
      name: name,
      type: type.toEnumString(),
      isHidden: isHidden,
      updatedOn: DateTime.now().toUtc(),
    );
    await updateRecord(groups, group);
    if (type == GroupType.Shared)
      _sharedGroupList = await getGroups(GroupType.Shared);
    return getGroup(groupId);
  }

  Future<int> deleteGroup(String groupId) async {
    var result =
        await deleteRecord(groups, GroupsCompanion(id: Value(groupId)));
    _sharedGroupList = await getGroups(GroupType.Shared);
    return result;
  }
}

@UseDao(
  tables: [
    AppFonts,
    FontCombos,
    ColorCombos,
    AppSettings,
  ],
)
class SprightlySetupDao extends DatabaseAccessor<SprightlySetupDatabase>
    with _$SprightlySetupDaoMixin, _GenericDaoMixin
    implements SettingsDao {
  SprightlySetupDao(SprightlySetupDatabase _db) : super(_db);

  bool _initialized = false;
  bool _working = false;
  @override
  bool get ready => super.ready && _appInformation.ready && _initialized;
  @override
  Future getReady() async {
    if (!_initialized && !_working) {
      _working = true;
      await super.getReady();
      await _appInformation.getReady();
      _allAppSettings = await getAppSettings();
      _allAppFonts = await getAppFonts();
      _allFontCombos = await getFontCombos();
      _allColorCombos = await getColorCombos();
      _initialized = true;
      _working = false;
    }
  }

  @override
  Future<void> onCreate(Migrator m) async {
    await super.onCreate(m);
    await m.issueCustomQuery(await _queries.setupInitiation.load());
  }

  @override
  Future<void> onUpgrade(Migrator m, int from, int to) async {
    for (var i = from; i < to; i++)
      await m.issueCustomQuery(await _queries.setupMigrations[i].load());
  }

  @override
  Future<void> beforeOpen(OpeningDetails details, Migrator m) async {
    await getReady();
    if (details.wasCreated) {
      // todo: do first time activity
      // already done through _queries.setupInitiation
      // await updateAppSetting('primarySetupComplete', false.toString());
    }
    if (details.wasCreated || details.hadUpgrade) {
      // sync dbVersion
      await updateAppSetting('dbVersion', db.schemaVersion.toString());
    }
  }

  AppInformation _appInformation = AppInformation();
  AppInformation get appInformation => _appInformation;
  List<AppSetting> _allAppSettings;
  List<AppSetting> get allAppSettings => _allAppSettings;
  List<AppFont> _allAppFonts;
  List<AppFont> get allAppFonts => _allAppFonts;
  List<FontCombo> _allFontCombos;
  List<FontCombo> get allFontCombos => _allFontCombos;
  List<ColorCombo> _allColorCombos;
  List<ColorCombo> get allColorCombos => _allColorCombos;

  Future<List<AppSetting>> getAppSettings() => select(appSettings).get();

  Stream<List<AppSetting>> watchAppSettings() => select(appSettings).watch();

  Future<AppSetting> getAppSetting(String name) async => AppSetting.fromData(
      await getRecordWithColumnValue(appSettings.actualTableName, 'name', name),
      db);

  Future<bool> updateAppSetting(String name, String value,
      {AppSettingType type, bool batchOperation = false}) async {
    var appSetting = await getAppSetting(name);
    appSetting.copyWith(
      value: value,
      type: type.toEnumString(),
      updatedOn: DateTime.now().toUtc(),
    );
    var result = updateRecord(appSettings, appSetting);
    if (!batchOperation) _allAppSettings = await getAppSettings();
    return result;
  }

  Future<bool> updateAppSettings(Map<String, String> settings) async {
    var result = true;
    settings.forEach((name, value) async => result =
        result && await updateAppSetting(name, value, batchOperation: true));
    _allAppSettings = await getAppSettings();
    return result;
  }

  Future<List<AppFont>> getAppFonts() => select(appFonts).get();
  Stream<List<AppFont>> watchAppFonts() => select(appFonts).watch();

  Future<List<FontCombo>> getFontCombos() => select(fontCombos).get();
  Stream<List<FontCombo>> watchFontCombos() => select(fontCombos).watch();

  Future<List<ColorCombo>> getColorCombos() => select(colorCombos).get();
  Stream<List<ColorCombo>> watchColorCombos() => select(colorCombos).watch();
}

LazyDatabase _openConnection(
  String dbFile, {
  bool isSupportFile = false,
  bool logStatements = false,
  bool recreateDatabase = false,
}) =>
    LazyDatabase(() async => VmDatabase(
        await getFile(
          dbFile,
          isSupportFile: isSupportFile,
          recreateFile: recreateDatabase,
        ),
        logStatements: logStatements));

@UseMoor(
  tables: [
    Members,
    Groups,
    GroupMembers,
    Accounts,
    Categories,
    Settlements,
    Transactions,
  ],
  daos: [SprightlyDao],
)
class SprightlyDatabase extends _$SprightlyDatabase {
  bool enableDebug;
  bool recreateDatabase;
  SprightlyDatabase({this.enableDebug = false, this.recreateDatabase = false})
      : super(_openConnection(
          appDataDbFile,
          logStatements: enableDebug,
          recreateDatabase: recreateDatabase,
        ));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: sprightlyDao.onCreate,
        onUpgrade: sprightlyDao.onUpgrade,
        beforeOpen: (OpeningDetails details) async {
          Migrator m = this.createMigrator();
          await sprightlyDao.beforeOpen(details, m);
        },
      );
}

@UseMoor(
  tables: [
    AppFonts,
    FontCombos,
    ColorCombos,
    AppSettings,
  ],
  daos: [SprightlySetupDao],
)
class SprightlySetupDatabase extends _$SprightlySetupDatabase {
  bool enableDebug;
  bool recreateDatabase;
  SprightlySetupDatabase(
      {this.enableDebug = false, this.recreateDatabase = false})
      : super(_openConnection(
          setupDataDbFile,
          logStatements: enableDebug,
          recreateDatabase: recreateDatabase,
        ));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: sprightlySetupDao.onCreate,
        onUpgrade: sprightlySetupDao.onUpgrade,
        beforeOpen: (OpeningDetails details) async {
          Migrator m = this.createMigrator();
          await sprightlySetupDao.beforeOpen(details, m);
        },
      );
}
