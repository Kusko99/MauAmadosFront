import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mauamados/models/models.dart';

class LoginCadastro extends StatefulWidget {
  final double deviceHeight;
  final double fontSize1;
  final double fontSize2;

  const LoginCadastro({
    required this.fontSize1,
    required this.fontSize2,
    required this.deviceHeight,
    Key? key,
  }) : super(key: key);

  @override
  State<LoginCadastro> createState() => _LoginCadastroState();
}

class _LoginCadastroState extends State<LoginCadastro> {

  List pretendentes = [];
  List likes = [];
  dynamic conversasAPI;

  Future<void> getLikes(int id) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/user/likes/$id'));
    final likeds = json.decode(response.body);
    for (String liker in likeds) {
      setState(() {
        likes.add(int.parse(liker));
      });
    }
  }

  Future<void> getPretendentes(int id) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/user/get_possible_matches/$id'));
    await getLikes(id);
    setState(() {
      pretendentes = json.decode(response.body);
      pretendentes.removeWhere((pretendente) => likes.contains(pretendente['ma_id']));
      pretendentes.shuffle();
    });
  }

  Future<void> getConversas(int id) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/get_todas_conversas/$id'));
    setState(() {
      conversasAPI = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    double altura = widget.deviceHeight;
    double deviceWidth = MediaQuery.of(context).size.width;

    if (widget.deviceHeight * 0.8 < deviceWidth) {
      altura = widget.deviceHeight * 0.5;
    }

    double fontSize = MediaQuery.of(context).size.shortestSide * 0.04;
    double imageSize = (fontSize * 12);
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.imgur.com/9YiQLOt.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.9), Colors.black.withOpacity(0.3)],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: altura * 0.06),
                    width: imageSize,
                    height: imageSize,
                    child: const Image(
                      image: NetworkImage(
                        'https://i.imgur.com/mgKFZtj.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: altura * 0.02),
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(
                              width: fontSize,
                              color: const Color.fromARGB(255, 1, 75, 173),
                            ),
                          ),
                        ),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: const Color.fromARGB(255, 1, 75, 173),
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize * 2,
                          ),
                          child: const Text('MAUÁ'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: fontSize),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: const Color.fromARGB(255, 1, 75, 173),
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize * 2,
                          ),
                          child: const Text('mados'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: widget.deviceHeight * 0.1,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: widget.deviceHeight*0.1
                    ),
                    child: Column(
                      children: [
                        LoginButton(
                          corFundo: const Color.fromARGB(255, 1, 75, 173),
                          corBorda: const Color.fromARGB(255, 1, 75, 173),
                          corFonte: Colors.white,
                          deviceHeight: widget.deviceHeight,
                          fontSize: fontSize,
                          texto: 'Entrar',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                
                                TextEditingController usernameController = TextEditingController();
                                TextEditingController passwordController = TextEditingController();

                                Future<void> login() async {
                                  final username = usernameController.text;
                                  final password = passwordController.text;

                                  final response = await http.get(
                                    Uri.parse('http://10.0.2.2:8000/login/?username=$username&password=$password'),
                                  );
                                  
                                  if (response.statusCode == 200) {

                                    final data = json.decode(response.body);
                                    final userId = int.parse(data['ID']);

                                    final userResponse = await http.get(
                                      Uri.parse('http://10.0.2.2:8000/user/$userId'),
                                      headers: {
                                        'Accept-Charset': 'utf-8',
                                      },
                                    );

                                    if (userResponse.statusCode == 200) {
                                      final userData = json.decode(utf8.decode(userResponse.bodyBytes));
                                      final user = User.fromJson(userData[0]);
                                      await getPretendentes(userId);
                                      await getConversas(userId);

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => MainScreen(
                                            pretendentes: pretendentes,
                                            usuarioAtual: user,
                                            fontSize1: widget.fontSize1,
                                            fontSize2: widget.fontSize2,
                                            idUsuarioAtual: user.id,
                                          ),
                                        ),
                                      );
                                    } else {
                                      final userMessage = json.decode(userResponse.body)['message'];
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(userMessage),
                                        ),
                                      );
                                    }
                                  } else {
                                    final message = json.decode(response.body)['message'];
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(message),
                                      ),
                                    );
                                  }
                                }
                                return Center(
                                  child: SingleChildScrollView(
                                    child: AlertDialog(
                                      contentPadding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        bottom: 16
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      content: Container(
                                        height: widget.deviceHeight * 0.38,
                                        width: deviceWidth * 0.75,
                                        constraints: const BoxConstraints(
                                          minHeight: 206,
                                          minWidth: 300
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              iconSize: widget.fontSize2,
                                              icon: const Icon(Icons.close_rounded),
                                              onPressed: Navigator.of(context).pop,
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                            ),
                                            TextField(
                                              controller: usernameController,
                                              style: TextStyle(
                                                fontSize: fontSize
                                              ),
                                              decoration: InputDecoration(
                                                labelText: "Login",
                                                hintText: 'seuRA@maua.br',
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide:
                                                      const BorderSide(color: Color.fromARGB(255, 0, 71, 133)),
                                                ),
                                              ),
                                            ),
                                            TextField(
                                              style: TextStyle(
                                                fontSize: fontSize
                                              ),
                                              obscureText: true,
                                              controller: passwordController,
                                              decoration: InputDecoration(
                                                labelText: "Senha",
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(12),
                                                  borderSide:
                                                      const BorderSide(color: Color.fromARGB(255, 0, 71, 133)),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color.fromARGB(255, 0, 71, 133),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                  )
                                                ),
                                                onPressed: login,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: widget.deviceHeight * 0.01
                                                  ),
                                                  child: Text(
                                                    "Entrar",
                                                    style: TextStyle(
                                                      fontSize: fontSize
                                                    ),
                                                  ),
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ),
                                  )
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: altura * 0.02,
                        ),
                        LoginButton(
                          corBorda: Colors.white,
                          corFundo: Colors.transparent,
                          corFonte: Colors.white,
                          deviceHeight: widget.deviceHeight,
                          fontSize: fontSize,
                          texto: 'Novo Usuário',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: SingleChildScrollView(
                                    child: AlertDialog(
                                      contentPadding: const EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        bottom: 16
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      content: Container(
                                        height: widget.deviceHeight * 0.65,
                                        width: deviceWidth * 0.75,
                                        constraints: const BoxConstraints(
                                          minHeight: 206,
                                          minWidth: 300
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              iconSize: widget.fontSize2,
                                              icon: const Icon(Icons.close_rounded),
                                              onPressed: Navigator.of(context).pop,
                                              splashColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey
                                                ),
                                                borderRadius: BorderRadius.circular(5)
                                              ),
                                              height: widget.deviceHeight*0.4,
                                              child: Scrollbar(
                                                controller: _scrollController,
                                                thumbVisibility: true,
                                                child: SingleChildScrollView(
                                                  controller: _scrollController,
                                                  child: Wrap(
                                                    children: [
                                                      Text(
                                                        termosDeUso
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ),
                                            ),
                                            Center(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color.fromARGB(255, 0, 71, 133),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)
                                                  )
                                                ),
                                                onPressed:() { 
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) => 
                                                      Registros(
                                                        fontSize1: widget.fontSize1,
                                                        fontSize2: widget.fontSize2,
                                                        fontSize: fontSize,
                                                      )
                                                    )
                                                  );
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: widget.deviceHeight * 0.01
                                                  ),
                                                  child: Text(
                                                    "Aceito os termos de uso e política de privacidade",
                                                    style: TextStyle(
                                                      fontSize: fontSize
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ),
                                  )
                                );
                              }
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'O MAUÁplicativo para MAUÁlunos MAUÁcharem seus MAUÁmores',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: fontSize * 0.8 > 14 ? 14 : fontSize * 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
