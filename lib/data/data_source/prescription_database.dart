import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

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
  TextColumn get nextQuestionId => text().named('next_question_id')();
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
  PrescriptionDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // https://drift.simonbinder.eu/examples/existing_databases/#extracting-the-database
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'prescriptoin.db'));

      if (!await file.exists()) {
        final blob = await rootBundle.load('assets/db/prescription.db');
        final buffer = blob.buffer;
        await file.writeAsBytes(
          buffer.asUint8List(
            blob.offsetInBytes,
            blob.lengthInBytes,
          ),
        );
      }

      // Also work around limitations on old Android versions
      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      final cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;

      return NativeDatabase.createInBackground(file);
    });
  }
}
