import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final int idUsuarioAtual;
  final List pretendentes;
  final double fontSize1;
  final double fontSize2;
  final User user1;

  const HomePage({
    required this.idUsuarioAtual,
    required this.pretendentes,
    required this.fontSize1, 
    required this.fontSize2, 
    required this.user1,
    super.key, 
  });

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  User? currentUser = User.getUserById(1);
  int currentIndex = 0;
  Offset startPosition = Offset.zero;
  Color like = const Color.fromARGB(255, 107, 253, 168);
  Color dislike = const Color.fromARGB(255, 255, 88, 100);
  Color superlike = const Color.fromARGB(255, 45, 185, 216);
  Color likeBack = Colors.white;
  Color disBack = Colors.white;
  Color superBack = Colors.white;
  double deltaY = 0;
  double deltaX = 0;
  int proxUserId = -1;

  @override
  void initState() {
    super.initState();
    for (Map<String, dynamic> usuario in widget.pretendentes) {
      users.add(User.fromJson(usuario));
    }
  }

  Future<void> verificaMatch(int idUsuario, int idMatch, String link) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/user/likes/$idMatch'));
    final List liked = json.decode(response.body);
    if (liked.contains(idUsuario.toString())) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TelaMatch(
            link: link,
          ),
        )
      );
    }
  }

  Future<void> executePostRequest(int idUsuarioAtual, int proxUserId) async {
    await http.post(Uri.parse('http://127.0.0.1:8000/user/post_like/$idUsuarioAtual/$proxUserId'));
  }

  void _like() {
    if (users.length == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MainScreen(
            fontSize1: widget.fontSize1, 
            fontSize2: widget.fontSize2, 
            idUsuarioAtual: widget.idUsuarioAtual, 
            usuarioAtual: widget.user1, 
            pretendentes: const []
          )
        )
      );
    }
    executePostRequest(widget.idUsuarioAtual, users[currentIndex].id);
    verificaMatch(widget.idUsuarioAtual, users[currentIndex].id, users[currentIndex].urlFotos.isEmpty ? 'https://i.imgur.com/YTkSwCJ.png' : users[currentIndex].urlFotos[0]);
    final int previousIndex = currentIndex;

    if (currentIndex < users.length - 1) {
      setState(() {
        currentIndex++;
        currentUser = users[currentIndex];
        proxUserId = currentUser!.id;
        users.remove(users[previousIndex]);
      });
    } else {
      setState(() {
        currentIndex = 0;
        currentUser = users[currentIndex];
        proxUserId = currentUser!.id;
        users.remove(users[previousIndex]);
      });
    }
  }

  void _dislike() {
    if (currentIndex < users.length - 1) {
      setState(() {
        currentIndex++;
        currentUser = users[currentIndex];
        proxUserId = currentUser!.id;
      });
    } else {
      setState(() {
        currentIndex = 0;
        currentUser = users[currentIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double size = (deviceHeight* 0.1);
    if (MediaQuery.of(context).size.width / deviceHeight <= 0.267 ) {
      size = MediaQuery.of(context).size.shortestSide * 0.375;
    }

    UserCard userCard = UserCard(
            user: users[currentIndex],
            onUserChanged: (newUser) {
              setState(() {
                currentIndex = users.indexOf(newUser);
              });
            },
          );
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              Draggable(
                feedback: userCard,
                childWhenDragging: UserCard(
                  user: currentIndex < users.length - 1 ? users[currentIndex + 1] : users[0],
                  onUserChanged: (newUser) {},
                ),
                onDragStarted: () {
                  startPosition = Offset.zero;
                  deltaY = 0;
                  deltaX = 0;
                },
                onDragUpdate: (details) {
                  final dx = details.localPosition.dx;
                  final dy = details.localPosition.dy;

                  if (startPosition == Offset.zero) {
                    startPosition = details.localPosition;
                  } else {
                    deltaX = dx - startPosition.dx;
                    deltaY = dy - startPosition.dy;

                    if ((deltaX > deviceWidth * 0.27) && (deltaY > -(deviceHeight / 3))) {
                      setState(() {
                        like = Colors.white;
                        likeBack = const Color.fromARGB(255, 107, 253, 168);
                      });
                    }
                    else {
                      setState(() {
                        like = const Color.fromARGB(255, 107, 253, 168);
                        likeBack = Colors.white;
                      });
                    }
                    if ((deltaX < - (deviceWidth * 0.29)) && (deltaY > -(deviceHeight / 3))) {
                      setState(() {
                        dislike = Colors.white;
                        disBack = const Color.fromARGB(255, 255, 88, 100);
                      });
                    }
                    else {
                      dislike = const Color.fromARGB(255, 255, 88, 100);
                      disBack = Colors.white;
                    }
                    if (deltaY < -(deviceHeight / 3)) {
                      setState(() {
                        superlike = Colors.white;
                        superBack = const Color.fromARGB(255, 45, 185, 216);
                      });
                    }
                    else {
                      superlike = const Color.fromARGB(255, 45, 185, 216);
                      superBack = Colors.white;
                    }
                  }
                },
                onDragEnd: (drag) {
                  setState(() {
                    like = const Color.fromARGB(255, 107, 253, 168);
                    dislike = const Color.fromARGB(255, 255, 88, 100);
                    superlike = const Color.fromARGB(255, 45, 185, 216);
                    likeBack = Colors.white;
                    disBack = Colors.white;
                    superBack = Colors.white;
                  });
                  if ((deltaX > deviceWidth * 0.27) || (deltaY < -(deviceHeight / 3))) {
                    _like();
                  } else if (deltaX < -(deviceWidth * 0.27)) {
                    _dislike();
                  }
                },
                child: userCard
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChoiceButton(
                    color: dislike, 
                    icon: Icons.clear_rounded,
                    size: size / 2,
                    onPressed: _dislike,
                    backgroundColor: disBack,
                  ),
                  ChoiceButton(
                    color: superlike, 
                    icon: Icons.star_rounded,
                    size: size /3,
                    onPressed: _like,
                    backgroundColor: superBack,
                  ),
                  ChoiceButton(
                    color: like, 
                    icon: Icons.favorite_rounded,
                    size: size /2,
                    onPressed: _like,
                    backgroundColor: likeBack,
                  ),
                ],
              )
            ],
          ),
        )
      )
    );
  }
}