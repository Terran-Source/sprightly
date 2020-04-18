// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Member extends DataClass implements Insertable<Member> {
  final String id;
  final String name;
  final String nickName;
  final Uint8List avatar;
  final String idType;
  final String idValue;
  final String secondaryIdValue;
  final bool isGroupExpense;
  final DateTime createdOn;
  final DateTime updatedOn;
  Member(
      {@required this.id,
      this.name,
      @required this.nickName,
      this.avatar,
      @required this.idType,
      @required this.idValue,
      this.secondaryIdValue,
      @required this.isGroupExpense,
      @required this.createdOn,
      @required this.updatedOn});
  factory Member.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Member(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      nickName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nickName']),
      avatar: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      idType:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}idType']),
      idValue:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}idValue']),
      secondaryIdValue: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}secondaryIdValue']),
      isGroupExpense: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isGroupExpense']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  factory Member.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nickName: serializer.fromJson<String>(json['nickName']),
      avatar: serializer.fromJson<Uint8List>(json['avatar']),
      idType: serializer.fromJson<String>(json['idType']),
      idValue: serializer.fromJson<String>(json['idValue']),
      secondaryIdValue: serializer.fromJson<String>(json['secondaryIdValue']),
      isGroupExpense: serializer.fromJson<bool>(json['isGroupExpense']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'nickName': serializer.toJson<String>(nickName),
      'avatar': serializer.toJson<Uint8List>(avatar),
      'idType': serializer.toJson<String>(idType),
      'idValue': serializer.toJson<String>(idValue),
      'secondaryIdValue': serializer.toJson<String>(secondaryIdValue),
      'isGroupExpense': serializer.toJson<bool>(isGroupExpense),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  @override
  MembersCompanion createCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      nickName: nickName == null && nullToAbsent
          ? const Value.absent()
          : Value(nickName),
      avatar:
          avatar == null && nullToAbsent ? const Value.absent() : Value(avatar),
      idType:
          idType == null && nullToAbsent ? const Value.absent() : Value(idType),
      idValue: idValue == null && nullToAbsent
          ? const Value.absent()
          : Value(idValue),
      secondaryIdValue: secondaryIdValue == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryIdValue),
      isGroupExpense: isGroupExpense == null && nullToAbsent
          ? const Value.absent()
          : Value(isGroupExpense),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  Member copyWith(
          {String id,
          String name,
          String nickName,
          Uint8List avatar,
          String idType,
          String idValue,
          String secondaryIdValue,
          bool isGroupExpense,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Member(
        id: id ?? this.id,
        name: name ?? this.name,
        nickName: nickName ?? this.nickName,
        avatar: avatar ?? this.avatar,
        idType: idType ?? this.idType,
        idValue: idValue ?? this.idValue,
        secondaryIdValue: secondaryIdValue ?? this.secondaryIdValue,
        isGroupExpense: isGroupExpense ?? this.isGroupExpense,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickName: $nickName, ')
          ..write('avatar: $avatar, ')
          ..write('idType: $idType, ')
          ..write('idValue: $idValue, ')
          ..write('secondaryIdValue: $secondaryIdValue, ')
          ..write('isGroupExpense: $isGroupExpense, ')
          ..write('createdOn: $createdOn, ')
          ..write('updatedOn: $updatedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              nickName.hashCode,
              $mrjc(
                  avatar.hashCode,
                  $mrjc(
                      idType.hashCode,
                      $mrjc(
                          idValue.hashCode,
                          $mrjc(
                              secondaryIdValue.hashCode,
                              $mrjc(
                                  isGroupExpense.hashCode,
                                  $mrjc(createdOn.hashCode,
                                      updatedOn.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.name == this.name &&
          other.nickName == this.nickName &&
          other.avatar == this.avatar &&
          other.idType == this.idType &&
          other.idValue == this.idValue &&
          other.secondaryIdValue == this.secondaryIdValue &&
          other.isGroupExpense == this.isGroupExpense &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nickName;
  final Value<Uint8List> avatar;
  final Value<String> idType;
  final Value<String> idValue;
  final Value<String> secondaryIdValue;
  final Value<bool> isGroupExpense;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nickName = const Value.absent(),
    this.avatar = const Value.absent(),
    this.idType = const Value.absent(),
    this.idValue = const Value.absent(),
    this.secondaryIdValue = const Value.absent(),
    this.isGroupExpense = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  MembersCompanion.insert({
    @required String id,
    this.name = const Value.absent(),
    @required String nickName,
    this.avatar = const Value.absent(),
    @required String idType,
    @required String idValue,
    this.secondaryIdValue = const Value.absent(),
    this.isGroupExpense = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : id = Value(id),
        nickName = Value(nickName),
        idType = Value(idType),
        idValue = Value(idValue);
  MembersCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> nickName,
      Value<Uint8List> avatar,
      Value<String> idType,
      Value<String> idValue,
      Value<String> secondaryIdValue,
      Value<bool> isGroupExpense,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return MembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      avatar: avatar ?? this.avatar,
      idType: idType ?? this.idType,
      idValue: idValue ?? this.idValue,
      secondaryIdValue: secondaryIdValue ?? this.secondaryIdValue,
      isGroupExpense: isGroupExpense ?? this.isGroupExpense,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }
}

class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  final GeneratedDatabase _db;
  final String _alias;
  $MembersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false, minTextLength: 16);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true, maxTextLength: 50);
  }

  final VerificationMeta _nickNameMeta = const VerificationMeta('nickName');
  GeneratedTextColumn _nickName;
  @override
  GeneratedTextColumn get nickName => _nickName ??= _constructNickName();
  GeneratedTextColumn _constructNickName() {
    return GeneratedTextColumn('nickName', $tableName, false,
        maxTextLength: 10);
  }

  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  GeneratedBlobColumn _avatar;
  @override
  GeneratedBlobColumn get avatar => _avatar ??= _constructAvatar();
  GeneratedBlobColumn _constructAvatar() {
    return GeneratedBlobColumn(
      'avatar',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idTypeMeta = const VerificationMeta('idType');
  GeneratedTextColumn _idType;
  @override
  GeneratedTextColumn get idType => _idType ??= _constructIdType();
  GeneratedTextColumn _constructIdType() {
    return GeneratedTextColumn('idType', $tableName, false,
        $customConstraints:
            'CHECK (idType IN (\'Phone\', \'Email\', \'NickName\', \'Group\')) NOT NULL');
  }

  final VerificationMeta _idValueMeta = const VerificationMeta('idValue');
  GeneratedTextColumn _idValue;
  @override
  GeneratedTextColumn get idValue => _idValue ??= _constructIdValue();
  GeneratedTextColumn _constructIdValue() {
    return GeneratedTextColumn('idValue', $tableName, false, maxTextLength: 50);
  }

  final VerificationMeta _secondaryIdValueMeta =
      const VerificationMeta('secondaryIdValue');
  GeneratedTextColumn _secondaryIdValue;
  @override
  GeneratedTextColumn get secondaryIdValue =>
      _secondaryIdValue ??= _constructSecondaryIdValue();
  GeneratedTextColumn _constructSecondaryIdValue() {
    return GeneratedTextColumn('secondaryIdValue', $tableName, true,
        maxTextLength: 50);
  }

  final VerificationMeta _isGroupExpenseMeta =
      const VerificationMeta('isGroupExpense');
  GeneratedBoolColumn _isGroupExpense;
  @override
  GeneratedBoolColumn get isGroupExpense =>
      _isGroupExpense ??= _constructIsGroupExpense();
  GeneratedBoolColumn _constructIsGroupExpense() {
    return GeneratedBoolColumn('isGroupExpense', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'createdOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  final VerificationMeta _updatedOnMeta = const VerificationMeta('updatedOn');
  GeneratedDateTimeColumn _updatedOn;
  @override
  GeneratedDateTimeColumn get updatedOn => _updatedOn ??= _constructUpdatedOn();
  GeneratedDateTimeColumn _constructUpdatedOn() {
    return GeneratedDateTimeColumn(
      'updatedOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        nickName,
        avatar,
        idType,
        idValue,
        secondaryIdValue,
        isGroupExpense,
        createdOn,
        updatedOn
      ];
  @override
  $MembersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Members';
  @override
  final String actualTableName = 'Members';
  @override
  VerificationContext validateIntegrity(MembersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    }
    if (d.nickName.present) {
      context.handle(_nickNameMeta,
          nickName.isAcceptableValue(d.nickName.value, _nickNameMeta));
    } else if (isInserting) {
      context.missing(_nickNameMeta);
    }
    if (d.avatar.present) {
      context.handle(
          _avatarMeta, avatar.isAcceptableValue(d.avatar.value, _avatarMeta));
    }
    if (d.idType.present) {
      context.handle(
          _idTypeMeta, idType.isAcceptableValue(d.idType.value, _idTypeMeta));
    } else if (isInserting) {
      context.missing(_idTypeMeta);
    }
    if (d.idValue.present) {
      context.handle(_idValueMeta,
          idValue.isAcceptableValue(d.idValue.value, _idValueMeta));
    } else if (isInserting) {
      context.missing(_idValueMeta);
    }
    if (d.secondaryIdValue.present) {
      context.handle(
          _secondaryIdValueMeta,
          secondaryIdValue.isAcceptableValue(
              d.secondaryIdValue.value, _secondaryIdValueMeta));
    }
    if (d.isGroupExpense.present) {
      context.handle(
          _isGroupExpenseMeta,
          isGroupExpense.isAcceptableValue(
              d.isGroupExpense.value, _isGroupExpenseMeta));
    }
    if (d.createdOn.present) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableValue(d.createdOn.value, _createdOnMeta));
    }
    if (d.updatedOn.present) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableValue(d.updatedOn.value, _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Member.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MembersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.nickName.present) {
      map['nickName'] = Variable<String, StringType>(d.nickName.value);
    }
    if (d.avatar.present) {
      map['avatar'] = Variable<Uint8List, BlobType>(d.avatar.value);
    }
    if (d.idType.present) {
      map['idType'] = Variable<String, StringType>(d.idType.value);
    }
    if (d.idValue.present) {
      map['idValue'] = Variable<String, StringType>(d.idValue.value);
    }
    if (d.secondaryIdValue.present) {
      map['secondaryIdValue'] =
          Variable<String, StringType>(d.secondaryIdValue.value);
    }
    if (d.isGroupExpense.present) {
      map['isGroupExpense'] = Variable<bool, BoolType>(d.isGroupExpense.value);
    }
    if (d.createdOn.present) {
      map['createdOn'] = Variable<DateTime, DateTimeType>(d.createdOn.value);
    }
    if (d.updatedOn.present) {
      map['updatedOn'] = Variable<DateTime, DateTimeType>(d.updatedOn.value);
    }
    return map;
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(_db, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final String id;
  final String name;
  final String type;
  final DateTime createdOn;
  final DateTime updatedOn;
  Group(
      {@required this.id,
      @required this.name,
      this.type,
      @required this.createdOn,
      @required this.updatedOn});
  factory Group.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Group(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  @override
  GroupsCompanion createCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  Group copyWith(
          {String id,
          String name,
          String type,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Group(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('createdOn: $createdOn, ')
          ..write('updatedOn: $updatedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              type.hashCode, $mrjc(createdOn.hashCode, updatedOn.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Group &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  GroupsCompanion.insert({
    @required String id,
    @required String name,
    this.type = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  GroupsCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return GroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }
}

class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  final GeneratedDatabase _db;
  final String _alias;
  $GroupsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false, minTextLength: 16);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 50);
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, true,
        $customConstraints:
            'CHECK (type IN (\'Personal\', \'Budget\', \'Shared\')) NOT NULL DEFAULT \'Shared\'');
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'createdOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  final VerificationMeta _updatedOnMeta = const VerificationMeta('updatedOn');
  GeneratedDateTimeColumn _updatedOn;
  @override
  GeneratedDateTimeColumn get updatedOn => _updatedOn ??= _constructUpdatedOn();
  GeneratedDateTimeColumn _constructUpdatedOn() {
    return GeneratedDateTimeColumn(
      'updatedOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, type, createdOn, updatedOn];
  @override
  $GroupsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Groups';
  @override
  final String actualTableName = 'Groups';
  @override
  VerificationContext validateIntegrity(GroupsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    }
    if (d.createdOn.present) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableValue(d.createdOn.value, _createdOnMeta));
    }
    if (d.updatedOn.present) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableValue(d.updatedOn.value, _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Group map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Group.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(GroupsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.createdOn.present) {
      map['createdOn'] = Variable<DateTime, DateTimeType>(d.createdOn.value);
    }
    if (d.updatedOn.present) {
      map['updatedOn'] = Variable<DateTime, DateTimeType>(d.updatedOn.value);
    }
    return map;
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(_db, alias);
  }
}

class GroupMember extends DataClass implements Insertable<GroupMember> {
  final int id;
  final String groupId;
  final String memberId;
  final DateTime createdOn;
  final DateTime updatedOn;
  GroupMember(
      {@required this.id,
      @required this.groupId,
      @required this.memberId,
      @required this.createdOn,
      @required this.updatedOn});
  factory GroupMember.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return GroupMember(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      groupId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groupId']),
      memberId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}memberId']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  factory GroupMember.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GroupMember(
      id: serializer.fromJson<int>(json['id']),
      groupId: serializer.fromJson<String>(json['groupId']),
      memberId: serializer.fromJson<String>(json['memberId']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'groupId': serializer.toJson<String>(groupId),
      'memberId': serializer.toJson<String>(memberId),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  @override
  GroupMembersCompanion createCompanion(bool nullToAbsent) {
    return GroupMembersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      memberId: memberId == null && nullToAbsent
          ? const Value.absent()
          : Value(memberId),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  GroupMember copyWith(
          {int id,
          String groupId,
          String memberId,
          DateTime createdOn,
          DateTime updatedOn}) =>
      GroupMember(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        memberId: memberId ?? this.memberId,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('GroupMember(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('memberId: $memberId, ')
          ..write('createdOn: $createdOn, ')
          ..write('updatedOn: $updatedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          groupId.hashCode,
          $mrjc(memberId.hashCode,
              $mrjc(createdOn.hashCode, updatedOn.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is GroupMember &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.memberId == this.memberId &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class GroupMembersCompanion extends UpdateCompanion<GroupMember> {
  final Value<int> id;
  final Value<String> groupId;
  final Value<String> memberId;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const GroupMembersCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  GroupMembersCompanion.insert({
    this.id = const Value.absent(),
    @required String groupId,
    @required String memberId,
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : groupId = Value(groupId),
        memberId = Value(memberId);
  GroupMembersCompanion copyWith(
      {Value<int> id,
      Value<String> groupId,
      Value<String> memberId,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return GroupMembersCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      memberId: memberId ?? this.memberId,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }
}

class $GroupMembersTable extends GroupMembers
    with TableInfo<$GroupMembersTable, GroupMember> {
  final GeneratedDatabase _db;
  final String _alias;
  $GroupMembersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  GeneratedTextColumn _groupId;
  @override
  GeneratedTextColumn get groupId => _groupId ??= _constructGroupId();
  GeneratedTextColumn _constructGroupId() {
    return GeneratedTextColumn('groupId', $tableName, false,
        minTextLength: 16,
        $customConstraints: 'REFERENCES Groups(id) NOT NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _memberIdMeta = const VerificationMeta('memberId');
  GeneratedTextColumn _memberId;
  @override
  GeneratedTextColumn get memberId => _memberId ??= _constructMemberId();
  GeneratedTextColumn _constructMemberId() {
    return GeneratedTextColumn('memberId', $tableName, false,
        minTextLength: 16,
        $customConstraints:
            'REFERENCES Members(id) NOT NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'createdOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  final VerificationMeta _updatedOnMeta = const VerificationMeta('updatedOn');
  GeneratedDateTimeColumn _updatedOn;
  @override
  GeneratedDateTimeColumn get updatedOn => _updatedOn ??= _constructUpdatedOn();
  GeneratedDateTimeColumn _constructUpdatedOn() {
    return GeneratedDateTimeColumn(
      'updatedOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, groupId, memberId, createdOn, updatedOn];
  @override
  $GroupMembersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'GroupMembers';
  @override
  final String actualTableName = 'GroupMembers';
  @override
  VerificationContext validateIntegrity(GroupMembersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.groupId.present) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableValue(d.groupId.value, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (d.memberId.present) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableValue(d.memberId.value, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (d.createdOn.present) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableValue(d.createdOn.value, _createdOnMeta));
    }
    if (d.updatedOn.present) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableValue(d.updatedOn.value, _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroupMember map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return GroupMember.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(GroupMembersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.groupId.present) {
      map['groupId'] = Variable<String, StringType>(d.groupId.value);
    }
    if (d.memberId.present) {
      map['memberId'] = Variable<String, StringType>(d.memberId.value);
    }
    if (d.createdOn.present) {
      map['createdOn'] = Variable<DateTime, DateTimeType>(d.createdOn.value);
    }
    if (d.updatedOn.present) {
      map['updatedOn'] = Variable<DateTime, DateTimeType>(d.updatedOn.value);
    }
    return map;
  }

  @override
  $GroupMembersTable createAlias(String alias) {
    return $GroupMembersTable(_db, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final String name;
  final int parentId;
  final String type;
  final DateTime createdOn;
  final DateTime updatedOn;
  Account(
      {@required this.id,
      @required this.name,
      this.parentId,
      this.type,
      @required this.createdOn,
      @required this.updatedOn});
  factory Account.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Account(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      parentId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}parentId']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      parentId: serializer.fromJson<int>(json['parentId']),
      type: serializer.fromJson<String>(json['type']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'parentId': serializer.toJson<int>(parentId),
      'type': serializer.toJson<String>(type),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  @override
  AccountsCompanion createCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  Account copyWith(
          {int id,
          String name,
          int parentId,
          String type,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('type: $type, ')
          ..write('createdOn: $createdOn, ')
          ..write('updatedOn: $updatedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              parentId.hashCode,
              $mrjc(type.hashCode,
                  $mrjc(createdOn.hashCode, updatedOn.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.name == this.name &&
          other.parentId == this.parentId &&
          other.type == this.type &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> parentId;
  final Value<String> type;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.parentId = const Value.absent(),
    this.type = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.parentId = const Value.absent(),
    this.type = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  }) : name = Value(name);
  AccountsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> parentId,
      Value<String> type,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      type: type ?? this.type,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  final GeneratedDatabase _db;
  final String _alias;
  $AccountsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 15);
  }

  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  GeneratedIntColumn _parentId;
  @override
  GeneratedIntColumn get parentId => _parentId ??= _constructParentId();
  GeneratedIntColumn _constructParentId() {
    return GeneratedIntColumn('parentId', $tableName, true,
        $customConstraints: 'REFERENCES Accounts(id) NULLABLE');
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, true,
        $customConstraints:
            'CHECK (type IN (\'Group\', \'Cash\', \'Credit\', \'Bank\', \'Investment\')) NULLABLE');
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'createdOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  final VerificationMeta _updatedOnMeta = const VerificationMeta('updatedOn');
  GeneratedDateTimeColumn _updatedOn;
  @override
  GeneratedDateTimeColumn get updatedOn => _updatedOn ??= _constructUpdatedOn();
  GeneratedDateTimeColumn _constructUpdatedOn() {
    return GeneratedDateTimeColumn(
      'updatedOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, parentId, type, createdOn, updatedOn];
  @override
  $AccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Accounts';
  @override
  final String actualTableName = 'Accounts';
  @override
  VerificationContext validateIntegrity(AccountsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.parentId.present) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableValue(d.parentId.value, _parentIdMeta));
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    }
    if (d.createdOn.present) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableValue(d.createdOn.value, _createdOnMeta));
    }
    if (d.updatedOn.present) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableValue(d.updatedOn.value, _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Account.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AccountsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.parentId.present) {
      map['parentId'] = Variable<int, IntType>(d.parentId.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.createdOn.present) {
      map['createdOn'] = Variable<DateTime, DateTimeType>(d.createdOn.value);
    }
    if (d.updatedOn.present) {
      map['updatedOn'] = Variable<DateTime, DateTimeType>(d.updatedOn.value);
    }
    return map;
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(_db, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int parentId;
  final String type;
  final DateTime createdOn;
  final DateTime updatedOn;
  Category(
      {@required this.id,
      @required this.name,
      this.parentId,
      this.type,
      @required this.createdOn,
      @required this.updatedOn});
  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Category(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      parentId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}parentId']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      parentId: serializer.fromJson<int>(json['parentId']),
      type: serializer.fromJson<String>(json['type']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'parentId': serializer.toJson<int>(parentId),
      'type': serializer.toJson<String>(type),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  @override
  CategoriesCompanion createCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  Category copyWith(
          {int id,
          String name,
          int parentId,
          String type,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentId: $parentId, ')
          ..write('type: $type, ')
          ..write('createdOn: $createdOn, ')
          ..write('updatedOn: $updatedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              parentId.hashCode,
              $mrjc(type.hashCode,
                  $mrjc(createdOn.hashCode, updatedOn.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.parentId == this.parentId &&
          other.type == this.type &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> parentId;
  final Value<String> type;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.parentId = const Value.absent(),
    this.type = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.parentId = const Value.absent(),
    this.type = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  }) : name = Value(name);
  CategoriesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> parentId,
      Value<String> type,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      type: type ?? this.type,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 15);
  }

  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  GeneratedIntColumn _parentId;
  @override
  GeneratedIntColumn get parentId => _parentId ??= _constructParentId();
  GeneratedIntColumn _constructParentId() {
    return GeneratedIntColumn('parentId', $tableName, true,
        $customConstraints: 'REFERENCES Categories(id) NULLABLE');
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, true,
        $customConstraints:
            'CHECK (type IN (\'Expense\', \'Liability\', \'Income\', \'Investment\', \'Misc\')) NOT NULL DEFAULT \'Misc\'');
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'createdOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  final VerificationMeta _updatedOnMeta = const VerificationMeta('updatedOn');
  GeneratedDateTimeColumn _updatedOn;
  @override
  GeneratedDateTimeColumn get updatedOn => _updatedOn ??= _constructUpdatedOn();
  GeneratedDateTimeColumn _constructUpdatedOn() {
    return GeneratedDateTimeColumn(
      'updatedOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, parentId, type, createdOn, updatedOn];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Categories';
  @override
  final String actualTableName = 'Categories';
  @override
  VerificationContext validateIntegrity(CategoriesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.parentId.present) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableValue(d.parentId.value, _parentIdMeta));
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    }
    if (d.createdOn.present) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableValue(d.createdOn.value, _createdOnMeta));
    }
    if (d.updatedOn.present) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableValue(d.updatedOn.value, _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Category.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CategoriesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.parentId.present) {
      map['parentId'] = Variable<int, IntType>(d.parentId.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.createdOn.present) {
      map['createdOn'] = Variable<DateTime, DateTimeType>(d.createdOn.value);
    }
    if (d.updatedOn.present) {
      map['updatedOn'] = Variable<DateTime, DateTimeType>(d.updatedOn.value);
    }
    return map;
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final String memberId;
  final double amount;
  final int categoryId;
  final String groupId;
  final int fromAccountId;
  final int toAccountId;
  final String notes;
  final String attachments;
  final DateTime createdOn;
  final DateTime updatedOn;
  Transaction(
      {@required this.id,
      @required this.memberId,
      @required this.amount,
      this.categoryId,
      @required this.groupId,
      this.fromAccountId,
      this.toAccountId,
      this.notes,
      this.attachments,
      @required this.createdOn,
      @required this.updatedOn});
  factory Transaction.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Transaction(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      memberId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}memberId']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      categoryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}categoryId']),
      groupId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groupId']),
      fromAccountId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}fromAccountId']),
      toAccountId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}toAccountId']),
      notes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}notes']),
      attachments: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}attachments']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      memberId: serializer.fromJson<String>(json['memberId']),
      amount: serializer.fromJson<double>(json['amount']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      groupId: serializer.fromJson<String>(json['groupId']),
      fromAccountId: serializer.fromJson<int>(json['fromAccountId']),
      toAccountId: serializer.fromJson<int>(json['toAccountId']),
      notes: serializer.fromJson<String>(json['notes']),
      attachments: serializer.fromJson<String>(json['attachments']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'memberId': serializer.toJson<String>(memberId),
      'amount': serializer.toJson<double>(amount),
      'categoryId': serializer.toJson<int>(categoryId),
      'groupId': serializer.toJson<String>(groupId),
      'fromAccountId': serializer.toJson<int>(fromAccountId),
      'toAccountId': serializer.toJson<int>(toAccountId),
      'notes': serializer.toJson<String>(notes),
      'attachments': serializer.toJson<String>(attachments),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  @override
  TransactionsCompanion createCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      memberId: memberId == null && nullToAbsent
          ? const Value.absent()
          : Value(memberId),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      fromAccountId: fromAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(fromAccountId),
      toAccountId: toAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(toAccountId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      attachments: attachments == null && nullToAbsent
          ? const Value.absent()
          : Value(attachments),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  Transaction copyWith(
          {String id,
          String memberId,
          double amount,
          int categoryId,
          String groupId,
          int fromAccountId,
          int toAccountId,
          String notes,
          String attachments,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Transaction(
        id: id ?? this.id,
        memberId: memberId ?? this.memberId,
        amount: amount ?? this.amount,
        categoryId: categoryId ?? this.categoryId,
        groupId: groupId ?? this.groupId,
        fromAccountId: fromAccountId ?? this.fromAccountId,
        toAccountId: toAccountId ?? this.toAccountId,
        notes: notes ?? this.notes,
        attachments: attachments ?? this.attachments,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('amount: $amount, ')
          ..write('categoryId: $categoryId, ')
          ..write('groupId: $groupId, ')
          ..write('fromAccountId: $fromAccountId, ')
          ..write('toAccountId: $toAccountId, ')
          ..write('notes: $notes, ')
          ..write('attachments: $attachments, ')
          ..write('createdOn: $createdOn, ')
          ..write('updatedOn: $updatedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          memberId.hashCode,
          $mrjc(
              amount.hashCode,
              $mrjc(
                  categoryId.hashCode,
                  $mrjc(
                      groupId.hashCode,
                      $mrjc(
                          fromAccountId.hashCode,
                          $mrjc(
                              toAccountId.hashCode,
                              $mrjc(
                                  notes.hashCode,
                                  $mrjc(
                                      attachments.hashCode,
                                      $mrjc(createdOn.hashCode,
                                          updatedOn.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.amount == this.amount &&
          other.categoryId == this.categoryId &&
          other.groupId == this.groupId &&
          other.fromAccountId == this.fromAccountId &&
          other.toAccountId == this.toAccountId &&
          other.notes == this.notes &&
          other.attachments == this.attachments &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> memberId;
  final Value<double> amount;
  final Value<int> categoryId;
  final Value<String> groupId;
  final Value<int> fromAccountId;
  final Value<int> toAccountId;
  final Value<String> notes;
  final Value<String> attachments;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.amount = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.fromAccountId = const Value.absent(),
    this.toAccountId = const Value.absent(),
    this.notes = const Value.absent(),
    this.attachments = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  TransactionsCompanion.insert({
    @required String id,
    @required String memberId,
    @required double amount,
    this.categoryId = const Value.absent(),
    @required String groupId,
    this.fromAccountId = const Value.absent(),
    this.toAccountId = const Value.absent(),
    this.notes = const Value.absent(),
    this.attachments = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : id = Value(id),
        memberId = Value(memberId),
        amount = Value(amount),
        groupId = Value(groupId);
  TransactionsCompanion copyWith(
      {Value<String> id,
      Value<String> memberId,
      Value<double> amount,
      Value<int> categoryId,
      Value<String> groupId,
      Value<int> fromAccountId,
      Value<int> toAccountId,
      Value<String> notes,
      Value<String> attachments,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      amount: amount ?? this.amount,
      categoryId: categoryId ?? this.categoryId,
      groupId: groupId ?? this.groupId,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      toAccountId: toAccountId ?? this.toAccountId,
      notes: notes ?? this.notes,
      attachments: attachments ?? this.attachments,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  final GeneratedDatabase _db;
  final String _alias;
  $TransactionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false, minTextLength: 18);
  }

  final VerificationMeta _memberIdMeta = const VerificationMeta('memberId');
  GeneratedTextColumn _memberId;
  @override
  GeneratedTextColumn get memberId => _memberId ??= _constructMemberId();
  GeneratedTextColumn _constructMemberId() {
    return GeneratedTextColumn('memberId', $tableName, false,
        minTextLength: 16,
        $customConstraints: 'REFERENCES Members(id) NOT NULL');
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  GeneratedIntColumn _categoryId;
  @override
  GeneratedIntColumn get categoryId => _categoryId ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn('categoryId', $tableName, true,
        $customConstraints: 'REFERENCES Categories(id) NULLABLE');
  }

  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  GeneratedTextColumn _groupId;
  @override
  GeneratedTextColumn get groupId => _groupId ??= _constructGroupId();
  GeneratedTextColumn _constructGroupId() {
    return GeneratedTextColumn('groupId', $tableName, false,
        minTextLength: 16,
        $customConstraints: 'REFERENCES Groups(id) NOT NULL');
  }

  final VerificationMeta _fromAccountIdMeta =
      const VerificationMeta('fromAccountId');
  GeneratedIntColumn _fromAccountId;
  @override
  GeneratedIntColumn get fromAccountId =>
      _fromAccountId ??= _constructFromAccountId();
  GeneratedIntColumn _constructFromAccountId() {
    return GeneratedIntColumn('fromAccountId', $tableName, true,
        $customConstraints: 'REFERENCES Accounts(id) NULLABLE');
  }

  final VerificationMeta _toAccountIdMeta =
      const VerificationMeta('toAccountId');
  GeneratedIntColumn _toAccountId;
  @override
  GeneratedIntColumn get toAccountId =>
      _toAccountId ??= _constructToAccountId();
  GeneratedIntColumn _constructToAccountId() {
    return GeneratedIntColumn('toAccountId', $tableName, true,
        $customConstraints: 'REFERENCES Accounts(id) NULLABLE');
  }

  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  GeneratedTextColumn _notes;
  @override
  GeneratedTextColumn get notes => _notes ??= _constructNotes();
  GeneratedTextColumn _constructNotes() {
    return GeneratedTextColumn(
      'notes',
      $tableName,
      true,
    );
  }

  final VerificationMeta _attachmentsMeta =
      const VerificationMeta('attachments');
  GeneratedTextColumn _attachments;
  @override
  GeneratedTextColumn get attachments =>
      _attachments ??= _constructAttachments();
  GeneratedTextColumn _constructAttachments() {
    return GeneratedTextColumn(
      'attachments',
      $tableName,
      true,
    );
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'createdOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  final VerificationMeta _updatedOnMeta = const VerificationMeta('updatedOn');
  GeneratedDateTimeColumn _updatedOn;
  @override
  GeneratedDateTimeColumn get updatedOn => _updatedOn ??= _constructUpdatedOn();
  GeneratedDateTimeColumn _constructUpdatedOn() {
    return GeneratedDateTimeColumn(
      'updatedOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        memberId,
        amount,
        categoryId,
        groupId,
        fromAccountId,
        toAccountId,
        notes,
        attachments,
        createdOn,
        updatedOn
      ];
  @override
  $TransactionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Transactions';
  @override
  final String actualTableName = 'Transactions';
  @override
  VerificationContext validateIntegrity(TransactionsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.memberId.present) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableValue(d.memberId.value, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (d.amount.present) {
      context.handle(
          _amountMeta, amount.isAcceptableValue(d.amount.value, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (d.categoryId.present) {
      context.handle(_categoryIdMeta,
          categoryId.isAcceptableValue(d.categoryId.value, _categoryIdMeta));
    }
    if (d.groupId.present) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableValue(d.groupId.value, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (d.fromAccountId.present) {
      context.handle(
          _fromAccountIdMeta,
          fromAccountId.isAcceptableValue(
              d.fromAccountId.value, _fromAccountIdMeta));
    }
    if (d.toAccountId.present) {
      context.handle(_toAccountIdMeta,
          toAccountId.isAcceptableValue(d.toAccountId.value, _toAccountIdMeta));
    }
    if (d.notes.present) {
      context.handle(
          _notesMeta, notes.isAcceptableValue(d.notes.value, _notesMeta));
    }
    if (d.attachments.present) {
      context.handle(_attachmentsMeta,
          attachments.isAcceptableValue(d.attachments.value, _attachmentsMeta));
    }
    if (d.createdOn.present) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableValue(d.createdOn.value, _createdOnMeta));
    }
    if (d.updatedOn.present) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableValue(d.updatedOn.value, _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Transaction.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TransactionsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.memberId.present) {
      map['memberId'] = Variable<String, StringType>(d.memberId.value);
    }
    if (d.amount.present) {
      map['amount'] = Variable<double, RealType>(d.amount.value);
    }
    if (d.categoryId.present) {
      map['categoryId'] = Variable<int, IntType>(d.categoryId.value);
    }
    if (d.groupId.present) {
      map['groupId'] = Variable<String, StringType>(d.groupId.value);
    }
    if (d.fromAccountId.present) {
      map['fromAccountId'] = Variable<int, IntType>(d.fromAccountId.value);
    }
    if (d.toAccountId.present) {
      map['toAccountId'] = Variable<int, IntType>(d.toAccountId.value);
    }
    if (d.notes.present) {
      map['notes'] = Variable<String, StringType>(d.notes.value);
    }
    if (d.attachments.present) {
      map['attachments'] = Variable<String, StringType>(d.attachments.value);
    }
    if (d.createdOn.present) {
      map['createdOn'] = Variable<DateTime, DateTimeType>(d.createdOn.value);
    }
    if (d.updatedOn.present) {
      map['updatedOn'] = Variable<DateTime, DateTimeType>(d.updatedOn.value);
    }
    return map;
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(_db, alias);
  }
}

abstract class _$SprightlyData extends GeneratedDatabase {
  _$SprightlyData(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MembersTable _members;
  $MembersTable get members => _members ??= $MembersTable(this);
  $GroupsTable _groups;
  $GroupsTable get groups => _groups ??= $GroupsTable(this);
  $GroupMembersTable _groupMembers;
  $GroupMembersTable get groupMembers =>
      _groupMembers ??= $GroupMembersTable(this);
  $AccountsTable _accounts;
  $AccountsTable get accounts => _accounts ??= $AccountsTable(this);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  $TransactionsTable _transactions;
  $TransactionsTable get transactions =>
      _transactions ??= $TransactionsTable(this);
  Member _rowToMember(QueryRow row) {
    return Member(
      id: row.readString('id'),
      name: row.readString('name'),
      nickName: row.readString('nickName'),
      avatar: row.readBlob('avatar'),
      idType: row.readString('idType'),
      idValue: row.readString('idValue'),
      secondaryIdValue: row.readString('secondaryIdValue'),
      isGroupExpense: row.readBool('isGroupExpense'),
      createdOn: row.readDateTime('createdOn'),
      updatedOn: row.readDateTime('updatedOn'),
    );
  }

  Selectable<Member> groupOnlyMembersQuery(String groupId) {
    return customSelectQuery(
        'SELECT m.* FROM Members m JOIN GroupMembers gm ON gm.memberId=m.id WHERE idType=\'Group\' AND gm.groupId=:groupId',
        variables: [Variable.withString(groupId)],
        readsFrom: {members, groupMembers}).map(_rowToMember);
  }

  Future<List<Member>> groupOnlyMembers(String groupId) {
    return groupOnlyMembersQuery(groupId).get();
  }

  Stream<List<Member>> watchGroupOnlyMembers(String groupId) {
    return groupOnlyMembersQuery(groupId).watch();
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [members, groups, groupMembers, accounts, categories, transactions];
}

class AppFont extends DataClass implements Insertable<AppFont> {
  final int id;
  final String name;
  final String family;
  final String type;
  final String style;
  final int weight;
  final DateTime createdOn;
  final DateTime updatedOn;
  AppFont(
      {@required this.id,
      @required this.name,
      @required this.family,
      @required this.type,
      @required this.style,
      @required this.weight,
      @required this.createdOn,
      @required this.updatedOn});
  factory AppFont.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return AppFont(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      family:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}family']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      style:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}style']),
      weight: intType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  factory AppFont.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AppFont(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      family: serializer.fromJson<String>(json['family']),
      type: serializer.fromJson<String>(json['type']),
      style: serializer.fromJson<String>(json['style']),
      weight: serializer.fromJson<int>(json['weight']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'family': serializer.toJson<String>(family),
      'type': serializer.toJson<String>(type),
      'style': serializer.toJson<String>(style),
      'weight': serializer.toJson<int>(weight),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  @override
  AppFontsCompanion createCompanion(bool nullToAbsent) {
    return AppFontsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      family:
          family == null && nullToAbsent ? const Value.absent() : Value(family),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      style:
          style == null && nullToAbsent ? const Value.absent() : Value(style),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  AppFont copyWith(
          {int id,
          String name,
          String family,
          String type,
          String style,
          int weight,
          DateTime createdOn,
          DateTime updatedOn}) =>
      AppFont(
        id: id ?? this.id,
        name: name ?? this.name,
        family: family ?? this.family,
        type: type ?? this.type,
        style: style ?? this.style,
        weight: weight ?? this.weight,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('AppFont(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('family: $family, ')
          ..write('type: $type, ')
          ..write('style: $style, ')
          ..write('weight: $weight, ')
          ..write('createdOn: $createdOn, ')
          ..write('updatedOn: $updatedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              family.hashCode,
              $mrjc(
                  type.hashCode,
                  $mrjc(
                      style.hashCode,
                      $mrjc(weight.hashCode,
                          $mrjc(createdOn.hashCode, updatedOn.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AppFont &&
          other.id == this.id &&
          other.name == this.name &&
          other.family == this.family &&
          other.type == this.type &&
          other.style == this.style &&
          other.weight == this.weight &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class AppFontsCompanion extends UpdateCompanion<AppFont> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> family;
  final Value<String> type;
  final Value<String> style;
  final Value<int> weight;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const AppFontsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.family = const Value.absent(),
    this.type = const Value.absent(),
    this.style = const Value.absent(),
    this.weight = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  AppFontsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String family,
    @required String type,
    @required String style,
    this.weight = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : name = Value(name),
        family = Value(family),
        type = Value(type),
        style = Value(style);
  AppFontsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> family,
      Value<String> type,
      Value<String> style,
      Value<int> weight,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return AppFontsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      family: family ?? this.family,
      type: type ?? this.type,
      style: style ?? this.style,
      weight: weight ?? this.weight,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }
}

class $AppFontsTable extends AppFonts with TableInfo<$AppFontsTable, AppFont> {
  final GeneratedDatabase _db;
  final String _alias;
  $AppFontsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 50);
  }

  final VerificationMeta _familyMeta = const VerificationMeta('family');
  GeneratedTextColumn _family;
  @override
  GeneratedTextColumn get family => _family ??= _constructFamily();
  GeneratedTextColumn _constructFamily() {
    return GeneratedTextColumn('family', $tableName, false, maxTextLength: 20);
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, false,
        $customConstraints: 'CHECK (type IN (\'Regular\', \'Mono\')) NOT NULL');
  }

  final VerificationMeta _styleMeta = const VerificationMeta('style');
  GeneratedTextColumn _style;
  @override
  GeneratedTextColumn get style => _style ??= _constructStyle();
  GeneratedTextColumn _constructStyle() {
    return GeneratedTextColumn('style', $tableName, false,
        $customConstraints:
            'CHECK (style IN (\'Regular\', \'Italic\', \'Bold\', \'BoldItalic\')) NOT NULL');
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedIntColumn _weight;
  @override
  GeneratedIntColumn get weight => _weight ??= _constructWeight();
  GeneratedIntColumn _constructWeight() {
    return GeneratedIntColumn('weight', $tableName, false,
        defaultValue: const Constant(100));
  }

  final VerificationMeta _createdOnMeta = const VerificationMeta('createdOn');
  GeneratedDateTimeColumn _createdOn;
  @override
  GeneratedDateTimeColumn get createdOn => _createdOn ??= _constructCreatedOn();
  GeneratedDateTimeColumn _constructCreatedOn() {
    return GeneratedDateTimeColumn(
      'createdOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  final VerificationMeta _updatedOnMeta = const VerificationMeta('updatedOn');
  GeneratedDateTimeColumn _updatedOn;
  @override
  GeneratedDateTimeColumn get updatedOn => _updatedOn ??= _constructUpdatedOn();
  GeneratedDateTimeColumn _constructUpdatedOn() {
    return GeneratedDateTimeColumn(
      'updatedOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, family, type, style, weight, createdOn, updatedOn];
  @override
  $AppFontsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'AppFonts';
  @override
  final String actualTableName = 'AppFonts';
  @override
  VerificationContext validateIntegrity(AppFontsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.family.present) {
      context.handle(
          _familyMeta, family.isAcceptableValue(d.family.value, _familyMeta));
    } else if (isInserting) {
      context.missing(_familyMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (d.style.present) {
      context.handle(
          _styleMeta, style.isAcceptableValue(d.style.value, _styleMeta));
    } else if (isInserting) {
      context.missing(_styleMeta);
    }
    if (d.weight.present) {
      context.handle(
          _weightMeta, weight.isAcceptableValue(d.weight.value, _weightMeta));
    }
    if (d.createdOn.present) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableValue(d.createdOn.value, _createdOnMeta));
    }
    if (d.updatedOn.present) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableValue(d.updatedOn.value, _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppFont map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AppFont.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AppFontsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.family.present) {
      map['family'] = Variable<String, StringType>(d.family.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.style.present) {
      map['style'] = Variable<String, StringType>(d.style.value);
    }
    if (d.weight.present) {
      map['weight'] = Variable<int, IntType>(d.weight.value);
    }
    if (d.createdOn.present) {
      map['createdOn'] = Variable<DateTime, DateTimeType>(d.createdOn.value);
    }
    if (d.updatedOn.present) {
      map['updatedOn'] = Variable<DateTime, DateTimeType>(d.updatedOn.value);
    }
    return map;
  }

  @override
  $AppFontsTable createAlias(String alias) {
    return $AppFontsTable(_db, alias);
  }
}

abstract class _$SprightlySetupData extends GeneratedDatabase {
  _$SprightlySetupData(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $AppFontsTable _appFonts;
  $AppFontsTable get appFonts => _appFonts ??= $AppFontsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appFonts];
}
