import 'dart:io';

import 'package:dr_zyggy/domain/tts/flutter_tts.dart';
import 'package:flutter/foundation.dart';
import 'package:dr_zyggy/domain/tts/gtts.dart';
import 'package:dr_zyggy/main.dart';
import 'package:dr_zyggy/ui/chat_page/chat_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isLoading = false;

  Future<void> _getReady() async {
    setState(() {
      _isLoading = true;
    });

    if (!kIsWeb && Platform.isLinux) {
      tts = Gtts();
    } else {
      tts = FlutterTtsWrapper();
    }
    await tts.init();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getReady();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _isLoading ? CircularProgressIndicator() : Container(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ChatPage()),
          )
        },
        tooltip: 'Increment',
        label: const Text("Start Chat"),
        icon: const Icon(Icons.face),
      ),
    );
  }
}
