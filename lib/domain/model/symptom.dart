class Symptom {
  final String id;
  final String questionId;
  final String? nextQuestionId;
  final String symptom;

  Symptom({
    required this.id,
    required this.questionId,
    required this.nextQuestionId,
    required this.symptom,
  });
}
