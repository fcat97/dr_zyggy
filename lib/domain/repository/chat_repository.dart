import 'package:dr_zyggy/domain/model/prescription.dart';
import 'package:dr_zyggy/domain/model/question.dart';
import 'package:dr_zyggy/domain/model/symptom.dart';

abstract class ChatRepository {
  Future<Question?> getQuestion(Symptom? symptom);

  Future<Prescription?> getPrescription(String id);
}
