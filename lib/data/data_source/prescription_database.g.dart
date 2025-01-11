// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_database.dart';

// ignore_for_file: type=lint
class $QuestionItemTable extends QuestionItem
    with TableInfo<$QuestionItemTable, QuestionItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionItemTable(this.attachedDatabase, [this._alias]);
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
  static const String $name = 'question';
  @override
  VerificationContext validateIntegrity(Insertable<QuestionItemData> instance,
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
  QuestionItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
    );
  }

  @override
  $QuestionItemTable createAlias(String alias) {
    return $QuestionItemTable(attachedDatabase, alias);
  }
}

class QuestionItemData extends DataClass
    implements Insertable<QuestionItemData> {
  final String id;
  final String question;
  const QuestionItemData({required this.id, required this.question});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['question'] = Variable<String>(question);
    return map;
  }

  QuestionItemCompanion toCompanion(bool nullToAbsent) {
    return QuestionItemCompanion(
      id: Value(id),
      question: Value(question),
    );
  }

  factory QuestionItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionItemData(
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

  QuestionItemData copyWith({String? id, String? question}) => QuestionItemData(
        id: id ?? this.id,
        question: question ?? this.question,
      );
  QuestionItemData copyWithCompanion(QuestionItemCompanion data) {
    return QuestionItemData(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionItemData(')
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
      (other is QuestionItemData &&
          other.id == this.id &&
          other.question == this.question);
}

class QuestionItemCompanion extends UpdateCompanion<QuestionItemData> {
  final Value<String> id;
  final Value<String> question;
  final Value<int> rowid;
  const QuestionItemCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionItemCompanion.insert({
    required String id,
    required String question,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        question = Value(question);
  static Insertable<QuestionItemData> custom({
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

  QuestionItemCompanion copyWith(
      {Value<String>? id, Value<String>? question, Value<int>? rowid}) {
    return QuestionItemCompanion(
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
    return (StringBuffer('QuestionItemCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SymptomItemTable extends SymptomItem
    with TableInfo<$SymptomItemTable, SymptomItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SymptomItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionIdMeta =
      const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
      'question_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _symptomMeta =
      const VerificationMeta('symptom');
  @override
  late final GeneratedColumn<String> symptom = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nextQuestionIdMeta =
      const VerificationMeta('nextQuestionId');
  @override
  late final GeneratedColumn<String> nextQuestionId = GeneratedColumn<String>(
      'next_question_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, questionId, symptom, nextQuestionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'symptom';
  @override
  VerificationContext validateIntegrity(Insertable<SymptomItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(_symptomMeta,
          symptom.isAcceptableOrUnknown(data['title']!, _symptomMeta));
    } else if (isInserting) {
      context.missing(_symptomMeta);
    }
    if (data.containsKey('next_question_id')) {
      context.handle(
          _nextQuestionIdMeta,
          nextQuestionId.isAcceptableOrUnknown(
              data['next_question_id']!, _nextQuestionIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SymptomItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SymptomItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      questionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question_id'])!,
      symptom: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      nextQuestionId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}next_question_id']),
    );
  }

  @override
  $SymptomItemTable createAlias(String alias) {
    return $SymptomItemTable(attachedDatabase, alias);
  }
}

class SymptomItemData extends DataClass implements Insertable<SymptomItemData> {
  final String id;
  final String questionId;
  final String symptom;
  final String? nextQuestionId;
  const SymptomItemData(
      {required this.id,
      required this.questionId,
      required this.symptom,
      this.nextQuestionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['question_id'] = Variable<String>(questionId);
    map['title'] = Variable<String>(symptom);
    if (!nullToAbsent || nextQuestionId != null) {
      map['next_question_id'] = Variable<String>(nextQuestionId);
    }
    return map;
  }

  SymptomItemCompanion toCompanion(bool nullToAbsent) {
    return SymptomItemCompanion(
      id: Value(id),
      questionId: Value(questionId),
      symptom: Value(symptom),
      nextQuestionId: nextQuestionId == null && nullToAbsent
          ? const Value.absent()
          : Value(nextQuestionId),
    );
  }

  factory SymptomItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SymptomItemData(
      id: serializer.fromJson<String>(json['id']),
      questionId: serializer.fromJson<String>(json['questionId']),
      symptom: serializer.fromJson<String>(json['symptom']),
      nextQuestionId: serializer.fromJson<String?>(json['nextQuestionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'questionId': serializer.toJson<String>(questionId),
      'symptom': serializer.toJson<String>(symptom),
      'nextQuestionId': serializer.toJson<String?>(nextQuestionId),
    };
  }

  SymptomItemData copyWith(
          {String? id,
          String? questionId,
          String? symptom,
          Value<String?> nextQuestionId = const Value.absent()}) =>
      SymptomItemData(
        id: id ?? this.id,
        questionId: questionId ?? this.questionId,
        symptom: symptom ?? this.symptom,
        nextQuestionId:
            nextQuestionId.present ? nextQuestionId.value : this.nextQuestionId,
      );
  SymptomItemData copyWithCompanion(SymptomItemCompanion data) {
    return SymptomItemData(
      id: data.id.present ? data.id.value : this.id,
      questionId:
          data.questionId.present ? data.questionId.value : this.questionId,
      symptom: data.symptom.present ? data.symptom.value : this.symptom,
      nextQuestionId: data.nextQuestionId.present
          ? data.nextQuestionId.value
          : this.nextQuestionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SymptomItemData(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('symptom: $symptom, ')
          ..write('nextQuestionId: $nextQuestionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, questionId, symptom, nextQuestionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SymptomItemData &&
          other.id == this.id &&
          other.questionId == this.questionId &&
          other.symptom == this.symptom &&
          other.nextQuestionId == this.nextQuestionId);
}

class SymptomItemCompanion extends UpdateCompanion<SymptomItemData> {
  final Value<String> id;
  final Value<String> questionId;
  final Value<String> symptom;
  final Value<String?> nextQuestionId;
  final Value<int> rowid;
  const SymptomItemCompanion({
    this.id = const Value.absent(),
    this.questionId = const Value.absent(),
    this.symptom = const Value.absent(),
    this.nextQuestionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SymptomItemCompanion.insert({
    required String id,
    required String questionId,
    required String symptom,
    this.nextQuestionId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        questionId = Value(questionId),
        symptom = Value(symptom);
  static Insertable<SymptomItemData> custom({
    Expression<String>? id,
    Expression<String>? questionId,
    Expression<String>? symptom,
    Expression<String>? nextQuestionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionId != null) 'question_id': questionId,
      if (symptom != null) 'title': symptom,
      if (nextQuestionId != null) 'next_question_id': nextQuestionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SymptomItemCompanion copyWith(
      {Value<String>? id,
      Value<String>? questionId,
      Value<String>? symptom,
      Value<String?>? nextQuestionId,
      Value<int>? rowid}) {
    return SymptomItemCompanion(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      symptom: symptom ?? this.symptom,
      nextQuestionId: nextQuestionId ?? this.nextQuestionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (symptom.present) {
      map['title'] = Variable<String>(symptom.value);
    }
    if (nextQuestionId.present) {
      map['next_question_id'] = Variable<String>(nextQuestionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SymptomItemCompanion(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('symptom: $symptom, ')
          ..write('nextQuestionId: $nextQuestionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PrescriptionItemTable extends PrescriptionItem
    with TableInfo<$PrescriptionItemTable, PrescriptionItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrescriptionItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'selected_option_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _prescriptionMeta =
      const VerificationMeta('prescription');
  @override
  late final GeneratedColumn<String> prescription = GeneratedColumn<String>(
      'prescription', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, prescription];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prescription';
  @override
  VerificationContext validateIntegrity(
      Insertable<PrescriptionItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('selected_option_id')) {
      context.handle(_idMeta,
          id.isAcceptableOrUnknown(data['selected_option_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('prescription')) {
      context.handle(
          _prescriptionMeta,
          prescription.isAcceptableOrUnknown(
              data['prescription']!, _prescriptionMeta));
    } else if (isInserting) {
      context.missing(_prescriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PrescriptionItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrescriptionItemData(
      id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}selected_option_id'])!,
      prescription: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}prescription'])!,
    );
  }

  @override
  $PrescriptionItemTable createAlias(String alias) {
    return $PrescriptionItemTable(attachedDatabase, alias);
  }
}

class PrescriptionItemData extends DataClass
    implements Insertable<PrescriptionItemData> {
  final String id;
  final String prescription;
  const PrescriptionItemData({required this.id, required this.prescription});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['selected_option_id'] = Variable<String>(id);
    map['prescription'] = Variable<String>(prescription);
    return map;
  }

  PrescriptionItemCompanion toCompanion(bool nullToAbsent) {
    return PrescriptionItemCompanion(
      id: Value(id),
      prescription: Value(prescription),
    );
  }

  factory PrescriptionItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrescriptionItemData(
      id: serializer.fromJson<String>(json['id']),
      prescription: serializer.fromJson<String>(json['prescription']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'prescription': serializer.toJson<String>(prescription),
    };
  }

  PrescriptionItemData copyWith({String? id, String? prescription}) =>
      PrescriptionItemData(
        id: id ?? this.id,
        prescription: prescription ?? this.prescription,
      );
  PrescriptionItemData copyWithCompanion(PrescriptionItemCompanion data) {
    return PrescriptionItemData(
      id: data.id.present ? data.id.value : this.id,
      prescription: data.prescription.present
          ? data.prescription.value
          : this.prescription,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PrescriptionItemData(')
          ..write('id: $id, ')
          ..write('prescription: $prescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, prescription);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrescriptionItemData &&
          other.id == this.id &&
          other.prescription == this.prescription);
}

class PrescriptionItemCompanion extends UpdateCompanion<PrescriptionItemData> {
  final Value<String> id;
  final Value<String> prescription;
  final Value<int> rowid;
  const PrescriptionItemCompanion({
    this.id = const Value.absent(),
    this.prescription = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PrescriptionItemCompanion.insert({
    required String id,
    required String prescription,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        prescription = Value(prescription);
  static Insertable<PrescriptionItemData> custom({
    Expression<String>? id,
    Expression<String>? prescription,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'selected_option_id': id,
      if (prescription != null) 'prescription': prescription,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PrescriptionItemCompanion copyWith(
      {Value<String>? id, Value<String>? prescription, Value<int>? rowid}) {
    return PrescriptionItemCompanion(
      id: id ?? this.id,
      prescription: prescription ?? this.prescription,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['selected_option_id'] = Variable<String>(id.value);
    }
    if (prescription.present) {
      map['prescription'] = Variable<String>(prescription.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrescriptionItemCompanion(')
          ..write('id: $id, ')
          ..write('prescription: $prescription, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$PrescriptionDatabase extends GeneratedDatabase {
  _$PrescriptionDatabase(QueryExecutor e) : super(e);
  $PrescriptionDatabaseManager get managers =>
      $PrescriptionDatabaseManager(this);
  late final $QuestionItemTable questionItem = $QuestionItemTable(this);
  late final $SymptomItemTable symptomItem = $SymptomItemTable(this);
  late final $PrescriptionItemTable prescriptionItem =
      $PrescriptionItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [questionItem, symptomItem, prescriptionItem];
}

typedef $$QuestionItemTableCreateCompanionBuilder = QuestionItemCompanion
    Function({
  required String id,
  required String question,
  Value<int> rowid,
});
typedef $$QuestionItemTableUpdateCompanionBuilder = QuestionItemCompanion
    Function({
  Value<String> id,
  Value<String> question,
  Value<int> rowid,
});

class $$QuestionItemTableFilterComposer
    extends Composer<_$PrescriptionDatabase, $QuestionItemTable> {
  $$QuestionItemTableFilterComposer({
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

class $$QuestionItemTableOrderingComposer
    extends Composer<_$PrescriptionDatabase, $QuestionItemTable> {
  $$QuestionItemTableOrderingComposer({
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

class $$QuestionItemTableAnnotationComposer
    extends Composer<_$PrescriptionDatabase, $QuestionItemTable> {
  $$QuestionItemTableAnnotationComposer({
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

class $$QuestionItemTableTableManager extends RootTableManager<
    _$PrescriptionDatabase,
    $QuestionItemTable,
    QuestionItemData,
    $$QuestionItemTableFilterComposer,
    $$QuestionItemTableOrderingComposer,
    $$QuestionItemTableAnnotationComposer,
    $$QuestionItemTableCreateCompanionBuilder,
    $$QuestionItemTableUpdateCompanionBuilder,
    (
      QuestionItemData,
      BaseReferences<_$PrescriptionDatabase, $QuestionItemTable,
          QuestionItemData>
    ),
    QuestionItemData,
    PrefetchHooks Function()> {
  $$QuestionItemTableTableManager(
      _$PrescriptionDatabase db, $QuestionItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestionItemCompanion(
            id: id,
            question: question,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String question,
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestionItemCompanion.insert(
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

typedef $$QuestionItemTableProcessedTableManager = ProcessedTableManager<
    _$PrescriptionDatabase,
    $QuestionItemTable,
    QuestionItemData,
    $$QuestionItemTableFilterComposer,
    $$QuestionItemTableOrderingComposer,
    $$QuestionItemTableAnnotationComposer,
    $$QuestionItemTableCreateCompanionBuilder,
    $$QuestionItemTableUpdateCompanionBuilder,
    (
      QuestionItemData,
      BaseReferences<_$PrescriptionDatabase, $QuestionItemTable,
          QuestionItemData>
    ),
    QuestionItemData,
    PrefetchHooks Function()>;
typedef $$SymptomItemTableCreateCompanionBuilder = SymptomItemCompanion
    Function({
  required String id,
  required String questionId,
  required String symptom,
  Value<String?> nextQuestionId,
  Value<int> rowid,
});
typedef $$SymptomItemTableUpdateCompanionBuilder = SymptomItemCompanion
    Function({
  Value<String> id,
  Value<String> questionId,
  Value<String> symptom,
  Value<String?> nextQuestionId,
  Value<int> rowid,
});

class $$SymptomItemTableFilterComposer
    extends Composer<_$PrescriptionDatabase, $SymptomItemTable> {
  $$SymptomItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get symptom => $composableBuilder(
      column: $table.symptom, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nextQuestionId => $composableBuilder(
      column: $table.nextQuestionId,
      builder: (column) => ColumnFilters(column));
}

class $$SymptomItemTableOrderingComposer
    extends Composer<_$PrescriptionDatabase, $SymptomItemTable> {
  $$SymptomItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get symptom => $composableBuilder(
      column: $table.symptom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nextQuestionId => $composableBuilder(
      column: $table.nextQuestionId,
      builder: (column) => ColumnOrderings(column));
}

class $$SymptomItemTableAnnotationComposer
    extends Composer<_$PrescriptionDatabase, $SymptomItemTable> {
  $$SymptomItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => column);

  GeneratedColumn<String> get symptom =>
      $composableBuilder(column: $table.symptom, builder: (column) => column);

  GeneratedColumn<String> get nextQuestionId => $composableBuilder(
      column: $table.nextQuestionId, builder: (column) => column);
}

class $$SymptomItemTableTableManager extends RootTableManager<
    _$PrescriptionDatabase,
    $SymptomItemTable,
    SymptomItemData,
    $$SymptomItemTableFilterComposer,
    $$SymptomItemTableOrderingComposer,
    $$SymptomItemTableAnnotationComposer,
    $$SymptomItemTableCreateCompanionBuilder,
    $$SymptomItemTableUpdateCompanionBuilder,
    (
      SymptomItemData,
      BaseReferences<_$PrescriptionDatabase, $SymptomItemTable, SymptomItemData>
    ),
    SymptomItemData,
    PrefetchHooks Function()> {
  $$SymptomItemTableTableManager(
      _$PrescriptionDatabase db, $SymptomItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SymptomItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SymptomItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SymptomItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> questionId = const Value.absent(),
            Value<String> symptom = const Value.absent(),
            Value<String?> nextQuestionId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SymptomItemCompanion(
            id: id,
            questionId: questionId,
            symptom: symptom,
            nextQuestionId: nextQuestionId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String questionId,
            required String symptom,
            Value<String?> nextQuestionId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SymptomItemCompanion.insert(
            id: id,
            questionId: questionId,
            symptom: symptom,
            nextQuestionId: nextQuestionId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SymptomItemTableProcessedTableManager = ProcessedTableManager<
    _$PrescriptionDatabase,
    $SymptomItemTable,
    SymptomItemData,
    $$SymptomItemTableFilterComposer,
    $$SymptomItemTableOrderingComposer,
    $$SymptomItemTableAnnotationComposer,
    $$SymptomItemTableCreateCompanionBuilder,
    $$SymptomItemTableUpdateCompanionBuilder,
    (
      SymptomItemData,
      BaseReferences<_$PrescriptionDatabase, $SymptomItemTable, SymptomItemData>
    ),
    SymptomItemData,
    PrefetchHooks Function()>;
typedef $$PrescriptionItemTableCreateCompanionBuilder
    = PrescriptionItemCompanion Function({
  required String id,
  required String prescription,
  Value<int> rowid,
});
typedef $$PrescriptionItemTableUpdateCompanionBuilder
    = PrescriptionItemCompanion Function({
  Value<String> id,
  Value<String> prescription,
  Value<int> rowid,
});

class $$PrescriptionItemTableFilterComposer
    extends Composer<_$PrescriptionDatabase, $PrescriptionItemTable> {
  $$PrescriptionItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get prescription => $composableBuilder(
      column: $table.prescription, builder: (column) => ColumnFilters(column));
}

class $$PrescriptionItemTableOrderingComposer
    extends Composer<_$PrescriptionDatabase, $PrescriptionItemTable> {
  $$PrescriptionItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get prescription => $composableBuilder(
      column: $table.prescription,
      builder: (column) => ColumnOrderings(column));
}

class $$PrescriptionItemTableAnnotationComposer
    extends Composer<_$PrescriptionDatabase, $PrescriptionItemTable> {
  $$PrescriptionItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get prescription => $composableBuilder(
      column: $table.prescription, builder: (column) => column);
}

class $$PrescriptionItemTableTableManager extends RootTableManager<
    _$PrescriptionDatabase,
    $PrescriptionItemTable,
    PrescriptionItemData,
    $$PrescriptionItemTableFilterComposer,
    $$PrescriptionItemTableOrderingComposer,
    $$PrescriptionItemTableAnnotationComposer,
    $$PrescriptionItemTableCreateCompanionBuilder,
    $$PrescriptionItemTableUpdateCompanionBuilder,
    (
      PrescriptionItemData,
      BaseReferences<_$PrescriptionDatabase, $PrescriptionItemTable,
          PrescriptionItemData>
    ),
    PrescriptionItemData,
    PrefetchHooks Function()> {
  $$PrescriptionItemTableTableManager(
      _$PrescriptionDatabase db, $PrescriptionItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrescriptionItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrescriptionItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrescriptionItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> prescription = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PrescriptionItemCompanion(
            id: id,
            prescription: prescription,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String prescription,
            Value<int> rowid = const Value.absent(),
          }) =>
              PrescriptionItemCompanion.insert(
            id: id,
            prescription: prescription,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PrescriptionItemTableProcessedTableManager = ProcessedTableManager<
    _$PrescriptionDatabase,
    $PrescriptionItemTable,
    PrescriptionItemData,
    $$PrescriptionItemTableFilterComposer,
    $$PrescriptionItemTableOrderingComposer,
    $$PrescriptionItemTableAnnotationComposer,
    $$PrescriptionItemTableCreateCompanionBuilder,
    $$PrescriptionItemTableUpdateCompanionBuilder,
    (
      PrescriptionItemData,
      BaseReferences<_$PrescriptionDatabase, $PrescriptionItemTable,
          PrescriptionItemData>
    ),
    PrescriptionItemData,
    PrefetchHooks Function()>;

class $PrescriptionDatabaseManager {
  final _$PrescriptionDatabase _db;
  $PrescriptionDatabaseManager(this._db);
  $$QuestionItemTableTableManager get questionItem =>
      $$QuestionItemTableTableManager(_db, _db.questionItem);
  $$SymptomItemTableTableManager get symptomItem =>
      $$SymptomItemTableTableManager(_db, _db.symptomItem);
  $$PrescriptionItemTableTableManager get prescriptionItem =>
      $$PrescriptionItemTableTableManager(_db, _db.prescriptionItem);
}
