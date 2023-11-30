import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/app.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:http/http.dart' as http;

class ProfileMainPage extends StatelessWidget {
  final User? user;
  final double fontSize1;
  final double fontSize2;
  const ProfileMainPage({
    required this.user, 
    required this.fontSize1,
    required this.fontSize2,
    super.key});

  @override
  Widget build(BuildContext context) {

  Future<void> deleteUser(int id) async {
    await http.delete(Uri.parse('http://127.0.0.1:8000/user/$id'));
  }
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth > deviceHeight) {
      deviceWidth = deviceHeight;
    }

    return Scaffold(
      endDrawer: Drawer(
        width: deviceWidth/2,
        child: ListView(
          children: [
            SizedBox(
              height: deviceHeight*0.01,
            ),
            ListTile(
              title: const Text('Fale Conosco'),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: deviceHeight*0.01,
                horizontal: deviceWidth * 0.05
              ),
              child: Container(
                height: 1,
                color: Colors.grey.withAlpha(100),
              ),
            ),
            ListTile(
              title: const Text('Deslogar'),
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context, 
                  builder: (context) {
                    return Center(
                      child: SingleChildScrollView(
                        child: AlertDialog(
                          title: Text(
                            "Deseja mesmo sair?",
                            style: TextStyle(
                              fontSize: fontSize2,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey.withAlpha(50)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cancelar",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: fontSize2 * 0.8,
                                ),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey.withAlpha(50)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const App()
                                  )
                                );
                              },
                              child: Text(
                                "Confirmar",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 71, 133),
                                  fontSize: fontSize2 * 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: deviceHeight*0.01,
                horizontal: deviceWidth * 0.05
              ),
              child: Container(
                height: 1,
                color: Colors.grey.withAlpha(100),
              ),
            ),
            ListTile(
              title: const Text('Deletar conta'),
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context, 
                  builder: (context) {
                    return Center(
                      child: SingleChildScrollView(
                        child: AlertDialog(
                          title: Text(
                            "Deseja mesmo deletar sua conta?",
                            style: TextStyle(
                              fontSize: fontSize2,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey.withAlpha(50)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cancelar",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: fontSize2 * 0.8,
                                ),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey.withAlpha(50)),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context, 
                                  builder: (context) {
                                    return Center(
                                      child: SingleChildScrollView(
                                        child: AlertDialog(
                                          title: Text(
                                            "Essa ação não poderá ser desfeita",
                                            style: TextStyle(
                                              fontSize: fontSize2,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              style: ButtonStyle(
                                                overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey.withAlpha(50)),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "Cancelar",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: fontSize2 * 0.8,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              style: ButtonStyle(
                                                overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey.withAlpha(50)),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) => const App()
                                                  )
                                                );
                                                deleteUser(user!.id);
                                              },
                                              child: Text(
                                                "Confirmar",
                                                style: TextStyle(
                                                  color: const Color.fromARGB(255, 0, 71, 133),
                                                  fontSize: fontSize2 * 0.8,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                );
                              },
                              child: Text(
                                "Confirmar",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 71, 133),
                                  fontSize: fontSize2 * 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: deviceHeight * 0.08,
        actions: [
          Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04
              ),
              child: IconButton(
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: const Color.fromARGB(255, 0, 71, 133),
                  size: deviceHeight * 0.06,
                ),
              ),
            )
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
                    image: NetworkImage(user!.urlFotos.isEmpty ? 'https://i.imgur.com/YTkSwCJ.png' : user!.urlFotos[0]),
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
                      ('${user!.nome}, ${user!.idade}'),
                      style: TextStyle(
                        fontSize: fontSize1,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      user!.curso,
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
                          user: user!, 
                          fontSize1: fontSize1, 
                          fontSize2: fontSize2,
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
    );
  }
}
