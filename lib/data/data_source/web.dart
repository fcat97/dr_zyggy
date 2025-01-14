import 'package:dr_zyggy/data/data_source/prescription_database.dart';
import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/services.dart';

DatabaseConnection connetToWeb() {
  return DatabaseConnection.delayed(
    Future(() async {
      final result = await WasmDatabase.open(
        databaseName:
            'prescription_database', // prefer to only use valid identifiers here
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.dart.js'),
        initializeDatabase: () async {
          final data = await rootBundle.load('assets/db/prescription.db');
          return data.buffer.asUint8List();
        },
      );

      return result.resolvedExecutor;
    }),
  );
}

PrescriptionDatabase constructDb() {
  return PrescriptionDatabase(connetToWeb());
}
