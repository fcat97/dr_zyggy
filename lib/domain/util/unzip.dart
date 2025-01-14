import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:archive/archive.dart';

Future<void> unzipFile(String zipFilePath, String outputDir) async {
  // Check if the zip file exists
  final zipFile = File(zipFilePath);
  if (!await zipFile.exists()) {
    debugPrint("Error: The zip file does not exist. ${zipFile.path}");
    return;
  }

  // Read the zip file as bytes
  final bytes = await zipFile.readAsBytes();

  // Decode the zip file
  final archive = ZipDecoder().decodeBytes(bytes);

  // Ensure the output directory exists
  final outputDirectory = Directory(outputDir);
  if (!await outputDirectory.exists()) {
    await outputDirectory.create(recursive: true);
  }

  // Extract the files
  for (var file in archive) {
    final filename = file.name;
    final filePath = join(outputDir, filename);

    // If it's a directory, create it
    if (!file.isFile) {
      await Directory(filePath).create(recursive: true);
    } else {
      // If it's a file, write it to the disk
      final outFile = File(filePath);
      await outFile.writeAsBytes(file.content as List<int>);
    }
  }

  debugPrint("Unzipped successfully to $outputDir");
}
