import 'package:dr_zyggy/domain/model/option.dart';
import 'package:dr_zyggy/domain/model/prescription.dart';
import 'package:dr_zyggy/domain/model/question.dart';

abstract class ChatRepository {
  Future<Question?> getQuestion(
    Question? previousQuestion,
    Option? selectedOption,
  );

  Future<Prescription?> getPrescription(String id);
}
