import 'package:dr_zyggy/domain/model/symptom.dart';

class Question {
  final String id;
  final String title;
  final List<Symptom> symptoms;

  Question({
    required this.id,
    required this.title,
    required this.symptoms,
  });
}
