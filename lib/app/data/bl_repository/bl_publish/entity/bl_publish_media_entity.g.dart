// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bl_publish_media_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBlPublishMediaEntityCollection on Isar {
  IsarCollection<BlPublishMediaEntity> get blPublishMediaEntitys =>
      this.collection();
}

const BlPublishMediaEntitySchema = CollectionSchema(
  name: r'BlPublishMediaEntity',
  id: -2689664804450897860,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'myId': PropertySchema(
      id: 2,
      name: r'myId',
      type: IsarType.string,
    ),
    r'picList': PropertySchema(
      id: 3,
      name: r'picList',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 4,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 5,
      name: r'updatedAt',
      type: IsarType.long,
    )
  },
  estimateSize: _blPublishMediaEntityEstimateSize,
  serialize: _blPublishMediaEntitySerialize,
  deserialize: _blPublishMediaEntityDeserialize,
  deserializeProp: _blPublishMediaEntityDeserializeProp,
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
  getId: _blPublishMediaEntityGetId,
  getLinks: _blPublishMediaEntityGetLinks,
  attach: _blPublishMediaEntityAttach,
  version: '3.1.0+1',
);

int _blPublishMediaEntityEstimateSize(
  BlPublishMediaEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.content;
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

void _blPublishMediaEntitySerialize(
  BlPublishMediaEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeLong(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.myId);
  writer.writeStringList(offsets[3], object.picList);
  writer.writeString(offsets[4], object.title);
  writer.writeLong(offsets[5], object.updatedAt);
}

BlPublishMediaEntity _blPublishMediaEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlPublishMediaEntity();
  object.content = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.myId = reader.readStringOrNull(offsets[2]);
  object.picList = reader.readStringList(offsets[3]);
  object.title = reader.readStringOrNull(offsets[4]);
  object.updatedAt = reader.readLongOrNull(offsets[5]);
  return object;
}

P _blPublishMediaEntityDeserializeProp<P>(
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
      return (reader.readStringList(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _blPublishMediaEntityGetId(BlPublishMediaEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _blPublishMediaEntityGetLinks(
    BlPublishMediaEntity object) {
  return [];
}

void _blPublishMediaEntityAttach(
    IsarCollection<dynamic> col, Id id, BlPublishMediaEntity object) {
  object.id = id;
}

extension BlPublishMediaEntityQueryWhereSort
    on QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QWhere> {
  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BlPublishMediaEntityQueryWhere
    on QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QWhereClause> {
  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
      myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
      myIdEqualTo(String? myId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [myId],
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterWhereClause>
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

extension BlPublishMediaEntityQueryFilter on QueryBuilder<BlPublishMediaEntity,
    BlPublishMediaEntity, QFilterCondition> {
  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
          QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
          QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> createdAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdEqualTo(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdGreaterThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdLessThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdBetween(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdStartsWith(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdEndsWith(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
          QAfterFilterCondition>
      myIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
          QAfterFilterCondition>
      myIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'myId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> myIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'picList',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'picList',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListElementEqualTo(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListElementGreaterThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListElementLessThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListElementBetween(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListElementStartsWith(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListElementEndsWith(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
          QAfterFilterCondition>
      picListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'picList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
          QAfterFilterCondition>
      picListElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'picList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'picList',
        value: '',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'picList',
        value: '',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListLengthEqualTo(int length) {
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListIsEmpty() {
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListIsNotEmpty() {
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListLengthLessThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListLengthGreaterThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> picListLengthBetween(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleBetween(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity,
      QAfterFilterCondition> updatedAtBetween(
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

extension BlPublishMediaEntityQueryObject on QueryBuilder<BlPublishMediaEntity,
    BlPublishMediaEntity, QFilterCondition> {}

extension BlPublishMediaEntityQueryLinks on QueryBuilder<BlPublishMediaEntity,
    BlPublishMediaEntity, QFilterCondition> {}

extension BlPublishMediaEntityQuerySortBy
    on QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QSortBy> {
  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BlPublishMediaEntityQuerySortThenBy
    on QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QSortThenBy> {
  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BlPublishMediaEntityQueryWhereDistinct
    on QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QDistinct> {
  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QDistinct>
      distinctByContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QDistinct>
      distinctByMyId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'myId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QDistinct>
      distinctByPicList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'picList');
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlPublishMediaEntity, BlPublishMediaEntity, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BlPublishMediaEntityQueryProperty on QueryBuilder<
    BlPublishMediaEntity, BlPublishMediaEntity, QQueryProperty> {
  QueryBuilder<BlPublishMediaEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BlPublishMediaEntity, String?, QQueryOperations>
      contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<BlPublishMediaEntity, int?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BlPublishMediaEntity, String?, QQueryOperations> myIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myId');
    });
  }

  QueryBuilder<BlPublishMediaEntity, List<String>?, QQueryOperations>
      picListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'picList');
    });
  }

  QueryBuilder<BlPublishMediaEntity, String?, QQueryOperations>
      titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<BlPublishMediaEntity, int?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
