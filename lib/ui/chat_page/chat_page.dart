import 'package:dr_zyggy/data/repository/chat_repository.dart';
import 'package:dr_zyggy/domain/model/symptom.dart';
import 'package:dr_zyggy/domain/model/option.dart';
import 'package:dr_zyggy/domain/model/question.dart';
import 'package:dr_zyggy/domain/repository/chat_repository.dart';
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
  final List<ChatUiModel> _symptopmOrPrescription = [];
  final ScrollController _controller = ScrollController();
  final ChatRepository _repository = ChatRepositoryImpl();

  void _scrollToEnd() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  String _getPrescriptionId() {
    List<Symptom> symptoms = [];
    for (var chat in _symptopmOrPrescription) {
      if (chat is SymptomUiModel) symptoms.add(chat.symptom);
    }

    return symptoms.map((s) => s.selectedOption.id).join('-');
  }

  void _setSymptom(Question q, Option o) {
    setState(() {
      Symptom s = Symptom(
        questionId: q.id,
        questionTitle: q.title,
        selectedOption: o,
      );
      _symptopmOrPrescription.add(SymptomUiModel(symptom: s));

      _scrollToEnd();
    });

    _fetchNextQuestion(q, o);
  }

  void _fetchNextQuestion(
    Question? previousQuestion,
    Option? selectedOption,
  ) async {
    var question = await _repository.getQuestion(
      previousQuestion,
      selectedOption,
    );

    if (question != null) {
      setState(() {
        _question = question;
      });
    } else {
      var id = _getPrescriptionId();
      var prescription = await _repository.getPrescription(id);
      if (prescription != null) {
        setState(() {
          _symptopmOrPrescription.add(
            PrescriptionUiModel(
              prescription: prescription,
            ),
          );

          _scrollToEnd();
        });
      } else {
        setState(() {
          _question = null;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchNextQuestion(null, null);
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
              itemCount: _symptopmOrPrescription.length,
              itemBuilder: (context, index) {
                ChatUiModel c = _symptopmOrPrescription[index];
                if (c is SymptomUiModel) {
                  return WidgetSymptom(symptom: c.symptom);
                } else if (c is PrescriptionUiModel) {
                  return WidgetPrescription(prescription: c.prescription);
                } else {
                  return Container();
                }
              },
            ),
          ),
          _question != null
              ? WidgetQuestion(_question!, onSelect: _setSymptom)
              : Container()
        ],
      ),
    );
  }
}
