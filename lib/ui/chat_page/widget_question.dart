import 'package:dr_zyggy/domain/model/answer.dart';
import 'package:dr_zyggy/domain/model/question.dart';
import 'package:flutter/material.dart';

class WidgetQuestion extends StatefulWidget {
  final Question question;
  final Function(Answer a) onSelect;

  const WidgetQuestion(this.question, {super.key, required this.onSelect});

  @override
  State<StatefulWidget> createState() => _WidgetQuestionState();
}

class _WidgetQuestionState extends State<WidgetQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.question.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.question.symptoms.map((symptom) {
            return GestureDetector(
              onTap: () {
                widget.onSelect(
                  Answer(
                    question: widget.question,
                    symptom: symptom,
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    symptom.symptom,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
