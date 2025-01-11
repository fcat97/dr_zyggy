import 'package:dr_zyggy/domain/model/answer.dart';
import 'package:dr_zyggy/domain/model/prescription.dart';

abstract class ChatUiModel {}

class AnswerUiModel extends ChatUiModel {
  final Answer answer;

  AnswerUiModel({required this.answer});
}

class PrescriptionUiModel extends ChatUiModel {
  final Prescription prescription;

  PrescriptionUiModel({required this.prescription});
}
