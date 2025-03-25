// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bl_user_db_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBlUserDbEntityCollection on Isar {
  IsarCollection<BlUserDbEntity> get blUserDbEntitys => this.collection();
}

const BlUserDbEntitySchema = CollectionSchema(
  name: r'BlUserDbEntity',
  id: 1476156475667996605,
  properties: {
    r'avatar': PropertySchema(
      id: 0,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'des': PropertySchema(
      id: 2,
      name: r'des',
      type: IsarType.string,
    ),
    r'homeCover': PropertySchema(
      id: 3,
      name: r'homeCover',
      type: IsarType.string,
    ),
    r'isBlacked': PropertySchema(
      id: 4,
      name: r'isBlacked',
      type: IsarType.bool,
    ),
    r'isCollected': PropertySchema(
      id: 5,
      name: r'isCollected',
      type: IsarType.bool,
    ),
    r'isFollowed': PropertySchema(
      id: 6,
      name: r'isFollowed',
      type: IsarType.bool,
    ),
    r'isLiked': PropertySchema(
      id: 7,
      name: r'isLiked',
      type: IsarType.bool,
    ),
    r'myId': PropertySchema(
      id: 8,
      name: r'myId',
      type: IsarType.string,
    ),
    r'nickName': PropertySchema(
      id: 9,
      name: r'nickName',
      type: IsarType.string,
    ),
    r'picList': PropertySchema(
      id: 10,
      name: r'picList',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 11,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 13,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _blUserDbEntityEstimateSize,
  serialize: _blUserDbEntitySerialize,
  deserialize: _blUserDbEntityDeserialize,
  deserializeProp: _blUserDbEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'myId': IndexSchema(
      id: 2753551250489382315,
      name: r'myId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'myId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _blUserDbEntityGetId,
  getLinks: _blUserDbEntityGetLinks,
  attach: _blUserDbEntityAttach,
  version: '3.1.0+1',
);

int _blUserDbEntityEstimateSize(
  BlUserDbEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.des;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.homeCover;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.myId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nickName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.picList;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _blUserDbEntitySerialize(
  BlUserDbEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatar);
  writer.writeLong(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.des);
  writer.writeString(offsets[3], object.homeCover);
  writer.writeBool(offsets[4], object.isBlacked);
  writer.writeBool(offsets[5], object.isCollected);
  writer.writeBool(offsets[6], object.isFollowed);
  writer.writeBool(offsets[7], object.isLiked);
  writer.writeString(offsets[8], object.myId);
  writer.writeString(offsets[9], object.nickName);
  writer.writeStringList(offsets[10], object.picList);
  writer.writeString(offsets[11], object.title);
  writer.writeLong(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.userId);
}

BlUserDbEntity _blUserDbEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlUserDbEntity();
  object.avatar = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readLongOrNull(offsets[1]);
  object.des = reader.readStringOrNull(offsets[2]);
  object.homeCover = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.isBlacked = reader.readBoolOrNull(offsets[4]);
  object.isCollected = reader.readBoolOrNull(offsets[5]);
  object.isFollowed = reader.readBoolOrNull(offsets[6]);
  object.isLiked = reader.readBoolOrNull(offsets[7]);
  object.myId = reader.readStringOrNull(offsets[8]);
  object.nickName = reader.readStringOrNull(offsets[9]);
  object.picList = reader.readStringList(offsets[10]);
  object.title = reader.readStringOrNull(offsets[11]);
  object.updatedAt = reader.readLongOrNull(offsets[12]);
  object.userId = reader.readStringOrNull(offsets[13]);
  return object;
}

P _blUserDbEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringList(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _blUserDbEntityGetId(BlUserDbEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _blUserDbEntityGetLinks(BlUserDbEntity object) {
  return [];
}

void _blUserDbEntityAttach(
    IsarCollection<dynamic> col, Id id, BlUserDbEntity object) {
  object.id = id;
}

extension BlUserDbEntityQueryWhereSort
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QWhere> {
  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BlUserDbEntityQueryWhere
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QWhereClause> {
  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause> myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause>
      myIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'myId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause> myIdEqualTo(
      String? myId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [myId],
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterWhereClause>
      myIdNotEqualTo(String? myId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'myId',
              lower: [],
              upper: [myId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'myId',
              lower: [myId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'myId',
              lower: [myId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'myId',
              lower: [],
              upper: [myId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BlUserDbEntityQueryFilter
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QFilterCondition> {
  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      createdAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      createdAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      createdAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      createdAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'des',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'des',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'des',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'des',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'des',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'des',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'des',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'des',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'des',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'des',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'des',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      desIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'des',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'homeCover',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'homeCover',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'homeCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'homeCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'homeCover',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'homeCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'homeCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'homeCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'homeCover',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeCover',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      homeCoverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'homeCover',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isBlackedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isBlacked',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isBlackedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isBlacked',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isBlackedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlacked',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isCollectedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCollected',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isCollectedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCollected',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isCollectedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCollected',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isFollowedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFollowed',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isFollowedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFollowed',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isFollowedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFollowed',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isLikedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLiked',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isLikedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLiked',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      isLikedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLiked',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'myId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'myId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      myIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nickName',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nickName',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nickName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nickName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nickName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nickName',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      nickNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nickName',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'picList',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'picList',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'picList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'picList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'picList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'picList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'picList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'picList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'picList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'picList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'picList',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'picList',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'picList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'picList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'picList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'picList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'picList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      picListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'picList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      updatedAtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      updatedAtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      updatedAtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension BlUserDbEntityQueryObject
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QFilterCondition> {}

extension BlUserDbEntityQueryLinks
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QFilterCondition> {}

extension BlUserDbEntityQuerySortBy
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QSortBy> {
  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByDes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'des', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByDesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'des', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByHomeCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeCover', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByHomeCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeCover', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByIsBlacked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacked', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByIsBlackedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacked', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByIsCollectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByIsFollowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFollowed', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByIsFollowedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFollowed', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByIsLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByNickName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByNickNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension BlUserDbEntityQuerySortThenBy
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QSortThenBy> {
  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByDes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'des', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByDesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'des', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByHomeCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeCover', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByHomeCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeCover', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByIsBlacked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacked', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByIsBlackedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacked', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByIsCollectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByIsFollowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFollowed', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByIsFollowedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFollowed', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByIsLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByNickName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByNickNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickName', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension BlUserDbEntityQueryWhereDistinct
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> {
  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByDes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'des', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByHomeCover(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'homeCover', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct>
      distinctByIsBlacked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBlacked');
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct>
      distinctByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCollected');
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct>
      distinctByIsFollowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFollowed');
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLiked');
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByMyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'myId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByNickName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nickName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByPicList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'picList');
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BlUserDbEntity, BlUserDbEntity, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension BlUserDbEntityQueryProperty
    on QueryBuilder<BlUserDbEntity, BlUserDbEntity, QQueryProperty> {
  QueryBuilder<BlUserDbEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BlUserDbEntity, String?, QQueryOperations> avatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatar');
    });
  }

  QueryBuilder<BlUserDbEntity, int?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BlUserDbEntity, String?, QQueryOperations> desProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'des');
    });
  }

  QueryBuilder<BlUserDbEntity, String?, QQueryOperations> homeCoverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'homeCover');
    });
  }

  QueryBuilder<BlUserDbEntity, bool?, QQueryOperations> isBlackedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBlacked');
    });
  }

  QueryBuilder<BlUserDbEntity, bool?, QQueryOperations> isCollectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCollected');
    });
  }

  QueryBuilder<BlUserDbEntity, bool?, QQueryOperations> isFollowedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFollowed');
    });
  }

  QueryBuilder<BlUserDbEntity, bool?, QQueryOperations> isLikedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLiked');
    });
  }

  QueryBuilder<BlUserDbEntity, String?, QQueryOperations> myIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myId');
    });
  }

  QueryBuilder<BlUserDbEntity, String?, QQueryOperations> nickNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nickName');
    });
  }

  QueryBuilder<BlUserDbEntity, List<String>?, QQueryOperations>
      picListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'picList');
    });
  }

  QueryBuilder<BlUserDbEntity, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BlUserDbEntity, int?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BlUserDbEntity, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
