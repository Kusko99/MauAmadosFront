import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final int idUsuarioAtual;
  final List pretendentes;

  const HomePage({
    required this.idUsuarioAtual,
    required this.pretendentes,
    super.key
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

  void executePutRequest(int idUsuarioAtual, int proxUserId) async {
    var url = Uri.parse('http://127.0.0.1:8000/user/put_like/$idUsuarioAtual/$proxUserId');
    var response = await http.put(url);

    if (response.statusCode == 200) {
      print('PUT request successful');
    } else {
      print('Failed to send PUT request with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }


  void _next() {
    if (currentIndex < User.users.length - 1) {
      setState(() {
        currentIndex++;
        currentUser = User.users[currentIndex];
        proxUserId = currentUser!.id;
        print('${widget.idUsuarioAtual},$proxUserId');
        executePutRequest(widget.idUsuarioAtual, proxUserId);
      });
    } else if (currentIndex == User.users.length - 1) {
      setState(() {
        currentIndex = 0;
        currentUser = User.users[currentIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    for (Map<String, dynamic> usuario in widget.pretendentes) {
      users.add(User.fromJson(usuario));
    }
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
                  if ((deltaX > deviceWidth * 0.27) || (deltaX < -(deviceWidth * 0.27)) || (deltaY < -(deviceHeight / 3))) {
                    _next();
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
                    onPressed: _next,
                    backgroundColor: disBack,
                  ),
                  ChoiceButton(
                    color: superlike, 
                    icon: Icons.star_rounded,
                    size: size /3,
                    onPressed: _next,
                    backgroundColor: superBack,
                  ),
                  ChoiceButton(
                    color: like, 
                    icon: Icons.favorite_rounded,
                    size: size /2,
                    onPressed: _next,
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