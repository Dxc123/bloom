// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bl_message_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBlMessageDBCollection on Isar {
  IsarCollection<BlMessageDB> get blMessageDBs => this.collection();
}

const BlMessageDBSchema = CollectionSchema(
  name: r'BlMessageDB',
  id: 8907690326084272246,
  properties: {
    r'conversationId': PropertySchema(
      id: 0,
      name: r'conversationId',
      type: IsarType.long,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'hasRead': PropertySchema(
      id: 2,
      name: r'hasRead',
      type: IsarType.long,
    ),
    r'msgContent': PropertySchema(
      id: 3,
      name: r'msgContent',
      type: IsarType.string,
    ),
    r'msgType': PropertySchema(
      id: 4,
      name: r'msgType',
      type: IsarType.string,
      enumMap: _BlMessageDBmsgTypeEnumValueMap,
    ),
    r'myId': PropertySchema(
      id: 5,
      name: r'myId',
      type: IsarType.string,
    ),
    r'receivedUserId': PropertySchema(
      id: 6,
      name: r'receivedUserId',
      type: IsarType.string,
    ),
    r'sendUserId': PropertySchema(
      id: 7,
      name: r'sendUserId',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 8,
      name: r'text',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.long,
    )
  },
  estimateSize: _blMessageDBEstimateSize,
  serialize: _blMessageDBSerialize,
  deserialize: _blMessageDBDeserialize,
  deserializeProp: _blMessageDBDeserializeProp,
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
    r'conversationId': IndexSchema(
      id: 2945908346256754300,
      name: r'conversationId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'conversationId',
          type: IndexType.value,
          caseSensitive: false,
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
    ),
    r'hasRead': IndexSchema(
      id: -8019166651213809249,
      name: r'hasRead',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hasRead',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _blMessageDBGetId,
  getLinks: _blMessageDBGetLinks,
  attach: _blMessageDBAttach,
  version: '3.1.0+1',
);

int _blMessageDBEstimateSize(
  BlMessageDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.msgContent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.msgType;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.myId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.receivedUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sendUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _blMessageDBSerialize(
  BlMessageDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.conversationId);
  writer.writeLong(offsets[1], object.createdAt);
  writer.writeLong(offsets[2], object.hasRead);
  writer.writeString(offsets[3], object.msgContent);
  writer.writeString(offsets[4], object.msgType?.name);
  writer.writeString(offsets[5], object.myId);
  writer.writeString(offsets[6], object.receivedUserId);
  writer.writeString(offsets[7], object.sendUserId);
  writer.writeString(offsets[8], object.text);
  writer.writeLong(offsets[9], object.updatedAt);
}

BlMessageDB _blMessageDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BlMessageDB();
  object.conversationId = reader.readLongOrNull(offsets[0]);
  object.createdAt = reader.readLongOrNull(offsets[1]);
  object.hasRead = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.msgContent = reader.readStringOrNull(offsets[3]);
  object.msgType =
      _BlMessageDBmsgTypeValueEnumMap[reader.readStringOrNull(offsets[4])];
  object.myId = reader.readStringOrNull(offsets[5]);
  object.receivedUserId = reader.readStringOrNull(offsets[6]);
  object.sendUserId = reader.readStringOrNull(offsets[7]);
  object.text = reader.readStringOrNull(offsets[8]);
  object.updatedAt = reader.readLongOrNull(offsets[9]);
  return object;
}

P _blMessageDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (_BlMessageDBmsgTypeValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BlMessageDBmsgTypeEnumValueMap = {
  r'text': r'text',
  r'gift': r'gift',
};
const _BlMessageDBmsgTypeValueEnumMap = {
  r'text': MsgTypeEnum.text,
  r'gift': MsgTypeEnum.gift,
};

Id _blMessageDBGetId(BlMessageDB object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _blMessageDBGetLinks(BlMessageDB object) {
  return [];
}

void _blMessageDBAttach(
    IsarCollection<dynamic> col, Id id, BlMessageDB object) {
  object.id = id;
}

extension BlMessageDBQueryWhereSort
    on QueryBuilder<BlMessageDB, BlMessageDB, QWhere> {
  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhere> anyConversationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'conversationId'),
      );
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhere> anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhere> anyHasRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'hasRead'),
      );
    });
  }
}

extension BlMessageDBQueryWhere
    on QueryBuilder<BlMessageDB, BlMessageDB, QWhereClause> {
  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> idBetween(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> myIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'myId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> myIdEqualTo(
      String? myId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'myId',
        value: [myId],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> myIdNotEqualTo(
      String? myId) {
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
      conversationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'conversationId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
      conversationIdEqualTo(int? conversationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'conversationId',
        value: [conversationId],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
      conversationIdNotEqualTo(int? conversationId) {
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
      conversationIdGreaterThan(
    int? conversationId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'conversationId',
        lower: [conversationId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
      conversationIdLessThan(
    int? conversationId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'conversationId',
        lower: [],
        upper: [conversationId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
      conversationIdBetween(
    int? lowerConversationId,
    int? upperConversationId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'conversationId',
        lower: [lowerConversationId],
        includeLower: includeLower,
        upper: [upperConversationId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> createdAtEqualTo(
      int? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> createdAtNotEqualTo(
      int? createdAt) {
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> createdAtLessThan(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> createdAtBetween(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> updatedAtEqualTo(
      int? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> updatedAtNotEqualTo(
      int? updatedAt) {
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> updatedAtLessThan(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> updatedAtBetween(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> hasReadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hasRead',
        value: [null],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> hasReadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hasRead',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> hasReadEqualTo(
      int? hasRead) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hasRead',
        value: [hasRead],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> hasReadNotEqualTo(
      int? hasRead) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hasRead',
              lower: [],
              upper: [hasRead],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hasRead',
              lower: [hasRead],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hasRead',
              lower: [hasRead],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hasRead',
              lower: [],
              upper: [hasRead],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> hasReadGreaterThan(
    int? hasRead, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hasRead',
        lower: [hasRead],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> hasReadLessThan(
    int? hasRead, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hasRead',
        lower: [],
        upper: [hasRead],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterWhereClause> hasReadBetween(
    int? lowerHasRead,
    int? upperHasRead, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hasRead',
        lower: [lowerHasRead],
        includeLower: includeLower,
        upper: [upperHasRead],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BlMessageDBQueryFilter
    on QueryBuilder<BlMessageDB, BlMessageDB, QFilterCondition> {
  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      conversationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'conversationId',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      conversationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'conversationId',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      conversationIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'conversationId',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      conversationIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'conversationId',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      conversationIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'conversationId',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      conversationIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'conversationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      createdAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      hasReadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hasRead',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      hasReadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hasRead',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> hasReadEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasRead',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      hasReadGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hasRead',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> hasReadLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hasRead',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> hasReadBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hasRead',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'msgContent',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'msgContent',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'msgContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'msgContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'msgContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'msgContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'msgContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'msgContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'msgContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'msgContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'msgContent',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'msgContent',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'msgType',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'msgType',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> msgTypeEqualTo(
    MsgTypeEnum? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'msgType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgTypeGreaterThan(
    MsgTypeEnum? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'msgType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> msgTypeLessThan(
    MsgTypeEnum? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'msgType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> msgTypeBetween(
    MsgTypeEnum? lower,
    MsgTypeEnum? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'msgType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'msgType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> msgTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'msgType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> msgTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'msgType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> msgTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'msgType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'msgType',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      msgTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'msgType',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      myIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'myId',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdEqualTo(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdGreaterThan(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdLessThan(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdBetween(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdStartsWith(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdEndsWith(
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'myId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'myId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> myIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      myIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'myId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receivedUserId',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receivedUserId',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receivedUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receivedUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receivedUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receivedUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receivedUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receivedUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receivedUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receivedUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receivedUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      receivedUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receivedUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sendUserId',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sendUserId',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sendUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sendUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sendUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sendUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sendUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sendUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sendUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sendUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sendUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      sendUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sendUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
      updatedAtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
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

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterFilterCondition>
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

extension BlMessageDBQueryObject
    on QueryBuilder<BlMessageDB, BlMessageDB, QFilterCondition> {}

extension BlMessageDBQueryLinks
    on QueryBuilder<BlMessageDB, BlMessageDB, QFilterCondition> {}

extension BlMessageDBQuerySortBy
    on QueryBuilder<BlMessageDB, BlMessageDB, QSortBy> {
  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByConversationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationId', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy>
      sortByConversationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationId', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByHasRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRead', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByHasReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRead', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByMsgContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgContent', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByMsgContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgContent', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByMsgType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgType', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByMsgTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgType', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByReceivedUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedUserId', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy>
      sortByReceivedUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedUserId', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortBySendUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendUserId', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortBySendUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendUserId', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BlMessageDBQuerySortThenBy
    on QueryBuilder<BlMessageDB, BlMessageDB, QSortThenBy> {
  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByConversationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationId', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy>
      thenByConversationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'conversationId', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByHasRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRead', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByHasReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasRead', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByMsgContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgContent', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByMsgContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgContent', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByMsgType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgType', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByMsgTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'msgType', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByMyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByMyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'myId', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByReceivedUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedUserId', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy>
      thenByReceivedUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receivedUserId', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenBySendUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendUserId', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenBySendUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sendUserId', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BlMessageDBQueryWhereDistinct
    on QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> {
  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByConversationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'conversationId');
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByHasRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasRead');
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByMsgContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'msgContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByMsgType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'msgType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByMyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'myId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByReceivedUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receivedUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctBySendUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sendUserId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BlMessageDB, BlMessageDB, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BlMessageDBQueryProperty
    on QueryBuilder<BlMessageDB, BlMessageDB, QQueryProperty> {
  QueryBuilder<BlMessageDB, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BlMessageDB, int?, QQueryOperations> conversationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'conversationId');
    });
  }

  QueryBuilder<BlMessageDB, int?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BlMessageDB, int?, QQueryOperations> hasReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasRead');
    });
  }

  QueryBuilder<BlMessageDB, String?, QQueryOperations> msgContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'msgContent');
    });
  }

  QueryBuilder<BlMessageDB, MsgTypeEnum?, QQueryOperations> msgTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'msgType');
    });
  }

  QueryBuilder<BlMessageDB, String?, QQueryOperations> myIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'myId');
    });
  }

  QueryBuilder<BlMessageDB, String?, QQueryOperations>
      receivedUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receivedUserId');
    });
  }

  QueryBuilder<BlMessageDB, String?, QQueryOperations> sendUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sendUserId');
    });
  }

  QueryBuilder<BlMessageDB, String?, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<BlMessageDB, int?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
