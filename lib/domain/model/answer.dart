import 'package:dr_zyggy/domain/model/question.dart';
import 'package:dr_zyggy/domain/model/symptom.dart';

class Answer {
  final Question question;
  final Symptom symptom;

  Answer({required this.question, required this.symptom});
}
