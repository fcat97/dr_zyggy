import 'package:dr_zyggy/domain/tts/tts.dart';
import 'package:dr_zyggy/ui/home_page/my_home_page.dart';
import 'package:flutter/material.dart';

late Tts tts;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dr. Zyggy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}
