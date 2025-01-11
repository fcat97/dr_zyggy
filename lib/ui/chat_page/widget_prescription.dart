import 'package:dr_zyggy/domain/model/prescription.dart';
import 'package:flutter/material.dart';

class WidgetPrescription extends StatelessWidget {
  final Prescription prescription;

  const WidgetPrescription({super.key, required this.prescription});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            prescription.prescription,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
