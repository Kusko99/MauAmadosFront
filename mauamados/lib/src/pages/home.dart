import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<User> users = User.users;
  User currentUser = User.users[0];
  int currentIndex = 0;

  void _next() {
    if (currentIndex < User.users.length - 1) {
      setState(() {
        currentIndex++;
        currentUser = User.users[currentIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
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
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              Draggable(
                feedback: userCard,
                childWhenDragging: UserCard(
                  user: currentIndex < users.length - 1 ? users[currentIndex + 1] : users[currentIndex],
                  onUserChanged: (newUser) {},),
                onDragEnd: (drag) {
                  final endPosition = drag.offset;
                  if (endPosition.dx > 0) {
                    _next();
                  } else if (endPosition.dx < 0) {
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
                    color: const Color.fromARGB(255, 255, 88, 100), 
                    icon: Icons.clear_rounded,
                    size: size / 2,
                    onPressed: _next,
                  ),
                  ChoiceButton(
                    color: const Color.fromARGB(255, 45, 185, 216), 
                    icon: Icons.star_rounded,
                    size: size /3,
                    onPressed: _next,
                  ),
                  ChoiceButton(
                    color: const Color.fromARGB(255, 107, 253, 168), 
                    icon: Icons.favorite_rounded,
                    size: size /2,
                    onPressed: _next,
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

