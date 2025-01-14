import 'dart:io';
import 'package:dr_zyggy/data/data_source/prescription_database.dart';
import 'package:dr_zyggy/domain/util/copy.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

// https://drift.simonbinder.eu/examples/existing_databases/#extracting-the-database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final documentDir = await getApplicationDocumentsDirectory();
    final appDir = File(p.join(documentDir.path, 'dr_zyggy'));
    final dbFolder = File(p.join(appDir.path, 'db'));
    final file = File(p.join(dbFolder.path, 'prescriptoin.db'));
    //await file.parent.create(recursive: true);

    await copyAssetsToDocument(
      'assets/db/prescription.db',
      'dr_zyggy/db/prescriptoin.db',
    );

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

PrescriptionDatabase constructDb() {
  return PrescriptionDatabase(_openConnection());
}
