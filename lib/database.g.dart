// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BulletNoteTable extends BulletNote
    with TableInfo<$BulletNoteTable, BulletNoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BulletNoteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, content];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'bullet_note';
  @override
  VerificationContext validateIntegrity(Insertable<BulletNoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BulletNoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BulletNoteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
    );
  }

  @override
  $BulletNoteTable createAlias(String alias) {
    return $BulletNoteTable(attachedDatabase, alias);
  }
}

class BulletNoteData extends DataClass implements Insertable<BulletNoteData> {
  final int id;
  final String content;
  const BulletNoteData({required this.id, required this.content});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    return map;
  }

  BulletNoteCompanion toCompanion(bool nullToAbsent) {
    return BulletNoteCompanion(
      id: Value(id),
      content: Value(content),
    );
  }

  factory BulletNoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BulletNoteData(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
    };
  }

  BulletNoteData copyWith({int? id, String? content}) => BulletNoteData(
        id: id ?? this.id,
        content: content ?? this.content,
      );
  BulletNoteData copyWithCompanion(BulletNoteCompanion data) {
    return BulletNoteData(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BulletNoteData(')
          ..write('id: $id, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BulletNoteData &&
          other.id == this.id &&
          other.content == this.content);
}

class BulletNoteCompanion extends UpdateCompanion<BulletNoteData> {
  final Value<int> id;
  final Value<String> content;
  const BulletNoteCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
  });
  BulletNoteCompanion.insert({
    this.id = const Value.absent(),
    required String content,
  }) : content = Value(content);
  static Insertable<BulletNoteData> custom({
    Expression<int>? id,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
    });
  }

  BulletNoteCompanion copyWith({Value<int>? id, Value<String>? content}) {
    return BulletNoteCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BulletNoteCompanion(')
          ..write('id: $id, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BulletNoteTable bulletNote = $BulletNoteTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bulletNote];
}

typedef $$BulletNoteTableCreateCompanionBuilder = BulletNoteCompanion Function({
  Value<int> id,
  required String content,
});
typedef $$BulletNoteTableUpdateCompanionBuilder = BulletNoteCompanion Function({
  Value<int> id,
  Value<String> content,
});

class $$BulletNoteTableFilterComposer
    extends Composer<_$AppDatabase, $BulletNoteTable> {
  $$BulletNoteTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));
}

class $$BulletNoteTableOrderingComposer
    extends Composer<_$AppDatabase, $BulletNoteTable> {
  $$BulletNoteTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));
}

class $$BulletNoteTableAnnotationComposer
    extends Composer<_$AppDatabase, $BulletNoteTable> {
  $$BulletNoteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);
}

class $$BulletNoteTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BulletNoteTable,
    BulletNoteData,
    $$BulletNoteTableFilterComposer,
    $$BulletNoteTableOrderingComposer,
    $$BulletNoteTableAnnotationComposer,
    $$BulletNoteTableCreateCompanionBuilder,
    $$BulletNoteTableUpdateCompanionBuilder,
    (
      BulletNoteData,
      BaseReferences<_$AppDatabase, $BulletNoteTable, BulletNoteData>
    ),
    BulletNoteData,
    PrefetchHooks Function()> {
  $$BulletNoteTableTableManager(_$AppDatabase db, $BulletNoteTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BulletNoteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BulletNoteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BulletNoteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> content = const Value.absent(),
          }) =>
              BulletNoteCompanion(
            id: id,
            content: content,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String content,
          }) =>
              BulletNoteCompanion.insert(
            id: id,
            content: content,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BulletNoteTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BulletNoteTable,
    BulletNoteData,
    $$BulletNoteTableFilterComposer,
    $$BulletNoteTableOrderingComposer,
    $$BulletNoteTableAnnotationComposer,
    $$BulletNoteTableCreateCompanionBuilder,
    $$BulletNoteTableUpdateCompanionBuilder,
    (
      BulletNoteData,
      BaseReferences<_$AppDatabase, $BulletNoteTable, BulletNoteData>
    ),
    BulletNoteData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BulletNoteTableTableManager get bulletNote =>
      $$BulletNoteTableTableManager(_db, _db.bulletNote);
}
