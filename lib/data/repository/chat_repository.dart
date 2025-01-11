import 'package:dr_zyggy/data/data_source/prescription_database.dart';
import 'package:dr_zyggy/domain/model/prescription.dart';
import 'package:dr_zyggy/domain/model/question.dart';
import 'package:dr_zyggy/domain/model/symptom.dart';
import 'package:dr_zyggy/domain/repository/chat_repository.dart';
import 'package:drift/drift.dart';

class ChatRepositoryImpl extends ChatRepository {
  // singleton ----------------------------------------
  static final ChatRepositoryImpl _instance = ChatRepositoryImpl._internal();
  ChatRepositoryImpl._internal();
  factory ChatRepositoryImpl() {
    return _instance;
  }
  // << -----------------------------------------------

  final _db = PrescriptionDatabase();

  @override
  Future<Question?> getQuestion(Symptom? symptom) async {
    SimpleSelectStatement<$QuestionItemTable, QuestionItemData> query;
    if (symptom == null) {
      query = (_db.questionItem.select()..where((q) => q.id.equals('q1')));
    } else {
      if (symptom.nextQuestionId == null) {
        return null;
      } else {
        query = (_db.questionItem.select()
          ..where((q) => q.id.equals(symptom.nextQuestionId!)));
      }
    }

    final q = await query.getSingleOrNull();
    if (q != null) {
      final symptomsData = await (_db.symptomItem.select()
            ..where((s) => s.questionId.equals(q.id)))
          .get();
      final symptoms = symptomsData
          .map((s) => Symptom(
                id: s.id,
                questionId: s.questionId,
                nextQuestionId: s.nextQuestionId,
                symptom: s.symptom,
              ))
          .toList();
      return Question(id: q.id, title: q.question, symptoms: symptoms);
    } else {
      return null;
    }
  }

  @override
  Future<Prescription?> getPrescription(String id) async {
    var prescriptions = (_db.select(_db.prescriptionItem)
          ..where((p) => p.id.equals(id)))
        .getSingleOrNull()
        .then((p) {
      return p != null ? Prescription(prescription: p.prescription) : null;
    });

    return prescriptions;
  }
}
