import 'package:dr_zyggy/ui/chat_page/chat_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(),
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
