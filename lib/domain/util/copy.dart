import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<void> copyAssetsToDocument(
  String assetPath,
  String destFile, // relative to app document directory
) async {
  final documentDir = await getApplicationDocumentsDirectory();
  final file = File(p.join(documentDir.path, destFile));
  await file.parent.create(recursive: true);

  if (!await file.exists()) {
    final blob = await rootBundle.load(assetPath);
    final buffer = blob.buffer;
    await file.writeAsBytes(
      buffer.asUint8List(
        blob.offsetInBytes,
        blob.lengthInBytes,
      ),
    );
  }
}
