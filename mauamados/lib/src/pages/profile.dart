import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';

class ProfilePage extends StatelessWidget {
  final double fontSize1;
  final double fontSize2;
  const ProfilePage({required this.fontSize1, required this.fontSize2, super.key});

@override
  Widget build(BuildContext context) {
    User user = User.users[0];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProfileMainPage(user: user, fontSize1: fontSize1, fontSize2: fontSize2,),
      ),
    );
  }
}