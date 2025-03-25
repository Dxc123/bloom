// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bl_flower_db_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBlFlowerDbEntityCollection on Isar {
  IsarCollection<BlFlowerDbEntity> get blFlowerDbEntitys => this.collection();
}

const BlFlowerDbEntitySchema = CollectionSchema(
  name: r'BlFlowerDbEntity',
  id: 2773789277491737324,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'des': PropertySchema(
      id: 1,
      name: r'des',
      type: IsarType.string,
    ),
    r'flowerId': PropertySchema(
      id: 2,
      name: r'flowerId',
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
    r'picList': PropertySchema(
      id: 9,
      name: r'picList',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 10,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.long,
    )
  },
  estimateSize: _blFlowerDbEntityEstimateSize,
  serialize: _blFlowerDbEntitySerialize,
  deserialize: _blFlowerDbEntityDeserialize,
  deserializeProp: _blFlowerDbEntityDeserializeProp,
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
  getId: _blFlowerDbEntityGetId,
  getLinks: _blFlowerDbEntityGetLinks,
  attach: _blFlowerDbEntityAttach,
  version: '3.1.0+1',
);

int _blFlowerDbEntityEstimateSize(
  BlFlowerDbEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.des;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.flowerId;
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
  return bytesCount;
}

void _blFlowerDbEntitySerialize(
  BlFlowerDbEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.des);
  writer.writeString(offsets[2], object.flowerId);
  writer.writeString(offsets[3], object.homeCover);
  writer.writeBool(offsets[4], object.isBlacked);
  writer.writeBool(offsets[5], object.isCollected);
  writer.writeBool(offsets[6], object.isFollowed);
  writer.writeBool(offsets[7], object.isLiked);
  writer.writeString(offsets[8], object.myId);
  writer.writeStringList(offsets[9], object.picList);
  writer.writeString(offsets[10], object.title);
  writer.writeLong(offsets[11], object.updatedAt);
}

BlFlowerDbEntity _blFlowerDbEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlFlowerDbEntity();
  object.createdAt = reader.readLongOrNull(offsets[0]);
  object.des = reader.readStringOrNull(offsets[1]);
  object.flowerId = reader.readStringOrNull(offsets[2]);
  object.homeCover = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.isBlacked = reader.readBoolOrNull(offsets[4]);
  object.isCollected = reader.readBoolOrNull(offsets[5]);
  object.isFollowed = reader.readBoolOrNull(offsets[6]);
  object.isLiked = reader.readBoolOrNull(offsets[7]);
  object.myId = reader.readStringOrNull(offsets[8]);
  object.picList = reader.readStringList(offsets[9]);
  object.title = reader.readStringOrNull(offsets[10]);
  object.updatedAt = reader.readLongOrNull(offsets[11]);
  return object;
}

P _blFlowerDbEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
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
      return (reader.readStringList(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _blFlowerDbEntityGetId(BlFlowerDbEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _blFlowerDbEntityGetLinks(BlFlowerDbEntity object) {
  return [];
}

void _blFlowerDbEntityAttach(
    IsarCollection<dynamic> col, Id id, BlFlowerDbEntity object) {
  object.id = id;
}

extension BlFlowerDbEntityQueryWhereSort
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QWhere> {
  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BlFlowerDbEntityQueryWhere
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QWhereClause> {
  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause>
      myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause>
      myIdEqualTo(String? myId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [myId],
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterWhereClause>
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

extension BlFlowerDbEntityQueryFilter
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QFilterCondition> {
  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      createdAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      desIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'des',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      desIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'des',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      desContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'des',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      desMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'des',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      desIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'des',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      desIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'des',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'flowerId',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'flowerId',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flowerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flowerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flowerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flowerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'flowerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'flowerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'flowerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'flowerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flowerId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      flowerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'flowerId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      homeCoverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'homeCover',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      homeCoverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'homeCover',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      homeCoverContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'homeCover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      homeCoverMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'homeCover',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      homeCoverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeCover',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      homeCoverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'homeCover',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isBlackedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isBlacked',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isBlackedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isBlacked',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isBlackedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isBlacked',
        value: value,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isCollectedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCollected',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isCollectedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCollected',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isCollectedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCollected',
        value: value,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isFollowedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isFollowed',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isFollowedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isFollowed',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isFollowedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFollowed',
        value: value,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isLikedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLiked',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isLikedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLiked',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      isLikedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLiked',
        value: value,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      myIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      myIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      myIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'myId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      myIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      myIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      picListIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'picList',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      picListIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'picList',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      picListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'picList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      picListElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'picList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      picListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'picList',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      picListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'picList',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
      updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterFilterCondition>
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
}

extension BlFlowerDbEntityQueryObject
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QFilterCondition> {}

extension BlFlowerDbEntityQueryLinks
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QFilterCondition> {}

extension BlFlowerDbEntityQuerySortBy
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QSortBy> {
  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy> sortByDes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'des', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByDesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'des', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByFlowerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flowerId', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByFlowerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flowerId', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByHomeCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeCover', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByHomeCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeCover', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByIsBlacked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacked', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByIsBlackedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacked', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByIsCollectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByIsFollowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFollowed', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByIsFollowedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFollowed', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByIsLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy> sortByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BlFlowerDbEntityQuerySortThenBy
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QSortThenBy> {
  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy> thenByDes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'des', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByDesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'des', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByFlowerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flowerId', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByFlowerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flowerId', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByHomeCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeCover', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByHomeCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeCover', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIsBlacked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacked', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIsBlackedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlacked', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIsCollectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCollected', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIsFollowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFollowed', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIsFollowedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFollowed', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByIsLikedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLiked', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy> thenByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BlFlowerDbEntityQueryWhereDistinct
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct> {
  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct> distinctByDes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'des', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByFlowerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flowerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByHomeCover({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'homeCover', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByIsBlacked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBlacked');
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByIsCollected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCollected');
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByIsFollowed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFollowed');
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByIsLiked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLiked');
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct> distinctByMyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'myId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByPicList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'picList');
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BlFlowerDbEntityQueryProperty
    on QueryBuilder<BlFlowerDbEntity, BlFlowerDbEntity, QQueryProperty> {
  QueryBuilder<BlFlowerDbEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BlFlowerDbEntity, int?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BlFlowerDbEntity, String?, QQueryOperations> desProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'des');
    });
  }

  QueryBuilder<BlFlowerDbEntity, String?, QQueryOperations> flowerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flowerId');
    });
  }

  QueryBuilder<BlFlowerDbEntity, String?, QQueryOperations>
      homeCoverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'homeCover');
    });
  }

  QueryBuilder<BlFlowerDbEntity, bool?, QQueryOperations> isBlackedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBlacked');
    });
  }

  QueryBuilder<BlFlowerDbEntity, bool?, QQueryOperations>
      isCollectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCollected');
    });
  }

  QueryBuilder<BlFlowerDbEntity, bool?, QQueryOperations> isFollowedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFollowed');
    });
  }

  QueryBuilder<BlFlowerDbEntity, bool?, QQueryOperations> isLikedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLiked');
    });
  }

  QueryBuilder<BlFlowerDbEntity, String?, QQueryOperations> myIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myId');
    });
  }

  QueryBuilder<BlFlowerDbEntity, List<String>?, QQueryOperations>
      picListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'picList');
    });
  }

  QueryBuilder<BlFlowerDbEntity, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BlFlowerDbEntity, int?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
