import 'package:dr_zyggy/domain/model/prescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class WidgetPrescription extends StatefulWidget {
  final Prescription prescription;

  const WidgetPrescription({super.key, required this.prescription});

  @override
  State<StatefulWidget> createState() => _WidgetPrescriptionState();
}

class _WidgetPrescriptionState extends State<WidgetPrescription> {
  var _isLoading = false;

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
          child: Column(
            children: [
              Text(
                widget.prescription.prescription,
                style: TextStyle(fontSize: 16),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _isLoading
                    ? SizedBox(
                        width: 32.0,
                        height: 32.0,
                        child: CircularProgressIndicator(),
                      )
                    : IconButton.outlined(
                        onPressed: () =>
                            {_print(widget.prescription.prescription)},
                        icon: const Icon(Icons.print),
                        iconSize: 32.0,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _print(String text) async {
    setState(() {
      _isLoading = true;
    });

    final font = await _loadFont('assets/font/kalpurush.ttf');
    final pdf = pw.Document();

    // Add a page to the PDF document
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              text,
              style: pw.TextStyle(
                fontSize: 16,
                font: font,
              ),
            ),
          ); // Center text
        },
      ),
    );

    // Show the print dialog
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );

    setState(() {
      _isLoading = false;
    });
  }

  // Helper function to load font from assets
  Future<pw.Font> _loadFont(String fontPath) async {
    final fontData = await rootBundle.load(fontPath);
    return pw.Font.ttf(fontData);
  }
}
