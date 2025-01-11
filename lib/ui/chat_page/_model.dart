import 'package:dr_zyggy/domain/model/symptom.dart';
import 'package:dr_zyggy/domain/model/prescription.dart';

abstract class ChatUiModel {}

class SymptomUiModel extends ChatUiModel {
  final Symptom symptom;

  SymptomUiModel({required this.symptom});
}

class PrescriptionUiModel extends ChatUiModel {
  final Prescription prescription;

  PrescriptionUiModel({required this.prescription});
}
