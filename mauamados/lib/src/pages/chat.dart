import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget{
  const ChatPage({super.key});

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text('Chat', style: TextStyle(fontSize: 40)))
      ),
    );
  }
}