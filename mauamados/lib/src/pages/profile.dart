import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Perfil', style: TextStyle(fontSize: 40)))
      ),
    );
  }
}