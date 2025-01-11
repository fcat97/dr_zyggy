import 'package:dr_zyggy/domain/model/symptom.dart';
import 'package:flutter/material.dart';

class WidgetSymptom extends StatelessWidget {
  final Symptom symptom;

  const WidgetSymptom({super.key, required this.symptom});

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
                symptom.questionTitle,
                style: TextStyle(fontSize: 16),
              ),
              Text(symptom.selectedOption.title)
            ],
          ),
        ),
      ),
    );
  }
}
