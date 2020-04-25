import 'package:moor/moor.dart';
import 'package:sprightly/extensions/enum_extensions.dart';
import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/db/database.dart' as _db;

/// Separate Entity layer.
/// Quick replace with RegExp
///
/// Find: `final (\w+) (\w+);`
///
/// Replace With: `$1 get $2 => data.$2;`
abstract class DataEntity<T extends DataClass> {
  final T data;

  DataEntity(this.data);

  Map<String, dynamic> toJson({ValueSerializer serializer}) =>
      data.toJson(serializer: serializer);

  String toJsonString({ValueSerializer serializer}) =>
      data.toJsonString(serializer: serializer);
  UpdateCompanion<T> createCompanion({bool nullToAbsent = true});
}

class Member extends DataEntity<_db.Member> {
  Member(_db.Member data) : super(data);

  Member.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix})
      : super(_db.Member.fromData(data, db, prefix: prefix));

  @override
  UpdateCompanion<_db.Member> createCompanion({bool nullToAbsent = true}) =>
      data.createCompanion(nullToAbsent);

  String get id => data.id;
  String get name => data.name;
  String get nickName => data.nickName;
  String get avatar => data.avatar;
  MemberIdType get idType => MemberIdType.values.find(data.idType);
  String get idValue => data.idValue;
  String get secondaryIdValue => data.secondaryIdValue;
  bool get isGroupExpense => data.isGroupExpense;
  String get signature => data.signature;
  DateTime get createdOn => data.createdOn;
  DateTime get updatedOn => data.updatedOn;
}
