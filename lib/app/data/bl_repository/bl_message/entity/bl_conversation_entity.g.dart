// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bl_conversation_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBlConversationDBCollection on Isar {
  IsarCollection<BlConversationDB> get blConversationDBs => this.collection();
}

const BlConversationDBSchema = CollectionSchema(
  name: r'BlConversationDB',
  id: -7622902050306952270,
  properties: {
    r'anchorAvatar': PropertySchema(
      id: 0,
      name: r'anchorAvatar',
      type: IsarType.string,
    ),
    r'anchorNickname': PropertySchema(
      id: 1,
      name: r'anchorNickname',
      type: IsarType.string,
    ),
    r'anchorUserId': PropertySchema(
      id: 2,
      name: r'anchorUserId',
      type: IsarType.string,
    ),
    r'conversationId': PropertySchema(
      id: 3,
      name: r'conversationId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'myId': PropertySchema(
      id: 5,
      name: r'myId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.long,
    )
  },
  estimateSize: _blConversationDBEstimateSize,
  serialize: _blConversationDBSerialize,
  deserialize: _blConversationDBDeserialize,
  deserializeProp: _blConversationDBDeserializeProp,
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
    ),
    r'anchorUserId': IndexSchema(
      id: 5149960840037559446,
      name: r'anchorUserId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'anchorUserId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'conversationId': IndexSchema(
      id: 2945908346256754300,
      name: r'conversationId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'conversationId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'updatedAt': IndexSchema(
      id: -6238191080293565125,
      name: r'updatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _blConversationDBGetId,
  getLinks: _blConversationDBGetLinks,
  attach: _blConversationDBAttach,
  version: '3.1.0+1',
);

int _blConversationDBEstimateSize(
  BlConversationDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.anchorAvatar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.anchorNickname;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.anchorUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.conversationId;
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
  return bytesCount;
}

void _blConversationDBSerialize(
  BlConversationDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.anchorAvatar);
  writer.writeString(offsets[1], object.anchorNickname);
  writer.writeString(offsets[2], object.anchorUserId);
  writer.writeString(offsets[3], object.conversationId);
  writer.writeLong(offsets[4], object.createdAt);
  writer.writeString(offsets[5], object.myId);
  writer.writeLong(offsets[6], object.updatedAt);
}

BlConversationDB _blConversationDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlConversationDB(
    anchorAvatar: reader.readStringOrNull(offsets[0]),
    anchorNickname: reader.readStringOrNull(offsets[1]),
    anchorUserId: reader.readStringOrNull(offsets[2]),
    createdAt: reader.readLongOrNull(offsets[4]),
    myId: reader.readStringOrNull(offsets[5]),
    updatedAt: reader.readLongOrNull(offsets[6]),
  );
  object.conversationId = reader.readStringOrNull(offsets[3]);
  object.id = id;
  return object;
}

P _blConversationDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _blConversationDBGetId(BlConversationDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _blConversationDBGetLinks(BlConversationDB object) {
  return [];
}

void _blConversationDBAttach(
    IsarCollection<dynamic> col, Id id, BlConversationDB object) {
  object.id = id;
}

extension BlConversationDBQueryWhereSort
    on QueryBuilder<BlConversationDB, BlConversationDB, QWhere> {
  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhere> anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension BlConversationDBQueryWhere
    on QueryBuilder<BlConversationDB, BlConversationDB, QWhereClause> {
  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause> idBetween(
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      myIdEqualTo(String? myId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [myId],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      anchorUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'anchorUserId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      anchorUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'anchorUserId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      anchorUserIdEqualTo(String? anchorUserId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'anchorUserId',
        value: [anchorUserId],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      anchorUserIdNotEqualTo(String? anchorUserId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'anchorUserId',
              lower: [],
              upper: [anchorUserId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'anchorUserId',
              lower: [anchorUserId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'anchorUserId',
              lower: [anchorUserId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'anchorUserId',
              lower: [],
              upper: [anchorUserId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      conversationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'conversationId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      conversationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'conversationId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      conversationIdEqualTo(String? conversationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'conversationId',
        value: [conversationId],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      conversationIdNotEqualTo(String? conversationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'conversationId',
              lower: [],
              upper: [conversationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'conversationId',
              lower: [conversationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'conversationId',
              lower: [conversationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'conversationId',
              lower: [],
              upper: [conversationId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      createdAtEqualTo(int? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      createdAtNotEqualTo(int? createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      createdAtGreaterThan(
    int? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      createdAtLessThan(
    int? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      createdAtBetween(
    int? lowerCreatedAt,
    int? upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      updatedAtEqualTo(int? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      updatedAtNotEqualTo(int? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      updatedAtGreaterThan(
    int? updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [updatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      updatedAtLessThan(
    int? updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [],
        upper: [updatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterWhereClause>
      updatedAtBetween(
    int? lowerUpdatedAt,
    int? upperUpdatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [lowerUpdatedAt],
        includeLower: includeLower,
        upper: [upperUpdatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BlConversationDBQueryFilter
    on QueryBuilder<BlConversationDB, BlConversationDB, QFilterCondition> {
  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'anchorAvatar',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'anchorAvatar',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anchorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'anchorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'anchorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'anchorAvatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'anchorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'anchorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'anchorAvatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'anchorAvatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anchorAvatar',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorAvatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'anchorAvatar',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'anchorNickname',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'anchorNickname',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anchorNickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'anchorNickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'anchorNickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'anchorNickname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'anchorNickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'anchorNickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'anchorNickname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'anchorNickname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anchorNickname',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorNicknameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'anchorNickname',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'anchorUserId',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'anchorUserId',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anchorUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'anchorUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'anchorUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'anchorUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'anchorUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'anchorUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'anchorUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'anchorUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'anchorUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      anchorUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'anchorUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conversationId',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conversationId',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conversationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conversationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conversationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conversationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'conversationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'conversationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'conversationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'conversationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conversationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      conversationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'conversationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      createdAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      myIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      myIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      myIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'myId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      myIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      myIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
      updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterFilterCondition>
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

extension BlConversationDBQueryObject
    on QueryBuilder<BlConversationDB, BlConversationDB, QFilterCondition> {}

extension BlConversationDBQueryLinks
    on QueryBuilder<BlConversationDB, BlConversationDB, QFilterCondition> {}

extension BlConversationDBQuerySortBy
    on QueryBuilder<BlConversationDB, BlConversationDB, QSortBy> {
  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByAnchorAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorAvatar', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByAnchorAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorAvatar', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByAnchorNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorNickname', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByAnchorNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorNickname', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByAnchorUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorUserId', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByAnchorUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorUserId', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByConversationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationId', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByConversationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationId', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy> sortByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BlConversationDBQuerySortThenBy
    on QueryBuilder<BlConversationDB, BlConversationDB, QSortThenBy> {
  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByAnchorAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorAvatar', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByAnchorAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorAvatar', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByAnchorNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorNickname', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByAnchorNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorNickname', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByAnchorUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorUserId', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByAnchorUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'anchorUserId', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByConversationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationId', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByConversationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationId', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy> thenByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BlConversationDBQueryWhereDistinct
    on QueryBuilder<BlConversationDB, BlConversationDB, QDistinct> {
  QueryBuilder<BlConversationDB, BlConversationDB, QDistinct>
      distinctByAnchorAvatar({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anchorAvatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QDistinct>
      distinctByAnchorNickname({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anchorNickname',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QDistinct>
      distinctByAnchorUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'anchorUserId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QDistinct>
      distinctByConversationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conversationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QDistinct> distinctByMyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'myId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlConversationDB, BlConversationDB, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BlConversationDBQueryProperty
    on QueryBuilder<BlConversationDB, BlConversationDB, QQueryProperty> {
  QueryBuilder<BlConversationDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BlConversationDB, String?, QQueryOperations>
      anchorAvatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anchorAvatar');
    });
  }

  QueryBuilder<BlConversationDB, String?, QQueryOperations>
      anchorNicknameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anchorNickname');
    });
  }

  QueryBuilder<BlConversationDB, String?, QQueryOperations>
      anchorUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'anchorUserId');
    });
  }

  QueryBuilder<BlConversationDB, String?, QQueryOperations>
      conversationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conversationId');
    });
  }

  QueryBuilder<BlConversationDB, int?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BlConversationDB, String?, QQueryOperations> myIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myId');
    });
  }

  QueryBuilder<BlConversationDB, int?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
