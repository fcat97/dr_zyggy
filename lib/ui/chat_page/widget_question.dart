import 'package:dr_zyggy/domain/model/option.dart';
import 'package:dr_zyggy/domain/model/question.dart';
import 'package:flutter/material.dart';

class WidgetQuestion extends StatefulWidget {
  final Question question;
  final Function(Question q, Option o) onSelect;

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
          children: widget.question.options.map((option) {
            return GestureDetector(
              onTap: () {
                widget.onSelect(widget.question, option);
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 4.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    option.title,
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
