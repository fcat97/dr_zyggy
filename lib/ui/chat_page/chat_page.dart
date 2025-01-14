import 'package:dr_zyggy/data/repository/chat_repository.dart';
import 'package:dr_zyggy/domain/model/answer.dart';
import 'package:dr_zyggy/domain/model/symptom.dart';
import 'package:dr_zyggy/domain/model/question.dart';
import 'package:dr_zyggy/domain/repository/chat_repository.dart';
import 'package:dr_zyggy/main.dart';
import 'package:dr_zyggy/ui/chat_page/_model.dart';
import 'package:dr_zyggy/ui/chat_page/widget_answer.dart';
import 'package:dr_zyggy/ui/chat_page/widget_prescription.dart';
import 'package:dr_zyggy/ui/chat_page/widget_question.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Question? _question;
  final List<ChatUiModel> _answerOrPrescription = [];
  final ScrollController _controller = ScrollController();
  final ChatRepository _repository = ChatRepositoryImpl();

  Future<void> _scrollToEnd() {
    return _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  String _getPrescriptionId() {
    List<Answer> answers = [];
    for (var chat in _answerOrPrescription) {
      if (chat is AnswerUiModel) answers.add(chat.answer);
    }

    return answers.map((a) => a.symptom.id).join('-');
  }

  void _setAnswer(Answer a) async {
    setState(() {
      _answerOrPrescription.add(AnswerUiModel(answer: a));
    });

    await _scrollToEnd();

    _fetchNextQuestion(a.symptom);
  }

  void _fetchNextQuestion(Symptom? selectedSymptom) async {
    var question = await _repository.getQuestion(selectedSymptom);

    if (question != null) {
      setState(() {
        _question = question;
      });

      await _scrollToEnd();
      tts.speak(question.title);
    } else {
      var id = _getPrescriptionId();
      var prescription = await _repository.getPrescription(id);
      if (prescription != null) {
        setState(() {
          _answerOrPrescription.add(
            PrescriptionUiModel(prescription: prescription),
          );

          _question = null;
        });

        tts.speak(prescription.prescription);
      }

      await _scrollToEnd();
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchNextQuestion(null);
  }

  @override
  void dispose() {
    tts.terminate();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Chat with Dr. Zyggy"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: _answerOrPrescription.length,
              itemBuilder: (context, index) {
                ChatUiModel c = _answerOrPrescription[index];
                if (c is AnswerUiModel) {
                  return WidgetAnswer(answer: c.answer);
                } else if (c is PrescriptionUiModel) {
                  return WidgetPrescription(prescription: c.prescription);
                } else {
                  return Container();
                }
              },
            ),
          ),
          _question != null
              ? WidgetQuestion(_question!, onSelect: _setAnswer)
              : Container()
        ],
      ),
    );
  }
}
