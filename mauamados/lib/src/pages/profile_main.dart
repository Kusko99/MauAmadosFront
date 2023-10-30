import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';

class ProfileMainPage extends StatelessWidget {
  final User user;
  final double fontSize1;
  final double fontSize2;
  const ProfileMainPage({required this.user, required this.fontSize1, required this.fontSize2 ,super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > deviceHeight) {
      deviceWidth = deviceHeight;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: deviceHeight * 0.08,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: deviceWidth * 1.6 <= deviceHeight ? deviceWidth * 0.7 : deviceHeight * 0.45,
                  height: deviceWidth * 1.6 <= deviceHeight ? deviceWidth * 0.7 : deviceHeight * 0.45,
                  child: ClipOval(
                    child: Image(
                      image: NetworkImage(user.urlFotos.isEmpty ? 'https://i.imgur.com/YTkSwCJ.png' : user.urlFotos[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.1
                  ),
                  child: Column(
                    children: [
                      Text(
                        ('${user.nome}, ${user.idade}'),
                        style: TextStyle(
                          fontSize: fontSize1,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        user.curso,
                        style: TextStyle(
                          fontSize: fontSize2
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: deviceHeight * 0.03
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromARGB(255, 0, 71, 133)
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ProfileEdit(
                            user: user, 
                            fontSize1: fontSize1, 
                            fontSize2: fontSize2
                          ))
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                          deviceHeight * 0.02
                        ),
                        child: Text(
                          'Editar Perfil',
                          style: TextStyle(
                            fontSize: fontSize2
                          ),
                        ),
                      )
                    ),
                  )
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}
