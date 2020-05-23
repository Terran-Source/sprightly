// GENERATED CODE - DO NOT MODIFY BY HAND

part of sprightly.moor_database;

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Member extends DataClass implements Insertable<Member> {
  final String id;
  final String name;
  final String nickName;
  final String avatar;
  final String idType;
  final String idValue;
  final String secondaryIdValue;
  final bool isGroupExpense;
  final String signature;
  final DateTime createdOn;
  final DateTime updatedOn;
  Member(
      {@required this.id,
      this.name,
      this.nickName,
      this.avatar,
      @required this.idType,
      @required this.idValue,
      this.secondaryIdValue,
      @required this.isGroupExpense,
      this.signature,
      @required this.createdOn,
      this.updatedOn});
  factory Member.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Member(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      nickName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}nickName']),
      avatar:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}avatar']),
      idType:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}idType']),
      idValue:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}idValue']),
      secondaryIdValue: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}secondaryIdValue']),
      isGroupExpense: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isGroupExpense']),
      signature: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}signature']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || nickName != null) {
      map['nickName'] = Variable<String>(nickName);
    }
    if (!nullToAbsent || avatar != null) {
      map['avatar'] = Variable<String>(avatar);
    }
    if (!nullToAbsent || idType != null) {
      map['idType'] = Variable<String>(idType);
    }
    if (!nullToAbsent || idValue != null) {
      map['idValue'] = Variable<String>(idValue);
    }
    if (!nullToAbsent || secondaryIdValue != null) {
      map['secondaryIdValue'] = Variable<String>(secondaryIdValue);
    }
    if (!nullToAbsent || isGroupExpense != null) {
      map['isGroupExpense'] = Variable<bool>(isGroupExpense);
    }
    if (!nullToAbsent || signature != null) {
      map['signature'] = Variable<String>(signature);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
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
      signature: signature == null && nullToAbsent
          ? const Value.absent()
          : Value(signature),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  factory Member.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      nickName: serializer.fromJson<String>(json['nickName']),
      avatar: serializer.fromJson<String>(json['avatar']),
      idType: serializer.fromJson<String>(json['idType']),
      idValue: serializer.fromJson<String>(json['idValue']),
      secondaryIdValue: serializer.fromJson<String>(json['secondaryIdValue']),
      isGroupExpense: serializer.fromJson<bool>(json['isGroupExpense']),
      signature: serializer.fromJson<String>(json['signature']),
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
      'avatar': serializer.toJson<String>(avatar),
      'idType': serializer.toJson<String>(idType),
      'idValue': serializer.toJson<String>(idValue),
      'secondaryIdValue': serializer.toJson<String>(secondaryIdValue),
      'isGroupExpense': serializer.toJson<bool>(isGroupExpense),
      'signature': serializer.toJson<String>(signature),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  Member copyWith(
          {String id,
          String name,
          String nickName,
          String avatar,
          String idType,
          String idValue,
          String secondaryIdValue,
          bool isGroupExpense,
          String signature,
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
        signature: signature ?? this.signature,
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
          ..write('signature: $signature, ')
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
                                  $mrjc(
                                      signature.hashCode,
                                      $mrjc(createdOn.hashCode,
                                          updatedOn.hashCode)))))))))));
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
          other.signature == this.signature &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> nickName;
  final Value<String> avatar;
  final Value<String> idType;
  final Value<String> idValue;
  final Value<String> secondaryIdValue;
  final Value<bool> isGroupExpense;
  final Value<String> signature;
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
    this.signature = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  MembersCompanion.insert({
    @required String id,
    this.name = const Value.absent(),
    this.nickName = const Value.absent(),
    this.avatar = const Value.absent(),
    @required String idType,
    @required String idValue,
    this.secondaryIdValue = const Value.absent(),
    this.isGroupExpense = const Value.absent(),
    this.signature = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : id = Value(id),
        idType = Value(idType),
        idValue = Value(idValue);
  static Insertable<Member> custom({
    Expression<String> id,
    Expression<String> name,
    Expression<String> nickName,
    Expression<String> avatar,
    Expression<String> idType,
    Expression<String> idValue,
    Expression<String> secondaryIdValue,
    Expression<bool> isGroupExpense,
    Expression<String> signature,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nickName != null) 'nickName': nickName,
      if (avatar != null) 'avatar': avatar,
      if (idType != null) 'idType': idType,
      if (idValue != null) 'idValue': idValue,
      if (secondaryIdValue != null) 'secondaryIdValue': secondaryIdValue,
      if (isGroupExpense != null) 'isGroupExpense': isGroupExpense,
      if (signature != null) 'signature': signature,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

  MembersCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> nickName,
      Value<String> avatar,
      Value<String> idType,
      Value<String> idValue,
      Value<String> secondaryIdValue,
      Value<bool> isGroupExpense,
      Value<String> signature,
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
      signature: signature ?? this.signature,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nickName.present) {
      map['nickName'] = Variable<String>(nickName.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (idType.present) {
      map['idType'] = Variable<String>(idType.value);
    }
    if (idValue.present) {
      map['idValue'] = Variable<String>(idValue.value);
    }
    if (secondaryIdValue.present) {
      map['secondaryIdValue'] = Variable<String>(secondaryIdValue.value);
    }
    if (isGroupExpense.present) {
      map['isGroupExpense'] = Variable<bool>(isGroupExpense.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
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
    return GeneratedTextColumn('nickName', $tableName, true, maxTextLength: 10);
  }

  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  GeneratedTextColumn _avatar;
  @override
  GeneratedTextColumn get avatar => _avatar ??= _constructAvatar();
  GeneratedTextColumn _constructAvatar() {
    return GeneratedTextColumn(
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
            'CHECK (idType IN (\'Phone\',\'Email\',\'NickName\',\'Group\',\'GroupMember\')) NOT NULL');
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

  final VerificationMeta _signatureMeta = const VerificationMeta('signature');
  GeneratedTextColumn _signature;
  @override
  GeneratedTextColumn get signature => _signature ??= _constructSignature();
  GeneratedTextColumn _constructSignature() {
    return GeneratedTextColumn(
      'signature',
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
      true,
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
        signature,
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
  VerificationContext validateIntegrity(Insertable<Member> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('nickName')) {
      context.handle(_nickNameMeta,
          nickName.isAcceptableOrUnknown(data['nickName'], _nickNameMeta));
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar'], _avatarMeta));
    }
    if (data.containsKey('idType')) {
      context.handle(_idTypeMeta,
          idType.isAcceptableOrUnknown(data['idType'], _idTypeMeta));
    } else if (isInserting) {
      context.missing(_idTypeMeta);
    }
    if (data.containsKey('idValue')) {
      context.handle(_idValueMeta,
          idValue.isAcceptableOrUnknown(data['idValue'], _idValueMeta));
    } else if (isInserting) {
      context.missing(_idValueMeta);
    }
    if (data.containsKey('secondaryIdValue')) {
      context.handle(
          _secondaryIdValueMeta,
          secondaryIdValue.isAcceptableOrUnknown(
              data['secondaryIdValue'], _secondaryIdValueMeta));
    }
    if (data.containsKey('isGroupExpense')) {
      context.handle(
          _isGroupExpenseMeta,
          isGroupExpense.isAcceptableOrUnknown(
              data['isGroupExpense'], _isGroupExpenseMeta));
    }
    if (data.containsKey('signature')) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data['signature'], _signatureMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
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
  $MembersTable createAlias(String alias) {
    return $MembersTable(_db, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final String id;
  final String name;
  final String type;
  final bool isHidden;
  final DateTime createdOn;
  final DateTime updatedOn;
  Group(
      {@required this.id,
      @required this.name,
      this.type,
      @required this.isHidden,
      @required this.createdOn,
      this.updatedOn});
  factory Group.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Group(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      isHidden:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isHidden']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || isHidden != null) {
      map['isHidden'] = Variable<bool>(isHidden);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      isHidden: isHidden == null && nullToAbsent
          ? const Value.absent()
          : Value(isHidden),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      isHidden: serializer.fromJson<bool>(json['isHidden']),
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
      'isHidden': serializer.toJson<bool>(isHidden),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  Group copyWith(
          {String id,
          String name,
          String type,
          bool isHidden,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Group(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        isHidden: isHidden ?? this.isHidden,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isHidden: $isHidden, ')
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
              type.hashCode,
              $mrjc(isHidden.hashCode,
                  $mrjc(createdOn.hashCode, updatedOn.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Group &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.isHidden == this.isHidden &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<bool> isHidden;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  GroupsCompanion.insert({
    @required String id,
    @required String name,
    this.type = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Group> custom({
    Expression<String> id,
    Expression<String> name,
    Expression<String> type,
    Expression<bool> isHidden,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (isHidden != null) 'isHidden': isHidden,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

  GroupsCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<bool> isHidden,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return GroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      isHidden: isHidden ?? this.isHidden,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isHidden.present) {
      map['isHidden'] = Variable<bool>(isHidden.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
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
            'CHECK (type IN (\'Personal\',\'Budget\',\'Shared\')) NOT NULL DEFAULT \'Shared\'');
  }

  final VerificationMeta _isHiddenMeta = const VerificationMeta('isHidden');
  GeneratedBoolColumn _isHidden;
  @override
  GeneratedBoolColumn get isHidden => _isHidden ??= _constructIsHidden();
  GeneratedBoolColumn _constructIsHidden() {
    return GeneratedBoolColumn('isHidden', $tableName, false,
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
      true,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, isHidden, createdOn, updatedOn];
  @override
  $GroupsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Groups';
  @override
  final String actualTableName = 'Groups';
  @override
  VerificationContext validateIntegrity(Insertable<Group> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    if (data.containsKey('isHidden')) {
      context.handle(_isHiddenMeta,
          isHidden.isAcceptableOrUnknown(data['isHidden'], _isHiddenMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
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
      this.updatedOn});
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || groupId != null) {
      map['groupId'] = Variable<String>(groupId);
    }
    if (!nullToAbsent || memberId != null) {
      map['memberId'] = Variable<String>(memberId);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  GroupMembersCompanion toCompanion(bool nullToAbsent) {
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
  static Insertable<GroupMember> custom({
    Expression<int> id,
    Expression<String> groupId,
    Expression<String> memberId,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'groupId': groupId,
      if (memberId != null) 'memberId': memberId,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (groupId.present) {
      map['groupId'] = Variable<String>(groupId.value);
    }
    if (memberId.present) {
      map['memberId'] = Variable<String>(memberId.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
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
      true,
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
  VerificationContext validateIntegrity(Insertable<GroupMember> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('groupId')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['groupId'], _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('memberId')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['memberId'], _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
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
  $GroupMembersTable createAlias(String alias) {
    return $GroupMembersTable(_db, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final String name;
  final String groupId;
  final int parentId;
  final String type;
  final String memberId;
  final double balance;
  final DateTime createdOn;
  final DateTime updatedOn;
  Account(
      {@required this.id,
      @required this.name,
      @required this.groupId,
      this.parentId,
      this.type,
      this.memberId,
      @required this.balance,
      @required this.createdOn,
      this.updatedOn});
  factory Account.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Account(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      groupId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groupId']),
      parentId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}parentId']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      memberId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}memberId']),
      balance:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}balance']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || groupId != null) {
      map['groupId'] = Variable<String>(groupId);
    }
    if (!nullToAbsent || parentId != null) {
      map['parentId'] = Variable<int>(parentId);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || memberId != null) {
      map['memberId'] = Variable<String>(memberId);
    }
    if (!nullToAbsent || balance != null) {
      map['balance'] = Variable<double>(balance);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      memberId: memberId == null && nullToAbsent
          ? const Value.absent()
          : Value(memberId),
      balance: balance == null && nullToAbsent
          ? const Value.absent()
          : Value(balance),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      groupId: serializer.fromJson<String>(json['groupId']),
      parentId: serializer.fromJson<int>(json['parentId']),
      type: serializer.fromJson<String>(json['type']),
      memberId: serializer.fromJson<String>(json['memberId']),
      balance: serializer.fromJson<double>(json['balance']),
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
      'groupId': serializer.toJson<String>(groupId),
      'parentId': serializer.toJson<int>(parentId),
      'type': serializer.toJson<String>(type),
      'memberId': serializer.toJson<String>(memberId),
      'balance': serializer.toJson<double>(balance),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  Account copyWith(
          {int id,
          String name,
          String groupId,
          int parentId,
          String type,
          String memberId,
          double balance,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        groupId: groupId ?? this.groupId,
        parentId: parentId ?? this.parentId,
        type: type ?? this.type,
        memberId: memberId ?? this.memberId,
        balance: balance ?? this.balance,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('groupId: $groupId, ')
          ..write('parentId: $parentId, ')
          ..write('type: $type, ')
          ..write('memberId: $memberId, ')
          ..write('balance: $balance, ')
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
              groupId.hashCode,
              $mrjc(
                  parentId.hashCode,
                  $mrjc(
                      type.hashCode,
                      $mrjc(
                          memberId.hashCode,
                          $mrjc(
                              balance.hashCode,
                              $mrjc(createdOn.hashCode,
                                  updatedOn.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.name == this.name &&
          other.groupId == this.groupId &&
          other.parentId == this.parentId &&
          other.type == this.type &&
          other.memberId == this.memberId &&
          other.balance == this.balance &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> groupId;
  final Value<int> parentId;
  final Value<String> type;
  final Value<String> memberId;
  final Value<double> balance;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.groupId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.type = const Value.absent(),
    this.memberId = const Value.absent(),
    this.balance = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String groupId,
    this.parentId = const Value.absent(),
    this.type = const Value.absent(),
    this.memberId = const Value.absent(),
    this.balance = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : name = Value(name),
        groupId = Value(groupId);
  static Insertable<Account> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> groupId,
    Expression<int> parentId,
    Expression<String> type,
    Expression<String> memberId,
    Expression<double> balance,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (groupId != null) 'groupId': groupId,
      if (parentId != null) 'parentId': parentId,
      if (type != null) 'type': type,
      if (memberId != null) 'memberId': memberId,
      if (balance != null) 'balance': balance,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

  AccountsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> groupId,
      Value<int> parentId,
      Value<String> type,
      Value<String> memberId,
      Value<double> balance,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      groupId: groupId ?? this.groupId,
      parentId: parentId ?? this.parentId,
      type: type ?? this.type,
      memberId: memberId ?? this.memberId,
      balance: balance ?? this.balance,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (groupId.present) {
      map['groupId'] = Variable<String>(groupId.value);
    }
    if (parentId.present) {
      map['parentId'] = Variable<int>(parentId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (memberId.present) {
      map['memberId'] = Variable<String>(memberId.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
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

  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  GeneratedTextColumn _groupId;
  @override
  GeneratedTextColumn get groupId => _groupId ??= _constructGroupId();
  GeneratedTextColumn _constructGroupId() {
    return GeneratedTextColumn('groupId', $tableName, false,
        minTextLength: 16,
        $customConstraints: 'REFERENCES Groups(id) NOT NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  GeneratedIntColumn _parentId;
  @override
  GeneratedIntColumn get parentId => _parentId ??= _constructParentId();
  GeneratedIntColumn _constructParentId() {
    return GeneratedIntColumn('parentId', $tableName, true,
        $customConstraints: 'REFERENCES Accounts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, true,
        $customConstraints:
            'CHECK (type IN (\'Group\',\'Cash\',\'Credit\',\'Bank\',\'Investment\')) NULL');
  }

  final VerificationMeta _memberIdMeta = const VerificationMeta('memberId');
  GeneratedTextColumn _memberId;
  @override
  GeneratedTextColumn get memberId => _memberId ??= _constructMemberId();
  GeneratedTextColumn _constructMemberId() {
    return GeneratedTextColumn('memberId', $tableName, true,
        minTextLength: 16,
        $customConstraints: 'REFERENCES Members(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _balanceMeta = const VerificationMeta('balance');
  GeneratedRealColumn _balance;
  @override
  GeneratedRealColumn get balance => _balance ??= _constructBalance();
  GeneratedRealColumn _constructBalance() {
    return GeneratedRealColumn('balance', $tableName, false,
        defaultValue: const Constant(0));
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
      true,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        groupId,
        parentId,
        type,
        memberId,
        balance,
        createdOn,
        updatedOn
      ];
  @override
  $AccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Accounts';
  @override
  final String actualTableName = 'Accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('groupId')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['groupId'], _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('parentId')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parentId'], _parentIdMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    if (data.containsKey('memberId')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['memberId'], _memberIdMeta));
    }
    if (data.containsKey('balance')) {
      context.handle(_balanceMeta,
          balance.isAcceptableOrUnknown(data['balance'], _balanceMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
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
      this.updatedOn});
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || parentId != null) {
      map['parentId'] = Variable<int>(parentId);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
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
  static Insertable<Category> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> parentId,
    Expression<String> type,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (parentId != null) 'parentId': parentId,
      if (type != null) 'type': type,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentId.present) {
      map['parentId'] = Variable<int>(parentId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
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
        $customConstraints: 'REFERENCES Categories(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, true,
        $customConstraints:
            'CHECK (type IN (\'Expense\',\'Liability\',\'Income\',\'Investment\',\'Misc\')) NOT NULL DEFAULT \'Misc\'');
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
      true,
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
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parentId')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parentId'], _parentIdMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
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
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

class Settlement extends DataClass implements Insertable<Settlement> {
  final String id;
  final String groupId;
  final String fromMemberId;
  final String toMemberId;
  final double amount;
  final double settledAmount;
  final bool isTemporary;
  final String transactionId;
  final String signature;
  final DateTime createdOn;
  final DateTime updatedOn;
  Settlement(
      {@required this.id,
      @required this.groupId,
      @required this.fromMemberId,
      @required this.toMemberId,
      @required this.amount,
      this.settledAmount,
      @required this.isTemporary,
      this.transactionId,
      this.signature,
      @required this.createdOn,
      this.updatedOn});
  factory Settlement.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Settlement(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      groupId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groupId']),
      fromMemberId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}fromMemberId']),
      toMemberId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}toMemberId']),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
      settledAmount: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}settledAmount']),
      isTemporary: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isTemporary']),
      transactionId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}transactionId']),
      signature: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}signature']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || groupId != null) {
      map['groupId'] = Variable<String>(groupId);
    }
    if (!nullToAbsent || fromMemberId != null) {
      map['fromMemberId'] = Variable<String>(fromMemberId);
    }
    if (!nullToAbsent || toMemberId != null) {
      map['toMemberId'] = Variable<String>(toMemberId);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || settledAmount != null) {
      map['settledAmount'] = Variable<double>(settledAmount);
    }
    if (!nullToAbsent || isTemporary != null) {
      map['isTemporary'] = Variable<bool>(isTemporary);
    }
    if (!nullToAbsent || transactionId != null) {
      map['transactionId'] = Variable<String>(transactionId);
    }
    if (!nullToAbsent || signature != null) {
      map['signature'] = Variable<String>(signature);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  SettlementsCompanion toCompanion(bool nullToAbsent) {
    return SettlementsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      fromMemberId: fromMemberId == null && nullToAbsent
          ? const Value.absent()
          : Value(fromMemberId),
      toMemberId: toMemberId == null && nullToAbsent
          ? const Value.absent()
          : Value(toMemberId),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      settledAmount: settledAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(settledAmount),
      isTemporary: isTemporary == null && nullToAbsent
          ? const Value.absent()
          : Value(isTemporary),
      transactionId: transactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(transactionId),
      signature: signature == null && nullToAbsent
          ? const Value.absent()
          : Value(signature),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  factory Settlement.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Settlement(
      id: serializer.fromJson<String>(json['id']),
      groupId: serializer.fromJson<String>(json['groupId']),
      fromMemberId: serializer.fromJson<String>(json['fromMemberId']),
      toMemberId: serializer.fromJson<String>(json['toMemberId']),
      amount: serializer.fromJson<double>(json['amount']),
      settledAmount: serializer.fromJson<double>(json['settledAmount']),
      isTemporary: serializer.fromJson<bool>(json['isTemporary']),
      transactionId: serializer.fromJson<String>(json['transactionId']),
      signature: serializer.fromJson<String>(json['signature']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'groupId': serializer.toJson<String>(groupId),
      'fromMemberId': serializer.toJson<String>(fromMemberId),
      'toMemberId': serializer.toJson<String>(toMemberId),
      'amount': serializer.toJson<double>(amount),
      'settledAmount': serializer.toJson<double>(settledAmount),
      'isTemporary': serializer.toJson<bool>(isTemporary),
      'transactionId': serializer.toJson<String>(transactionId),
      'signature': serializer.toJson<String>(signature),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  Settlement copyWith(
          {String id,
          String groupId,
          String fromMemberId,
          String toMemberId,
          double amount,
          double settledAmount,
          bool isTemporary,
          String transactionId,
          String signature,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Settlement(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        fromMemberId: fromMemberId ?? this.fromMemberId,
        toMemberId: toMemberId ?? this.toMemberId,
        amount: amount ?? this.amount,
        settledAmount: settledAmount ?? this.settledAmount,
        isTemporary: isTemporary ?? this.isTemporary,
        transactionId: transactionId ?? this.transactionId,
        signature: signature ?? this.signature,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Settlement(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('fromMemberId: $fromMemberId, ')
          ..write('toMemberId: $toMemberId, ')
          ..write('amount: $amount, ')
          ..write('settledAmount: $settledAmount, ')
          ..write('isTemporary: $isTemporary, ')
          ..write('transactionId: $transactionId, ')
          ..write('signature: $signature, ')
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
          $mrjc(
              fromMemberId.hashCode,
              $mrjc(
                  toMemberId.hashCode,
                  $mrjc(
                      amount.hashCode,
                      $mrjc(
                          settledAmount.hashCode,
                          $mrjc(
                              isTemporary.hashCode,
                              $mrjc(
                                  transactionId.hashCode,
                                  $mrjc(
                                      signature.hashCode,
                                      $mrjc(createdOn.hashCode,
                                          updatedOn.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Settlement &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.fromMemberId == this.fromMemberId &&
          other.toMemberId == this.toMemberId &&
          other.amount == this.amount &&
          other.settledAmount == this.settledAmount &&
          other.isTemporary == this.isTemporary &&
          other.transactionId == this.transactionId &&
          other.signature == this.signature &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class SettlementsCompanion extends UpdateCompanion<Settlement> {
  final Value<String> id;
  final Value<String> groupId;
  final Value<String> fromMemberId;
  final Value<String> toMemberId;
  final Value<double> amount;
  final Value<double> settledAmount;
  final Value<bool> isTemporary;
  final Value<String> transactionId;
  final Value<String> signature;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const SettlementsCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.fromMemberId = const Value.absent(),
    this.toMemberId = const Value.absent(),
    this.amount = const Value.absent(),
    this.settledAmount = const Value.absent(),
    this.isTemporary = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.signature = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  SettlementsCompanion.insert({
    @required String id,
    @required String groupId,
    @required String fromMemberId,
    @required String toMemberId,
    @required double amount,
    this.settledAmount = const Value.absent(),
    this.isTemporary = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.signature = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : id = Value(id),
        groupId = Value(groupId),
        fromMemberId = Value(fromMemberId),
        toMemberId = Value(toMemberId),
        amount = Value(amount);
  static Insertable<Settlement> custom({
    Expression<String> id,
    Expression<String> groupId,
    Expression<String> fromMemberId,
    Expression<String> toMemberId,
    Expression<double> amount,
    Expression<double> settledAmount,
    Expression<bool> isTemporary,
    Expression<String> transactionId,
    Expression<String> signature,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'groupId': groupId,
      if (fromMemberId != null) 'fromMemberId': fromMemberId,
      if (toMemberId != null) 'toMemberId': toMemberId,
      if (amount != null) 'amount': amount,
      if (settledAmount != null) 'settledAmount': settledAmount,
      if (isTemporary != null) 'isTemporary': isTemporary,
      if (transactionId != null) 'transactionId': transactionId,
      if (signature != null) 'signature': signature,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

  SettlementsCompanion copyWith(
      {Value<String> id,
      Value<String> groupId,
      Value<String> fromMemberId,
      Value<String> toMemberId,
      Value<double> amount,
      Value<double> settledAmount,
      Value<bool> isTemporary,
      Value<String> transactionId,
      Value<String> signature,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return SettlementsCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      fromMemberId: fromMemberId ?? this.fromMemberId,
      toMemberId: toMemberId ?? this.toMemberId,
      amount: amount ?? this.amount,
      settledAmount: settledAmount ?? this.settledAmount,
      isTemporary: isTemporary ?? this.isTemporary,
      transactionId: transactionId ?? this.transactionId,
      signature: signature ?? this.signature,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (groupId.present) {
      map['groupId'] = Variable<String>(groupId.value);
    }
    if (fromMemberId.present) {
      map['fromMemberId'] = Variable<String>(fromMemberId.value);
    }
    if (toMemberId.present) {
      map['toMemberId'] = Variable<String>(toMemberId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (settledAmount.present) {
      map['settledAmount'] = Variable<double>(settledAmount.value);
    }
    if (isTemporary.present) {
      map['isTemporary'] = Variable<bool>(isTemporary.value);
    }
    if (transactionId.present) {
      map['transactionId'] = Variable<String>(transactionId.value);
    }
    if (signature.present) {
      map['signature'] = Variable<String>(signature.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
  }
}

class $SettlementsTable extends Settlements
    with TableInfo<$SettlementsTable, Settlement> {
  final GeneratedDatabase _db;
  final String _alias;
  $SettlementsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false, minTextLength: 16);
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

  final VerificationMeta _fromMemberIdMeta =
      const VerificationMeta('fromMemberId');
  GeneratedTextColumn _fromMemberId;
  @override
  GeneratedTextColumn get fromMemberId =>
      _fromMemberId ??= _constructFromMemberId();
  GeneratedTextColumn _constructFromMemberId() {
    return GeneratedTextColumn('fromMemberId', $tableName, false,
        minTextLength: 16,
        $customConstraints:
            'REFERENCES Members(id) NOT NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _toMemberIdMeta = const VerificationMeta('toMemberId');
  GeneratedTextColumn _toMemberId;
  @override
  GeneratedTextColumn get toMemberId => _toMemberId ??= _constructToMemberId();
  GeneratedTextColumn _constructToMemberId() {
    return GeneratedTextColumn('toMemberId', $tableName, false,
        minTextLength: 16,
        $customConstraints:
            'REFERENCES Members(id) NOT NULL ON UPDATE CASCADE');
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

  final VerificationMeta _settledAmountMeta =
      const VerificationMeta('settledAmount');
  GeneratedRealColumn _settledAmount;
  @override
  GeneratedRealColumn get settledAmount =>
      _settledAmount ??= _constructSettledAmount();
  GeneratedRealColumn _constructSettledAmount() {
    return GeneratedRealColumn(
      'settledAmount',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isTemporaryMeta =
      const VerificationMeta('isTemporary');
  GeneratedBoolColumn _isTemporary;
  @override
  GeneratedBoolColumn get isTemporary =>
      _isTemporary ??= _constructIsTemporary();
  GeneratedBoolColumn _constructIsTemporary() {
    return GeneratedBoolColumn('isTemporary', $tableName, false,
        defaultValue: const Constant(true));
  }

  final VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  GeneratedTextColumn _transactionId;
  @override
  GeneratedTextColumn get transactionId =>
      _transactionId ??= _constructTransactionId();
  GeneratedTextColumn _constructTransactionId() {
    return GeneratedTextColumn('transactionId', $tableName, true,
        minTextLength: 16,
        $customConstraints:
            'REFERENCES Transactions(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _signatureMeta = const VerificationMeta('signature');
  GeneratedTextColumn _signature;
  @override
  GeneratedTextColumn get signature => _signature ??= _constructSignature();
  GeneratedTextColumn _constructSignature() {
    return GeneratedTextColumn(
      'signature',
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
      true,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        groupId,
        fromMemberId,
        toMemberId,
        amount,
        settledAmount,
        isTemporary,
        transactionId,
        signature,
        createdOn,
        updatedOn
      ];
  @override
  $SettlementsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'Settlements';
  @override
  final String actualTableName = 'Settlements';
  @override
  VerificationContext validateIntegrity(Insertable<Settlement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('groupId')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['groupId'], _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('fromMemberId')) {
      context.handle(
          _fromMemberIdMeta,
          fromMemberId.isAcceptableOrUnknown(
              data['fromMemberId'], _fromMemberIdMeta));
    } else if (isInserting) {
      context.missing(_fromMemberIdMeta);
    }
    if (data.containsKey('toMemberId')) {
      context.handle(
          _toMemberIdMeta,
          toMemberId.isAcceptableOrUnknown(
              data['toMemberId'], _toMemberIdMeta));
    } else if (isInserting) {
      context.missing(_toMemberIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('settledAmount')) {
      context.handle(
          _settledAmountMeta,
          settledAmount.isAcceptableOrUnknown(
              data['settledAmount'], _settledAmountMeta));
    }
    if (data.containsKey('isTemporary')) {
      context.handle(
          _isTemporaryMeta,
          isTemporary.isAcceptableOrUnknown(
              data['isTemporary'], _isTemporaryMeta));
    }
    if (data.containsKey('transactionId')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transactionId'], _transactionIdMeta));
    }
    if (data.containsKey('signature')) {
      context.handle(_signatureMeta,
          signature.isAcceptableOrUnknown(data['signature'], _signatureMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Settlement map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Settlement.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SettlementsTable createAlias(String alias) {
    return $SettlementsTable(_db, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final String id;
  final String memberId;
  final double amount;
  final String groupId;
  final String groupMemberIds;
  final int fromAccountId;
  final int toAccountId;
  final int categoryId;
  final String settlementId;
  final String notes;
  final String attachments;
  final String tags;
  final DateTime doneOn;
  final DateTime createdOn;
  final DateTime updatedOn;
  Transaction(
      {@required this.id,
      @required this.memberId,
      @required this.amount,
      @required this.groupId,
      this.groupMemberIds,
      this.fromAccountId,
      this.toAccountId,
      this.categoryId,
      this.settlementId,
      this.notes,
      this.attachments,
      this.tags,
      @required this.doneOn,
      @required this.createdOn,
      this.updatedOn});
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
      groupId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}groupId']),
      groupMemberIds: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}groupMemberIds']),
      fromAccountId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}fromAccountId']),
      toAccountId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}toAccountId']),
      categoryId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}categoryId']),
      settlementId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}settlementId']),
      notes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}notes']),
      attachments: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}attachments']),
      tags: stringType.mapFromDatabaseResponse(data['${effectivePrefix}tags']),
      doneOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}doneOn']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || memberId != null) {
      map['memberId'] = Variable<String>(memberId);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    if (!nullToAbsent || groupId != null) {
      map['groupId'] = Variable<String>(groupId);
    }
    if (!nullToAbsent || groupMemberIds != null) {
      map['groupMemberIds'] = Variable<String>(groupMemberIds);
    }
    if (!nullToAbsent || fromAccountId != null) {
      map['fromAccountId'] = Variable<int>(fromAccountId);
    }
    if (!nullToAbsent || toAccountId != null) {
      map['toAccountId'] = Variable<int>(toAccountId);
    }
    if (!nullToAbsent || categoryId != null) {
      map['categoryId'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || settlementId != null) {
      map['settlementId'] = Variable<String>(settlementId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || attachments != null) {
      map['attachments'] = Variable<String>(attachments);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || doneOn != null) {
      map['doneOn'] = Variable<DateTime>(doneOn);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      memberId: memberId == null && nullToAbsent
          ? const Value.absent()
          : Value(memberId),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      groupMemberIds: groupMemberIds == null && nullToAbsent
          ? const Value.absent()
          : Value(groupMemberIds),
      fromAccountId: fromAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(fromAccountId),
      toAccountId: toAccountId == null && nullToAbsent
          ? const Value.absent()
          : Value(toAccountId),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      settlementId: settlementId == null && nullToAbsent
          ? const Value.absent()
          : Value(settlementId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      attachments: attachments == null && nullToAbsent
          ? const Value.absent()
          : Value(attachments),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      doneOn:
          doneOn == null && nullToAbsent ? const Value.absent() : Value(doneOn),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<String>(json['id']),
      memberId: serializer.fromJson<String>(json['memberId']),
      amount: serializer.fromJson<double>(json['amount']),
      groupId: serializer.fromJson<String>(json['groupId']),
      groupMemberIds: serializer.fromJson<String>(json['groupMemberIds']),
      fromAccountId: serializer.fromJson<int>(json['fromAccountId']),
      toAccountId: serializer.fromJson<int>(json['toAccountId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      settlementId: serializer.fromJson<String>(json['settlementId']),
      notes: serializer.fromJson<String>(json['notes']),
      attachments: serializer.fromJson<String>(json['attachments']),
      tags: serializer.fromJson<String>(json['tags']),
      doneOn: serializer.fromJson<DateTime>(json['doneOn']),
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
      'groupId': serializer.toJson<String>(groupId),
      'groupMemberIds': serializer.toJson<String>(groupMemberIds),
      'fromAccountId': serializer.toJson<int>(fromAccountId),
      'toAccountId': serializer.toJson<int>(toAccountId),
      'categoryId': serializer.toJson<int>(categoryId),
      'settlementId': serializer.toJson<String>(settlementId),
      'notes': serializer.toJson<String>(notes),
      'attachments': serializer.toJson<String>(attachments),
      'tags': serializer.toJson<String>(tags),
      'doneOn': serializer.toJson<DateTime>(doneOn),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  Transaction copyWith(
          {String id,
          String memberId,
          double amount,
          String groupId,
          String groupMemberIds,
          int fromAccountId,
          int toAccountId,
          int categoryId,
          String settlementId,
          String notes,
          String attachments,
          String tags,
          DateTime doneOn,
          DateTime createdOn,
          DateTime updatedOn}) =>
      Transaction(
        id: id ?? this.id,
        memberId: memberId ?? this.memberId,
        amount: amount ?? this.amount,
        groupId: groupId ?? this.groupId,
        groupMemberIds: groupMemberIds ?? this.groupMemberIds,
        fromAccountId: fromAccountId ?? this.fromAccountId,
        toAccountId: toAccountId ?? this.toAccountId,
        categoryId: categoryId ?? this.categoryId,
        settlementId: settlementId ?? this.settlementId,
        notes: notes ?? this.notes,
        attachments: attachments ?? this.attachments,
        tags: tags ?? this.tags,
        doneOn: doneOn ?? this.doneOn,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('amount: $amount, ')
          ..write('groupId: $groupId, ')
          ..write('groupMemberIds: $groupMemberIds, ')
          ..write('fromAccountId: $fromAccountId, ')
          ..write('toAccountId: $toAccountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('settlementId: $settlementId, ')
          ..write('notes: $notes, ')
          ..write('attachments: $attachments, ')
          ..write('tags: $tags, ')
          ..write('doneOn: $doneOn, ')
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
                  groupId.hashCode,
                  $mrjc(
                      groupMemberIds.hashCode,
                      $mrjc(
                          fromAccountId.hashCode,
                          $mrjc(
                              toAccountId.hashCode,
                              $mrjc(
                                  categoryId.hashCode,
                                  $mrjc(
                                      settlementId.hashCode,
                                      $mrjc(
                                          notes.hashCode,
                                          $mrjc(
                                              attachments.hashCode,
                                              $mrjc(
                                                  tags.hashCode,
                                                  $mrjc(
                                                      doneOn.hashCode,
                                                      $mrjc(
                                                          createdOn.hashCode,
                                                          updatedOn
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.amount == this.amount &&
          other.groupId == this.groupId &&
          other.groupMemberIds == this.groupMemberIds &&
          other.fromAccountId == this.fromAccountId &&
          other.toAccountId == this.toAccountId &&
          other.categoryId == this.categoryId &&
          other.settlementId == this.settlementId &&
          other.notes == this.notes &&
          other.attachments == this.attachments &&
          other.tags == this.tags &&
          other.doneOn == this.doneOn &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<String> id;
  final Value<String> memberId;
  final Value<double> amount;
  final Value<String> groupId;
  final Value<String> groupMemberIds;
  final Value<int> fromAccountId;
  final Value<int> toAccountId;
  final Value<int> categoryId;
  final Value<String> settlementId;
  final Value<String> notes;
  final Value<String> attachments;
  final Value<String> tags;
  final Value<DateTime> doneOn;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.amount = const Value.absent(),
    this.groupId = const Value.absent(),
    this.groupMemberIds = const Value.absent(),
    this.fromAccountId = const Value.absent(),
    this.toAccountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.settlementId = const Value.absent(),
    this.notes = const Value.absent(),
    this.attachments = const Value.absent(),
    this.tags = const Value.absent(),
    this.doneOn = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  TransactionsCompanion.insert({
    @required String id,
    @required String memberId,
    @required double amount,
    @required String groupId,
    this.groupMemberIds = const Value.absent(),
    this.fromAccountId = const Value.absent(),
    this.toAccountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.settlementId = const Value.absent(),
    this.notes = const Value.absent(),
    this.attachments = const Value.absent(),
    this.tags = const Value.absent(),
    this.doneOn = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : id = Value(id),
        memberId = Value(memberId),
        amount = Value(amount),
        groupId = Value(groupId);
  static Insertable<Transaction> custom({
    Expression<String> id,
    Expression<String> memberId,
    Expression<double> amount,
    Expression<String> groupId,
    Expression<String> groupMemberIds,
    Expression<int> fromAccountId,
    Expression<int> toAccountId,
    Expression<int> categoryId,
    Expression<String> settlementId,
    Expression<String> notes,
    Expression<String> attachments,
    Expression<String> tags,
    Expression<DateTime> doneOn,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberId != null) 'memberId': memberId,
      if (amount != null) 'amount': amount,
      if (groupId != null) 'groupId': groupId,
      if (groupMemberIds != null) 'groupMemberIds': groupMemberIds,
      if (fromAccountId != null) 'fromAccountId': fromAccountId,
      if (toAccountId != null) 'toAccountId': toAccountId,
      if (categoryId != null) 'categoryId': categoryId,
      if (settlementId != null) 'settlementId': settlementId,
      if (notes != null) 'notes': notes,
      if (attachments != null) 'attachments': attachments,
      if (tags != null) 'tags': tags,
      if (doneOn != null) 'doneOn': doneOn,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

  TransactionsCompanion copyWith(
      {Value<String> id,
      Value<String> memberId,
      Value<double> amount,
      Value<String> groupId,
      Value<String> groupMemberIds,
      Value<int> fromAccountId,
      Value<int> toAccountId,
      Value<int> categoryId,
      Value<String> settlementId,
      Value<String> notes,
      Value<String> attachments,
      Value<String> tags,
      Value<DateTime> doneOn,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      amount: amount ?? this.amount,
      groupId: groupId ?? this.groupId,
      groupMemberIds: groupMemberIds ?? this.groupMemberIds,
      fromAccountId: fromAccountId ?? this.fromAccountId,
      toAccountId: toAccountId ?? this.toAccountId,
      categoryId: categoryId ?? this.categoryId,
      settlementId: settlementId ?? this.settlementId,
      notes: notes ?? this.notes,
      attachments: attachments ?? this.attachments,
      tags: tags ?? this.tags,
      doneOn: doneOn ?? this.doneOn,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (memberId.present) {
      map['memberId'] = Variable<String>(memberId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (groupId.present) {
      map['groupId'] = Variable<String>(groupId.value);
    }
    if (groupMemberIds.present) {
      map['groupMemberIds'] = Variable<String>(groupMemberIds.value);
    }
    if (fromAccountId.present) {
      map['fromAccountId'] = Variable<int>(fromAccountId.value);
    }
    if (toAccountId.present) {
      map['toAccountId'] = Variable<int>(toAccountId.value);
    }
    if (categoryId.present) {
      map['categoryId'] = Variable<int>(categoryId.value);
    }
    if (settlementId.present) {
      map['settlementId'] = Variable<String>(settlementId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (attachments.present) {
      map['attachments'] = Variable<String>(attachments.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (doneOn.present) {
      map['doneOn'] = Variable<DateTime>(doneOn.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
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
    return GeneratedTextColumn('id', $tableName, false, minTextLength: 16);
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

  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  GeneratedTextColumn _groupId;
  @override
  GeneratedTextColumn get groupId => _groupId ??= _constructGroupId();
  GeneratedTextColumn _constructGroupId() {
    return GeneratedTextColumn('groupId', $tableName, false,
        minTextLength: 16,
        $customConstraints: 'REFERENCES Groups(id) NOT NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _groupMemberIdsMeta =
      const VerificationMeta('groupMemberIds');
  GeneratedTextColumn _groupMemberIds;
  @override
  GeneratedTextColumn get groupMemberIds =>
      _groupMemberIds ??= _constructGroupMemberIds();
  GeneratedTextColumn _constructGroupMemberIds() {
    return GeneratedTextColumn(
      'groupMemberIds',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fromAccountIdMeta =
      const VerificationMeta('fromAccountId');
  GeneratedIntColumn _fromAccountId;
  @override
  GeneratedIntColumn get fromAccountId =>
      _fromAccountId ??= _constructFromAccountId();
  GeneratedIntColumn _constructFromAccountId() {
    return GeneratedIntColumn('fromAccountId', $tableName, true,
        $customConstraints: 'REFERENCES Accounts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _toAccountIdMeta =
      const VerificationMeta('toAccountId');
  GeneratedIntColumn _toAccountId;
  @override
  GeneratedIntColumn get toAccountId =>
      _toAccountId ??= _constructToAccountId();
  GeneratedIntColumn _constructToAccountId() {
    return GeneratedIntColumn('toAccountId', $tableName, true,
        $customConstraints: 'REFERENCES Accounts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  GeneratedIntColumn _categoryId;
  @override
  GeneratedIntColumn get categoryId => _categoryId ??= _constructCategoryId();
  GeneratedIntColumn _constructCategoryId() {
    return GeneratedIntColumn('categoryId', $tableName, true,
        $customConstraints: 'REFERENCES Categories(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _settlementIdMeta =
      const VerificationMeta('settlementId');
  GeneratedTextColumn _settlementId;
  @override
  GeneratedTextColumn get settlementId =>
      _settlementId ??= _constructSettlementId();
  GeneratedTextColumn _constructSettlementId() {
    return GeneratedTextColumn('settlementId', $tableName, true,
        $customConstraints:
            'REFERENCES Settlements(id) NULL ON UPDATE CASCADE');
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

  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  GeneratedTextColumn _tags;
  @override
  GeneratedTextColumn get tags => _tags ??= _constructTags();
  GeneratedTextColumn _constructTags() {
    return GeneratedTextColumn(
      'tags',
      $tableName,
      true,
    );
  }

  final VerificationMeta _doneOnMeta = const VerificationMeta('doneOn');
  GeneratedDateTimeColumn _doneOn;
  @override
  GeneratedDateTimeColumn get doneOn => _doneOn ??= _constructDoneOn();
  GeneratedDateTimeColumn _constructDoneOn() {
    return GeneratedDateTimeColumn(
      'doneOn',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now().toUtc();
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
      true,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        memberId,
        amount,
        groupId,
        groupMemberIds,
        fromAccountId,
        toAccountId,
        categoryId,
        settlementId,
        notes,
        attachments,
        tags,
        doneOn,
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
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('memberId')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['memberId'], _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('groupId')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['groupId'], _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('groupMemberIds')) {
      context.handle(
          _groupMemberIdsMeta,
          groupMemberIds.isAcceptableOrUnknown(
              data['groupMemberIds'], _groupMemberIdsMeta));
    }
    if (data.containsKey('fromAccountId')) {
      context.handle(
          _fromAccountIdMeta,
          fromAccountId.isAcceptableOrUnknown(
              data['fromAccountId'], _fromAccountIdMeta));
    }
    if (data.containsKey('toAccountId')) {
      context.handle(
          _toAccountIdMeta,
          toAccountId.isAcceptableOrUnknown(
              data['toAccountId'], _toAccountIdMeta));
    }
    if (data.containsKey('categoryId')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['categoryId'], _categoryIdMeta));
    }
    if (data.containsKey('settlementId')) {
      context.handle(
          _settlementIdMeta,
          settlementId.isAcceptableOrUnknown(
              data['settlementId'], _settlementIdMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes'], _notesMeta));
    }
    if (data.containsKey('attachments')) {
      context.handle(
          _attachmentsMeta,
          attachments.isAcceptableOrUnknown(
              data['attachments'], _attachmentsMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags'], _tagsMeta));
    }
    if (data.containsKey('doneOn')) {
      context.handle(_doneOnMeta,
          doneOn.isAcceptableOrUnknown(data['doneOn'], _doneOnMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
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
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(_db, alias);
  }
}

abstract class _$SprightlyDatabase extends GeneratedDatabase {
  _$SprightlyDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
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
  $SettlementsTable _settlements;
  $SettlementsTable get settlements => _settlements ??= $SettlementsTable(this);
  $TransactionsTable _transactions;
  $TransactionsTable get transactions =>
      _transactions ??= $TransactionsTable(this);
  SprightlyDao _sprightlyDao;
  SprightlyDao get sprightlyDao =>
      _sprightlyDao ??= SprightlyDao(this as SprightlyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        members,
        groups,
        groupMembers,
        accounts,
        categories,
        settlements,
        transactions
      ];
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
      this.updatedOn});
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || family != null) {
      map['family'] = Variable<String>(family);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || style != null) {
      map['style'] = Variable<String>(style);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int>(weight);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  AppFontsCompanion toCompanion(bool nullToAbsent) {
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
  static Insertable<AppFont> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> family,
    Expression<String> type,
    Expression<String> style,
    Expression<int> weight,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (family != null) 'family': family,
      if (type != null) 'type': type,
      if (style != null) 'style': style,
      if (weight != null) 'weight': weight,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

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

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (family.present) {
      map['family'] = Variable<String>(family.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
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
        $customConstraints: 'CHECK (type IN (\'Regular\',\'Mono\')) NOT NULL');
  }

  final VerificationMeta _styleMeta = const VerificationMeta('style');
  GeneratedTextColumn _style;
  @override
  GeneratedTextColumn get style => _style ??= _constructStyle();
  GeneratedTextColumn _constructStyle() {
    return GeneratedTextColumn('style', $tableName, false,
        $customConstraints:
            'CHECK (style IN (\'Regular\',\'Italic\',\'Bold\',\'BoldItalic\')) NOT NULL');
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
      true,
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
  VerificationContext validateIntegrity(Insertable<AppFont> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('family')) {
      context.handle(_familyMeta,
          family.isAcceptableOrUnknown(data['family'], _familyMeta));
    } else if (isInserting) {
      context.missing(_familyMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('style')) {
      context.handle(
          _styleMeta, style.isAcceptableOrUnknown(data['style'], _styleMeta));
    } else if (isInserting) {
      context.missing(_styleMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight'], _weightMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
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
  $AppFontsTable createAlias(String alias) {
    return $AppFontsTable(_db, alias);
  }
}

class FontCombo extends DataClass implements Insertable<FontCombo> {
  final int id;
  final String name;
  final int headerFont;
  final int bodyFont;
  final int bodyFontBig;
  final int bodyFontMedium;
  final int bodyFontSmall;
  final int bodyFontTiny;
  final int valueFont;
  final int valueFontBig;
  final int valueFontMedium;
  final int valueFontSmall;
  final int valueFontTiny;
  final DateTime createdOn;
  final DateTime updatedOn;
  FontCombo(
      {@required this.id,
      @required this.name,
      @required this.headerFont,
      @required this.bodyFont,
      this.bodyFontBig,
      this.bodyFontMedium,
      this.bodyFontSmall,
      this.bodyFontTiny,
      @required this.valueFont,
      this.valueFontBig,
      this.valueFontMedium,
      this.valueFontSmall,
      this.valueFontTiny,
      @required this.createdOn,
      this.updatedOn});
  factory FontCombo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return FontCombo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      headerFont:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}headerFont']),
      bodyFont:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}bodyFont']),
      bodyFontBig: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}bodyFontBig']),
      bodyFontMedium: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}bodyFontMedium']),
      bodyFontSmall: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}bodyFontSmall']),
      bodyFontTiny: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}bodyFontTiny']),
      valueFont:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}valueFont']),
      valueFontBig: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}valueFontBig']),
      valueFontMedium: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}valueFontMedium']),
      valueFontSmall: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}valueFontSmall']),
      valueFontTiny: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}valueFontTiny']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || headerFont != null) {
      map['headerFont'] = Variable<int>(headerFont);
    }
    if (!nullToAbsent || bodyFont != null) {
      map['bodyFont'] = Variable<int>(bodyFont);
    }
    if (!nullToAbsent || bodyFontBig != null) {
      map['bodyFontBig'] = Variable<int>(bodyFontBig);
    }
    if (!nullToAbsent || bodyFontMedium != null) {
      map['bodyFontMedium'] = Variable<int>(bodyFontMedium);
    }
    if (!nullToAbsent || bodyFontSmall != null) {
      map['bodyFontSmall'] = Variable<int>(bodyFontSmall);
    }
    if (!nullToAbsent || bodyFontTiny != null) {
      map['bodyFontTiny'] = Variable<int>(bodyFontTiny);
    }
    if (!nullToAbsent || valueFont != null) {
      map['valueFont'] = Variable<int>(valueFont);
    }
    if (!nullToAbsent || valueFontBig != null) {
      map['valueFontBig'] = Variable<int>(valueFontBig);
    }
    if (!nullToAbsent || valueFontMedium != null) {
      map['valueFontMedium'] = Variable<int>(valueFontMedium);
    }
    if (!nullToAbsent || valueFontSmall != null) {
      map['valueFontSmall'] = Variable<int>(valueFontSmall);
    }
    if (!nullToAbsent || valueFontTiny != null) {
      map['valueFontTiny'] = Variable<int>(valueFontTiny);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  FontCombosCompanion toCompanion(bool nullToAbsent) {
    return FontCombosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      headerFont: headerFont == null && nullToAbsent
          ? const Value.absent()
          : Value(headerFont),
      bodyFont: bodyFont == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFont),
      bodyFontBig: bodyFontBig == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFontBig),
      bodyFontMedium: bodyFontMedium == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFontMedium),
      bodyFontSmall: bodyFontSmall == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFontSmall),
      bodyFontTiny: bodyFontTiny == null && nullToAbsent
          ? const Value.absent()
          : Value(bodyFontTiny),
      valueFont: valueFont == null && nullToAbsent
          ? const Value.absent()
          : Value(valueFont),
      valueFontBig: valueFontBig == null && nullToAbsent
          ? const Value.absent()
          : Value(valueFontBig),
      valueFontMedium: valueFontMedium == null && nullToAbsent
          ? const Value.absent()
          : Value(valueFontMedium),
      valueFontSmall: valueFontSmall == null && nullToAbsent
          ? const Value.absent()
          : Value(valueFontSmall),
      valueFontTiny: valueFontTiny == null && nullToAbsent
          ? const Value.absent()
          : Value(valueFontTiny),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  factory FontCombo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FontCombo(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      headerFont: serializer.fromJson<int>(json['headerFont']),
      bodyFont: serializer.fromJson<int>(json['bodyFont']),
      bodyFontBig: serializer.fromJson<int>(json['bodyFontBig']),
      bodyFontMedium: serializer.fromJson<int>(json['bodyFontMedium']),
      bodyFontSmall: serializer.fromJson<int>(json['bodyFontSmall']),
      bodyFontTiny: serializer.fromJson<int>(json['bodyFontTiny']),
      valueFont: serializer.fromJson<int>(json['valueFont']),
      valueFontBig: serializer.fromJson<int>(json['valueFontBig']),
      valueFontMedium: serializer.fromJson<int>(json['valueFontMedium']),
      valueFontSmall: serializer.fromJson<int>(json['valueFontSmall']),
      valueFontTiny: serializer.fromJson<int>(json['valueFontTiny']),
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
      'headerFont': serializer.toJson<int>(headerFont),
      'bodyFont': serializer.toJson<int>(bodyFont),
      'bodyFontBig': serializer.toJson<int>(bodyFontBig),
      'bodyFontMedium': serializer.toJson<int>(bodyFontMedium),
      'bodyFontSmall': serializer.toJson<int>(bodyFontSmall),
      'bodyFontTiny': serializer.toJson<int>(bodyFontTiny),
      'valueFont': serializer.toJson<int>(valueFont),
      'valueFontBig': serializer.toJson<int>(valueFontBig),
      'valueFontMedium': serializer.toJson<int>(valueFontMedium),
      'valueFontSmall': serializer.toJson<int>(valueFontSmall),
      'valueFontTiny': serializer.toJson<int>(valueFontTiny),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  FontCombo copyWith(
          {int id,
          String name,
          int headerFont,
          int bodyFont,
          int bodyFontBig,
          int bodyFontMedium,
          int bodyFontSmall,
          int bodyFontTiny,
          int valueFont,
          int valueFontBig,
          int valueFontMedium,
          int valueFontSmall,
          int valueFontTiny,
          DateTime createdOn,
          DateTime updatedOn}) =>
      FontCombo(
        id: id ?? this.id,
        name: name ?? this.name,
        headerFont: headerFont ?? this.headerFont,
        bodyFont: bodyFont ?? this.bodyFont,
        bodyFontBig: bodyFontBig ?? this.bodyFontBig,
        bodyFontMedium: bodyFontMedium ?? this.bodyFontMedium,
        bodyFontSmall: bodyFontSmall ?? this.bodyFontSmall,
        bodyFontTiny: bodyFontTiny ?? this.bodyFontTiny,
        valueFont: valueFont ?? this.valueFont,
        valueFontBig: valueFontBig ?? this.valueFontBig,
        valueFontMedium: valueFontMedium ?? this.valueFontMedium,
        valueFontSmall: valueFontSmall ?? this.valueFontSmall,
        valueFontTiny: valueFontTiny ?? this.valueFontTiny,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('FontCombo(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('headerFont: $headerFont, ')
          ..write('bodyFont: $bodyFont, ')
          ..write('bodyFontBig: $bodyFontBig, ')
          ..write('bodyFontMedium: $bodyFontMedium, ')
          ..write('bodyFontSmall: $bodyFontSmall, ')
          ..write('bodyFontTiny: $bodyFontTiny, ')
          ..write('valueFont: $valueFont, ')
          ..write('valueFontBig: $valueFontBig, ')
          ..write('valueFontMedium: $valueFontMedium, ')
          ..write('valueFontSmall: $valueFontSmall, ')
          ..write('valueFontTiny: $valueFontTiny, ')
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
              headerFont.hashCode,
              $mrjc(
                  bodyFont.hashCode,
                  $mrjc(
                      bodyFontBig.hashCode,
                      $mrjc(
                          bodyFontMedium.hashCode,
                          $mrjc(
                              bodyFontSmall.hashCode,
                              $mrjc(
                                  bodyFontTiny.hashCode,
                                  $mrjc(
                                      valueFont.hashCode,
                                      $mrjc(
                                          valueFontBig.hashCode,
                                          $mrjc(
                                              valueFontMedium.hashCode,
                                              $mrjc(
                                                  valueFontSmall.hashCode,
                                                  $mrjc(
                                                      valueFontTiny.hashCode,
                                                      $mrjc(
                                                          createdOn.hashCode,
                                                          updatedOn
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FontCombo &&
          other.id == this.id &&
          other.name == this.name &&
          other.headerFont == this.headerFont &&
          other.bodyFont == this.bodyFont &&
          other.bodyFontBig == this.bodyFontBig &&
          other.bodyFontMedium == this.bodyFontMedium &&
          other.bodyFontSmall == this.bodyFontSmall &&
          other.bodyFontTiny == this.bodyFontTiny &&
          other.valueFont == this.valueFont &&
          other.valueFontBig == this.valueFontBig &&
          other.valueFontMedium == this.valueFontMedium &&
          other.valueFontSmall == this.valueFontSmall &&
          other.valueFontTiny == this.valueFontTiny &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class FontCombosCompanion extends UpdateCompanion<FontCombo> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> headerFont;
  final Value<int> bodyFont;
  final Value<int> bodyFontBig;
  final Value<int> bodyFontMedium;
  final Value<int> bodyFontSmall;
  final Value<int> bodyFontTiny;
  final Value<int> valueFont;
  final Value<int> valueFontBig;
  final Value<int> valueFontMedium;
  final Value<int> valueFontSmall;
  final Value<int> valueFontTiny;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const FontCombosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.headerFont = const Value.absent(),
    this.bodyFont = const Value.absent(),
    this.bodyFontBig = const Value.absent(),
    this.bodyFontMedium = const Value.absent(),
    this.bodyFontSmall = const Value.absent(),
    this.bodyFontTiny = const Value.absent(),
    this.valueFont = const Value.absent(),
    this.valueFontBig = const Value.absent(),
    this.valueFontMedium = const Value.absent(),
    this.valueFontSmall = const Value.absent(),
    this.valueFontTiny = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  FontCombosCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int headerFont,
    @required int bodyFont,
    this.bodyFontBig = const Value.absent(),
    this.bodyFontMedium = const Value.absent(),
    this.bodyFontSmall = const Value.absent(),
    this.bodyFontTiny = const Value.absent(),
    @required int valueFont,
    this.valueFontBig = const Value.absent(),
    this.valueFontMedium = const Value.absent(),
    this.valueFontSmall = const Value.absent(),
    this.valueFontTiny = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : name = Value(name),
        headerFont = Value(headerFont),
        bodyFont = Value(bodyFont),
        valueFont = Value(valueFont);
  static Insertable<FontCombo> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> headerFont,
    Expression<int> bodyFont,
    Expression<int> bodyFontBig,
    Expression<int> bodyFontMedium,
    Expression<int> bodyFontSmall,
    Expression<int> bodyFontTiny,
    Expression<int> valueFont,
    Expression<int> valueFontBig,
    Expression<int> valueFontMedium,
    Expression<int> valueFontSmall,
    Expression<int> valueFontTiny,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (headerFont != null) 'headerFont': headerFont,
      if (bodyFont != null) 'bodyFont': bodyFont,
      if (bodyFontBig != null) 'bodyFontBig': bodyFontBig,
      if (bodyFontMedium != null) 'bodyFontMedium': bodyFontMedium,
      if (bodyFontSmall != null) 'bodyFontSmall': bodyFontSmall,
      if (bodyFontTiny != null) 'bodyFontTiny': bodyFontTiny,
      if (valueFont != null) 'valueFont': valueFont,
      if (valueFontBig != null) 'valueFontBig': valueFontBig,
      if (valueFontMedium != null) 'valueFontMedium': valueFontMedium,
      if (valueFontSmall != null) 'valueFontSmall': valueFontSmall,
      if (valueFontTiny != null) 'valueFontTiny': valueFontTiny,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

  FontCombosCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> headerFont,
      Value<int> bodyFont,
      Value<int> bodyFontBig,
      Value<int> bodyFontMedium,
      Value<int> bodyFontSmall,
      Value<int> bodyFontTiny,
      Value<int> valueFont,
      Value<int> valueFontBig,
      Value<int> valueFontMedium,
      Value<int> valueFontSmall,
      Value<int> valueFontTiny,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return FontCombosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      headerFont: headerFont ?? this.headerFont,
      bodyFont: bodyFont ?? this.bodyFont,
      bodyFontBig: bodyFontBig ?? this.bodyFontBig,
      bodyFontMedium: bodyFontMedium ?? this.bodyFontMedium,
      bodyFontSmall: bodyFontSmall ?? this.bodyFontSmall,
      bodyFontTiny: bodyFontTiny ?? this.bodyFontTiny,
      valueFont: valueFont ?? this.valueFont,
      valueFontBig: valueFontBig ?? this.valueFontBig,
      valueFontMedium: valueFontMedium ?? this.valueFontMedium,
      valueFontSmall: valueFontSmall ?? this.valueFontSmall,
      valueFontTiny: valueFontTiny ?? this.valueFontTiny,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (headerFont.present) {
      map['headerFont'] = Variable<int>(headerFont.value);
    }
    if (bodyFont.present) {
      map['bodyFont'] = Variable<int>(bodyFont.value);
    }
    if (bodyFontBig.present) {
      map['bodyFontBig'] = Variable<int>(bodyFontBig.value);
    }
    if (bodyFontMedium.present) {
      map['bodyFontMedium'] = Variable<int>(bodyFontMedium.value);
    }
    if (bodyFontSmall.present) {
      map['bodyFontSmall'] = Variable<int>(bodyFontSmall.value);
    }
    if (bodyFontTiny.present) {
      map['bodyFontTiny'] = Variable<int>(bodyFontTiny.value);
    }
    if (valueFont.present) {
      map['valueFont'] = Variable<int>(valueFont.value);
    }
    if (valueFontBig.present) {
      map['valueFontBig'] = Variable<int>(valueFontBig.value);
    }
    if (valueFontMedium.present) {
      map['valueFontMedium'] = Variable<int>(valueFontMedium.value);
    }
    if (valueFontSmall.present) {
      map['valueFontSmall'] = Variable<int>(valueFontSmall.value);
    }
    if (valueFontTiny.present) {
      map['valueFontTiny'] = Variable<int>(valueFontTiny.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
  }
}

class $FontCombosTable extends FontCombos
    with TableInfo<$FontCombosTable, FontCombo> {
  final GeneratedDatabase _db;
  final String _alias;
  $FontCombosTable(this._db, [this._alias]);
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

  final VerificationMeta _headerFontMeta = const VerificationMeta('headerFont');
  GeneratedIntColumn _headerFont;
  @override
  GeneratedIntColumn get headerFont => _headerFont ??= _constructHeaderFont();
  GeneratedIntColumn _constructHeaderFont() {
    return GeneratedIntColumn('headerFont', $tableName, false,
        $customConstraints:
            'REFERENCES AppFonts(id) NOT NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _bodyFontMeta = const VerificationMeta('bodyFont');
  GeneratedIntColumn _bodyFont;
  @override
  GeneratedIntColumn get bodyFont => _bodyFont ??= _constructBodyFont();
  GeneratedIntColumn _constructBodyFont() {
    return GeneratedIntColumn('bodyFont', $tableName, false,
        $customConstraints:
            'REFERENCES AppFonts(id) NOT NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _bodyFontBigMeta =
      const VerificationMeta('bodyFontBig');
  GeneratedIntColumn _bodyFontBig;
  @override
  GeneratedIntColumn get bodyFontBig =>
      _bodyFontBig ??= _constructBodyFontBig();
  GeneratedIntColumn _constructBodyFontBig() {
    return GeneratedIntColumn('bodyFontBig', $tableName, true,
        $customConstraints: 'REFERENCES AppFonts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _bodyFontMediumMeta =
      const VerificationMeta('bodyFontMedium');
  GeneratedIntColumn _bodyFontMedium;
  @override
  GeneratedIntColumn get bodyFontMedium =>
      _bodyFontMedium ??= _constructBodyFontMedium();
  GeneratedIntColumn _constructBodyFontMedium() {
    return GeneratedIntColumn('bodyFontMedium', $tableName, true,
        $customConstraints: 'REFERENCES AppFonts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _bodyFontSmallMeta =
      const VerificationMeta('bodyFontSmall');
  GeneratedIntColumn _bodyFontSmall;
  @override
  GeneratedIntColumn get bodyFontSmall =>
      _bodyFontSmall ??= _constructBodyFontSmall();
  GeneratedIntColumn _constructBodyFontSmall() {
    return GeneratedIntColumn('bodyFontSmall', $tableName, true,
        $customConstraints: 'REFERENCES AppFonts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _bodyFontTinyMeta =
      const VerificationMeta('bodyFontTiny');
  GeneratedIntColumn _bodyFontTiny;
  @override
  GeneratedIntColumn get bodyFontTiny =>
      _bodyFontTiny ??= _constructBodyFontTiny();
  GeneratedIntColumn _constructBodyFontTiny() {
    return GeneratedIntColumn('bodyFontTiny', $tableName, true,
        $customConstraints: 'REFERENCES AppFonts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _valueFontMeta = const VerificationMeta('valueFont');
  GeneratedIntColumn _valueFont;
  @override
  GeneratedIntColumn get valueFont => _valueFont ??= _constructValueFont();
  GeneratedIntColumn _constructValueFont() {
    return GeneratedIntColumn('valueFont', $tableName, false,
        $customConstraints:
            'REFERENCES AppFonts(id) NOT NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _valueFontBigMeta =
      const VerificationMeta('valueFontBig');
  GeneratedIntColumn _valueFontBig;
  @override
  GeneratedIntColumn get valueFontBig =>
      _valueFontBig ??= _constructValueFontBig();
  GeneratedIntColumn _constructValueFontBig() {
    return GeneratedIntColumn('valueFontBig', $tableName, true,
        $customConstraints: 'REFERENCES AppFonts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _valueFontMediumMeta =
      const VerificationMeta('valueFontMedium');
  GeneratedIntColumn _valueFontMedium;
  @override
  GeneratedIntColumn get valueFontMedium =>
      _valueFontMedium ??= _constructValueFontMedium();
  GeneratedIntColumn _constructValueFontMedium() {
    return GeneratedIntColumn('valueFontMedium', $tableName, true,
        $customConstraints: 'REFERENCES AppFonts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _valueFontSmallMeta =
      const VerificationMeta('valueFontSmall');
  GeneratedIntColumn _valueFontSmall;
  @override
  GeneratedIntColumn get valueFontSmall =>
      _valueFontSmall ??= _constructValueFontSmall();
  GeneratedIntColumn _constructValueFontSmall() {
    return GeneratedIntColumn('valueFontSmall', $tableName, true,
        $customConstraints: 'REFERENCES AppFonts(id) NULL ON UPDATE CASCADE');
  }

  final VerificationMeta _valueFontTinyMeta =
      const VerificationMeta('valueFontTiny');
  GeneratedIntColumn _valueFontTiny;
  @override
  GeneratedIntColumn get valueFontTiny =>
      _valueFontTiny ??= _constructValueFontTiny();
  GeneratedIntColumn _constructValueFontTiny() {
    return GeneratedIntColumn('valueFontTiny', $tableName, true,
        $customConstraints: 'REFERENCES AppFonts(id) NULL ON UPDATE CASCADE');
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
      true,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        headerFont,
        bodyFont,
        bodyFontBig,
        bodyFontMedium,
        bodyFontSmall,
        bodyFontTiny,
        valueFont,
        valueFontBig,
        valueFontMedium,
        valueFontSmall,
        valueFontTiny,
        createdOn,
        updatedOn
      ];
  @override
  $FontCombosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'FontCombos';
  @override
  final String actualTableName = 'FontCombos';
  @override
  VerificationContext validateIntegrity(Insertable<FontCombo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('headerFont')) {
      context.handle(
          _headerFontMeta,
          headerFont.isAcceptableOrUnknown(
              data['headerFont'], _headerFontMeta));
    } else if (isInserting) {
      context.missing(_headerFontMeta);
    }
    if (data.containsKey('bodyFont')) {
      context.handle(_bodyFontMeta,
          bodyFont.isAcceptableOrUnknown(data['bodyFont'], _bodyFontMeta));
    } else if (isInserting) {
      context.missing(_bodyFontMeta);
    }
    if (data.containsKey('bodyFontBig')) {
      context.handle(
          _bodyFontBigMeta,
          bodyFontBig.isAcceptableOrUnknown(
              data['bodyFontBig'], _bodyFontBigMeta));
    }
    if (data.containsKey('bodyFontMedium')) {
      context.handle(
          _bodyFontMediumMeta,
          bodyFontMedium.isAcceptableOrUnknown(
              data['bodyFontMedium'], _bodyFontMediumMeta));
    }
    if (data.containsKey('bodyFontSmall')) {
      context.handle(
          _bodyFontSmallMeta,
          bodyFontSmall.isAcceptableOrUnknown(
              data['bodyFontSmall'], _bodyFontSmallMeta));
    }
    if (data.containsKey('bodyFontTiny')) {
      context.handle(
          _bodyFontTinyMeta,
          bodyFontTiny.isAcceptableOrUnknown(
              data['bodyFontTiny'], _bodyFontTinyMeta));
    }
    if (data.containsKey('valueFont')) {
      context.handle(_valueFontMeta,
          valueFont.isAcceptableOrUnknown(data['valueFont'], _valueFontMeta));
    } else if (isInserting) {
      context.missing(_valueFontMeta);
    }
    if (data.containsKey('valueFontBig')) {
      context.handle(
          _valueFontBigMeta,
          valueFontBig.isAcceptableOrUnknown(
              data['valueFontBig'], _valueFontBigMeta));
    }
    if (data.containsKey('valueFontMedium')) {
      context.handle(
          _valueFontMediumMeta,
          valueFontMedium.isAcceptableOrUnknown(
              data['valueFontMedium'], _valueFontMediumMeta));
    }
    if (data.containsKey('valueFontSmall')) {
      context.handle(
          _valueFontSmallMeta,
          valueFontSmall.isAcceptableOrUnknown(
              data['valueFontSmall'], _valueFontSmallMeta));
    }
    if (data.containsKey('valueFontTiny')) {
      context.handle(
          _valueFontTinyMeta,
          valueFontTiny.isAcceptableOrUnknown(
              data['valueFontTiny'], _valueFontTinyMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FontCombo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FontCombo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FontCombosTable createAlias(String alias) {
    return $FontCombosTable(_db, alias);
  }
}

class ColorCombo extends DataClass implements Insertable<ColorCombo> {
  final int id;
  final String name;
  final String mode;
  final String backColor;
  final String foreColor;
  final DateTime createdOn;
  final DateTime updatedOn;
  ColorCombo(
      {@required this.id,
      @required this.name,
      @required this.mode,
      @required this.backColor,
      @required this.foreColor,
      @required this.createdOn,
      this.updatedOn});
  factory ColorCombo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ColorCombo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      mode: stringType.mapFromDatabaseResponse(data['${effectivePrefix}mode']),
      backColor: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}backColor']),
      foreColor: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}foreColor']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || mode != null) {
      map['mode'] = Variable<String>(mode);
    }
    if (!nullToAbsent || backColor != null) {
      map['backColor'] = Variable<String>(backColor);
    }
    if (!nullToAbsent || foreColor != null) {
      map['foreColor'] = Variable<String>(foreColor);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  ColorCombosCompanion toCompanion(bool nullToAbsent) {
    return ColorCombosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      mode: mode == null && nullToAbsent ? const Value.absent() : Value(mode),
      backColor: backColor == null && nullToAbsent
          ? const Value.absent()
          : Value(backColor),
      foreColor: foreColor == null && nullToAbsent
          ? const Value.absent()
          : Value(foreColor),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  factory ColorCombo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ColorCombo(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      mode: serializer.fromJson<String>(json['mode']),
      backColor: serializer.fromJson<String>(json['backColor']),
      foreColor: serializer.fromJson<String>(json['foreColor']),
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
      'mode': serializer.toJson<String>(mode),
      'backColor': serializer.toJson<String>(backColor),
      'foreColor': serializer.toJson<String>(foreColor),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  ColorCombo copyWith(
          {int id,
          String name,
          String mode,
          String backColor,
          String foreColor,
          DateTime createdOn,
          DateTime updatedOn}) =>
      ColorCombo(
        id: id ?? this.id,
        name: name ?? this.name,
        mode: mode ?? this.mode,
        backColor: backColor ?? this.backColor,
        foreColor: foreColor ?? this.foreColor,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('ColorCombo(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('mode: $mode, ')
          ..write('backColor: $backColor, ')
          ..write('foreColor: $foreColor, ')
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
              mode.hashCode,
              $mrjc(
                  backColor.hashCode,
                  $mrjc(foreColor.hashCode,
                      $mrjc(createdOn.hashCode, updatedOn.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ColorCombo &&
          other.id == this.id &&
          other.name == this.name &&
          other.mode == this.mode &&
          other.backColor == this.backColor &&
          other.foreColor == this.foreColor &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class ColorCombosCompanion extends UpdateCompanion<ColorCombo> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> mode;
  final Value<String> backColor;
  final Value<String> foreColor;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const ColorCombosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.mode = const Value.absent(),
    this.backColor = const Value.absent(),
    this.foreColor = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  ColorCombosCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String mode,
    @required String backColor,
    @required String foreColor,
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : name = Value(name),
        mode = Value(mode),
        backColor = Value(backColor),
        foreColor = Value(foreColor);
  static Insertable<ColorCombo> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> mode,
    Expression<String> backColor,
    Expression<String> foreColor,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (mode != null) 'mode': mode,
      if (backColor != null) 'backColor': backColor,
      if (foreColor != null) 'foreColor': foreColor,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

  ColorCombosCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> mode,
      Value<String> backColor,
      Value<String> foreColor,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return ColorCombosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      mode: mode ?? this.mode,
      backColor: backColor ?? this.backColor,
      foreColor: foreColor ?? this.foreColor,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (backColor.present) {
      map['backColor'] = Variable<String>(backColor.value);
    }
    if (foreColor.present) {
      map['foreColor'] = Variable<String>(foreColor.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
  }
}

class $ColorCombosTable extends ColorCombos
    with TableInfo<$ColorCombosTable, ColorCombo> {
  final GeneratedDatabase _db;
  final String _alias;
  $ColorCombosTable(this._db, [this._alias]);
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

  final VerificationMeta _modeMeta = const VerificationMeta('mode');
  GeneratedTextColumn _mode;
  @override
  GeneratedTextColumn get mode => _mode ??= _constructMode();
  GeneratedTextColumn _constructMode() {
    return GeneratedTextColumn('mode', $tableName, false,
        $customConstraints: 'CHECK (mode IN (\'Bright\',\'Dark\')) NOT NULL');
  }

  final VerificationMeta _backColorMeta = const VerificationMeta('backColor');
  GeneratedTextColumn _backColor;
  @override
  GeneratedTextColumn get backColor => _backColor ??= _constructBackColor();
  GeneratedTextColumn _constructBackColor() {
    return GeneratedTextColumn('backColor', $tableName, false,
        minTextLength: 3, maxTextLength: 6);
  }

  final VerificationMeta _foreColorMeta = const VerificationMeta('foreColor');
  GeneratedTextColumn _foreColor;
  @override
  GeneratedTextColumn get foreColor => _foreColor ??= _constructForeColor();
  GeneratedTextColumn _constructForeColor() {
    return GeneratedTextColumn('foreColor', $tableName, false,
        minTextLength: 3, maxTextLength: 6);
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
      true,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, mode, backColor, foreColor, createdOn, updatedOn];
  @override
  $ColorCombosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'ColorCombos';
  @override
  final String actualTableName = 'ColorCombos';
  @override
  VerificationContext validateIntegrity(Insertable<ColorCombo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
          _modeMeta, mode.isAcceptableOrUnknown(data['mode'], _modeMeta));
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('backColor')) {
      context.handle(_backColorMeta,
          backColor.isAcceptableOrUnknown(data['backColor'], _backColorMeta));
    } else if (isInserting) {
      context.missing(_backColorMeta);
    }
    if (data.containsKey('foreColor')) {
      context.handle(_foreColorMeta,
          foreColor.isAcceptableOrUnknown(data['foreColor'], _foreColorMeta));
    } else if (isInserting) {
      context.missing(_foreColorMeta);
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ColorCombo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ColorCombo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ColorCombosTable createAlias(String alias) {
    return $ColorCombosTable(_db, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String name;
  final String value;
  final String type;
  final DateTime createdOn;
  final DateTime updatedOn;
  AppSetting(
      {@required this.name,
      @required this.value,
      this.type,
      @required this.createdOn,
      this.updatedOn});
  factory AppSetting.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return AppSetting(
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      createdOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}createdOn']),
      updatedOn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updatedOn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || createdOn != null) {
      map['createdOn'] = Variable<DateTime>(createdOn);
    }
    if (!nullToAbsent || updatedOn != null) {
      map['updatedOn'] = Variable<DateTime>(updatedOn);
    }
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      createdOn: createdOn == null && nullToAbsent
          ? const Value.absent()
          : Value(createdOn),
      updatedOn: updatedOn == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedOn),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AppSetting(
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String>(json['value']),
      type: serializer.fromJson<String>(json['type']),
      createdOn: serializer.fromJson<DateTime>(json['createdOn']),
      updatedOn: serializer.fromJson<DateTime>(json['updatedOn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String>(value),
      'type': serializer.toJson<String>(type),
      'createdOn': serializer.toJson<DateTime>(createdOn),
      'updatedOn': serializer.toJson<DateTime>(updatedOn),
    };
  }

  AppSetting copyWith(
          {String name,
          String value,
          String type,
          DateTime createdOn,
          DateTime updatedOn}) =>
      AppSetting(
        name: name ?? this.name,
        value: value ?? this.value,
        type: type ?? this.type,
        createdOn: createdOn ?? this.createdOn,
        updatedOn: updatedOn ?? this.updatedOn,
      );
  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('type: $type, ')
          ..write('createdOn: $createdOn, ')
          ..write('updatedOn: $updatedOn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      name.hashCode,
      $mrjc(
          value.hashCode,
          $mrjc(
              type.hashCode, $mrjc(createdOn.hashCode, updatedOn.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.name == this.name &&
          other.value == this.value &&
          other.type == this.type &&
          other.createdOn == this.createdOn &&
          other.updatedOn == this.updatedOn);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> name;
  final Value<String> value;
  final Value<String> type;
  final Value<DateTime> createdOn;
  final Value<DateTime> updatedOn;
  const AppSettingsCompanion({
    this.name = const Value.absent(),
    this.value = const Value.absent(),
    this.type = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    @required String name,
    @required String value,
    this.type = const Value.absent(),
    this.createdOn = const Value.absent(),
    this.updatedOn = const Value.absent(),
  })  : name = Value(name),
        value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String> name,
    Expression<String> value,
    Expression<String> type,
    Expression<DateTime> createdOn,
    Expression<DateTime> updatedOn,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (value != null) 'value': value,
      if (type != null) 'type': type,
      if (createdOn != null) 'createdOn': createdOn,
      if (updatedOn != null) 'updatedOn': updatedOn,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String> name,
      Value<String> value,
      Value<String> type,
      Value<DateTime> createdOn,
      Value<DateTime> updatedOn}) {
    return AppSettingsCompanion(
      name: name ?? this.name,
      value: value ?? this.value,
      type: type ?? this.type,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdOn.present) {
      map['createdOn'] = Variable<DateTime>(createdOn.value);
    }
    if (updatedOn.present) {
      map['updatedOn'] = Variable<DateTime>(updatedOn.value);
    }
    return map;
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  final GeneratedDatabase _db;
  final String _alias;
  $AppSettingsTable(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 50);
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn(
      'value',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, true,
        $customConstraints:
            'CHECK (type IN (\'String\',\'Number\',\'Bool\',\'List\',\'AppInfo\',\'ThemeMode\')) NOT NULL  DEFAULT \'String\'');
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
      true,
    )..clientDefault = () => DateTime.now().toUtc();
  }

  @override
  List<GeneratedColumn> get $columns =>
      [name, value, type, createdOn, updatedOn];
  @override
  $AppSettingsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'AppSettings';
  @override
  final String actualTableName = 'AppSettings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type'], _typeMeta));
    }
    if (data.containsKey('createdOn')) {
      context.handle(_createdOnMeta,
          createdOn.isAcceptableOrUnknown(data['createdOn'], _createdOnMeta));
    }
    if (data.containsKey('updatedOn')) {
      context.handle(_updatedOnMeta,
          updatedOn.isAcceptableOrUnknown(data['updatedOn'], _updatedOnMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  AppSetting map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AppSetting.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(_db, alias);
  }
}

abstract class _$SprightlySetupDatabase extends GeneratedDatabase {
  _$SprightlySetupDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  $AppFontsTable _appFonts;
  $AppFontsTable get appFonts => _appFonts ??= $AppFontsTable(this);
  $FontCombosTable _fontCombos;
  $FontCombosTable get fontCombos => _fontCombos ??= $FontCombosTable(this);
  $ColorCombosTable _colorCombos;
  $ColorCombosTable get colorCombos => _colorCombos ??= $ColorCombosTable(this);
  $AppSettingsTable _appSettings;
  $AppSettingsTable get appSettings => _appSettings ??= $AppSettingsTable(this);
  SprightlySetupDao _sprightlySetupDao;
  SprightlySetupDao get sprightlySetupDao =>
      _sprightlySetupDao ??= SprightlySetupDao(this as SprightlySetupDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [appFonts, fontCombos, colorCombos, appSettings];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$SprightlyDaoMixin on DatabaseAccessor<SprightlyDatabase> {
  $MembersTable get members => attachedDatabase.members;
  $GroupsTable get groups => attachedDatabase.groups;
  $GroupMembersTable get groupMembers => attachedDatabase.groupMembers;
  $AccountsTable get accounts => attachedDatabase.accounts;
  $CategoriesTable get categories => attachedDatabase.categories;
  $SettlementsTable get settlements => attachedDatabase.settlements;
  $TransactionsTable get transactions => attachedDatabase.transactions;
}
mixin _$SprightlySetupDaoMixin on DatabaseAccessor<SprightlySetupDatabase> {
  $AppFontsTable get appFonts => attachedDatabase.appFonts;
  $FontCombosTable get fontCombos => attachedDatabase.fontCombos;
  $ColorCombosTable get colorCombos => attachedDatabase.colorCombos;
  $AppSettingsTable get appSettings => attachedDatabase.appSettings;
}
