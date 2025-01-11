import 'package:dr_zyggy/domain/model/answer.dart';
import 'package:flutter/material.dart';

class WidgetAnswer extends StatelessWidget {
  final Answer answer;

  const WidgetAnswer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                answer.question.title,
                style: TextStyle(fontSize: 16),
              ),
              Text(answer.symptom.symptom)
            ],
          ),
        ),
      ),
    );
  }
}
