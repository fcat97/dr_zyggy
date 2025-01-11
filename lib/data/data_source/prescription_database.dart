import 'package:drift/drift.dart';

part 'prescription_database.g.dart';

class QuestionItems extends Table {
  TextColumn get id => text().named('id')();
  TextColumn get question => text().named('question')();
}

@DriftDatabase(tables: [QuestionItems])
class PrescriptionDatabase extends _$PrescriptionDatabase {
  PrescriptionDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
