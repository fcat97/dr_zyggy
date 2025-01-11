import 'package:dr_zyggy/domain/model/option.dart';
import 'package:dr_zyggy/domain/model/prescription.dart';
import 'package:dr_zyggy/domain/model/question.dart';
import 'package:dr_zyggy/domain/repository/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  @override
  Future<Question?> getQuestion(
    Question? previousQuestion,
    Option? selectedOption,
  ) async {
    return Question(
      [Option(id: 'id-1', title: 'title-1')],
      id: "id-1",
      title: 'title-1',
    );
  }

  @override
  Future<Prescription?> getPrescription(String id) {
    // TODO: implement getPrescription
    throw UnimplementedError();
  }
}
