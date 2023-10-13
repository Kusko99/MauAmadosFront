import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/profile_main.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> userPhotos = User.users[0].urlFotos;

  @override
  Widget build(BuildContext context) {
  double deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: deviceHeight * 0.08,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.06
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.settings,
                  color: const Color.fromARGB(255, 0, 71, 133),
                  size: deviceHeight * 0.06,
                ),
              ),
            )
          ],
        ),
        body: ProfileMainPage(),
      ),
    );
  }
}