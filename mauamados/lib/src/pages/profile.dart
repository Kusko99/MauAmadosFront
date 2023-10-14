import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';

class ProfilePage extends StatefulWidget {
  final double fontSize1;
  final double fontSize2;
  const ProfilePage({required this.fontSize1, required this.fontSize2, super.key});

  @override
  State<ProfilePage> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {  

  @override
  Widget build(BuildContext context) {
    User user = User.users[0];
    double deviceHeight = MediaQuery.of(context).size.height;
    double fontSize1 = widget.fontSize1;
    double fontSize2 = widget.fontSize2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: ProfileMainPage(user: user, fontSize1: fontSize1, fontSize2: fontSize2,),
        body: ProfileEdit(fontSize1: fontSize1,fontSize2: fontSize2, user: user,),
      ),
    );
  }
}