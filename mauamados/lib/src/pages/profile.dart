import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override 
  State<ProfilePage> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  User currentUser = User.users[0];
  List<User> users = User.users;

  @override 
  Widget build(BuildContext context) {
    List<Widget> lista = ProfileImagesBuilder(images: User.users[0].urlFotos).imagesBuilder();
    double deviceHeigh = MediaQuery.of(context).size.height;
    
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                AppBar(
                  backgroundColor: Colors.transparent, 
                  elevation: 0, 
                  toolbarHeight: deviceHeigh * 0.08, 
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    lista[0],
                    lista[1],
                    lista[2],
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    lista[3],
                    lista[4],
                    lista[5],
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    lista[6],
                    lista[7],
                    lista[8],
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}