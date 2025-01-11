import 'package:dr_zyggy/domain/model/option.dart';

class Symptom {
  final String questionId;
  final String questionTitle;
  final Option selectedOption;

  Symptom({
    required this.questionId,
    required this.questionTitle,
    required this.selectedOption,
  });
}
