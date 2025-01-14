import 'package:drift/drift.dart';

part 'prescription_database.g.dart';

class QuestionItem extends Table {
  @override
  String get tableName => 'question';

  TextColumn get id => text().named('id')();
  TextColumn get question => text().named('question')();
}

class SymptomItem extends Table {
  @override
  String get tableName => 'symptom';

  TextColumn get id => text().named('id')();
  TextColumn get questionId => text().named('question_id')();
  TextColumn get symptom => text().named('title')();
  TextColumn get nextQuestionId =>
      text().nullable().named('next_question_id')();
}

class PrescriptionItem extends Table {
  @override
  String get tableName => 'prescription';

  TextColumn get id => text().named('selected_option_id')();
  TextColumn get prescription => text().named('prescription')();
}

@DriftDatabase(
  tables: [
    QuestionItem,
    SymptomItem,
    PrescriptionItem,
  ],
)
class PrescriptionDatabase extends _$PrescriptionDatabase {
  PrescriptionDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
