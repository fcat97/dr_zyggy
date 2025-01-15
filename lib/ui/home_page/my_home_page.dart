import 'dart:io';

import 'package:dr_zyggy/domain/tts/flutter_tts.dart';
import 'package:dr_zyggy/domain/tts/web_tts.dart';
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

    try{
      if (!kIsWeb && Platform.isLinux) {
        tts = Gtts();
      } else if (kIsWeb) {
        tts = WebTts();
      } else {
        tts = FlutterTtsWrapper();
      }
      await tts.init();
    } catch(e) {
      debugPrint("$e");
    }
    

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
      body: _isLoading
          ? Container(
              color: Colors.amber,
              child: Center(child: CircularProgressIndicator()),
            )
          : Center(child: _body()),
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

  Widget _body() {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              card(
                Icons.face_2_outlined,
                "Chat",
                () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  )
                },
              ),
              SizedBox(width: 4.0),
              card(Icons.file_download_done_outlined, "Prescription", () => {}),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              card(Icons.settings_outlined, "Settings", () => {}),
              SizedBox(width: 4.0),
              card(Icons.help_center_outlined, "About", () => {}),
            ],
          ),
        ],
      ),
    );
  }
}

Widget card(IconData icon, String label, Function onClick) {
  return GestureDetector(
    onTap: () => {onClick()},
    child: SizedBox(
      width: 200,
      height: 200,
      child: Card(
        color: Colors.blueAccent[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}
