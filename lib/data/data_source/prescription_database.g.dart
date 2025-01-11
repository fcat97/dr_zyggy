// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_database.dart';

// ignore_for_file: type=lint
class $QuestionItemsTable extends QuestionItems
    with TableInfo<$QuestionItemsTable, QuestionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, question];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'question_items';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  QuestionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
    );
  }

  @override
  $QuestionItemsTable createAlias(String alias) {
    return $QuestionItemsTable(attachedDatabase, alias);
  }
}

class QuestionItem extends DataClass implements Insertable<QuestionItem> {
  final String id;
  final String question;
  const QuestionItem({required this.id, required this.question});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['question'] = Variable<String>(question);
    return map;
  }

  QuestionItemsCompanion toCompanion(bool nullToAbsent) {
    return QuestionItemsCompanion(
      id: Value(id),
      question: Value(question),
    );
  }

  factory QuestionItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionItem(
      id: serializer.fromJson<String>(json['id']),
      question: serializer.fromJson<String>(json['question']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'question': serializer.toJson<String>(question),
    };
  }

  QuestionItem copyWith({String? id, String? question}) => QuestionItem(
        id: id ?? this.id,
        question: question ?? this.question,
      );
  QuestionItem copyWithCompanion(QuestionItemsCompanion data) {
    return QuestionItem(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionItem(')
          ..write('id: $id, ')
          ..write('question: $question')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, question);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionItem &&
          other.id == this.id &&
          other.question == this.question);
}

class QuestionItemsCompanion extends UpdateCompanion<QuestionItem> {
  final Value<String> id;
  final Value<String> question;
  final Value<int> rowid;
  const QuestionItemsCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionItemsCompanion.insert({
    required String id,
    required String question,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        question = Value(question);
  static Insertable<QuestionItem> custom({
    Expression<String>? id,
    Expression<String>? question,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionItemsCompanion copyWith(
      {Value<String>? id, Value<String>? question, Value<int>? rowid}) {
    return QuestionItemsCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionItemsCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$PrescriptionDatabase extends GeneratedDatabase {
  _$PrescriptionDatabase(QueryExecutor e) : super(e);
  $PrescriptionDatabaseManager get managers =>
      $PrescriptionDatabaseManager(this);
  late final $QuestionItemsTable questionItems = $QuestionItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [questionItems];
}

typedef $$QuestionItemsTableCreateCompanionBuilder = QuestionItemsCompanion
    Function({
  required String id,
  required String question,
  Value<int> rowid,
});
typedef $$QuestionItemsTableUpdateCompanionBuilder = QuestionItemsCompanion
    Function({
  Value<String> id,
  Value<String> question,
  Value<int> rowid,
});

class $$QuestionItemsTableFilterComposer
    extends Composer<_$PrescriptionDatabase, $QuestionItemsTable> {
  $$QuestionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));
}

class $$QuestionItemsTableOrderingComposer
    extends Composer<_$PrescriptionDatabase, $QuestionItemsTable> {
  $$QuestionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));
}

class $$QuestionItemsTableAnnotationComposer
    extends Composer<_$PrescriptionDatabase, $QuestionItemsTable> {
  $$QuestionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);
}

class $$QuestionItemsTableTableManager extends RootTableManager<
    _$PrescriptionDatabase,
    $QuestionItemsTable,
    QuestionItem,
    $$QuestionItemsTableFilterComposer,
    $$QuestionItemsTableOrderingComposer,
    $$QuestionItemsTableAnnotationComposer,
    $$QuestionItemsTableCreateCompanionBuilder,
    $$QuestionItemsTableUpdateCompanionBuilder,
    (
      QuestionItem,
      BaseReferences<_$PrescriptionDatabase, $QuestionItemsTable, QuestionItem>
    ),
    QuestionItem,
    PrefetchHooks Function()> {
  $$QuestionItemsTableTableManager(
      _$PrescriptionDatabase db, $QuestionItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestionItemsCompanion(
            id: id,
            question: question,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String question,
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestionItemsCompanion.insert(
            id: id,
            question: question,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$QuestionItemsTableProcessedTableManager = ProcessedTableManager<
    _$PrescriptionDatabase,
    $QuestionItemsTable,
    QuestionItem,
    $$QuestionItemsTableFilterComposer,
    $$QuestionItemsTableOrderingComposer,
    $$QuestionItemsTableAnnotationComposer,
    $$QuestionItemsTableCreateCompanionBuilder,
    $$QuestionItemsTableUpdateCompanionBuilder,
    (
      QuestionItem,
      BaseReferences<_$PrescriptionDatabase, $QuestionItemsTable, QuestionItem>
    ),
    QuestionItem,
    PrefetchHooks Function()>;

class $PrescriptionDatabaseManager {
  final _$PrescriptionDatabase _db;
  $PrescriptionDatabaseManager(this._db);
  $$QuestionItemsTableTableManager get questionItems =>
      $$QuestionItemsTableTableManager(_db, _db.questionItems);
}
