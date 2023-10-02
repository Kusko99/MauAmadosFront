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

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double size = (deviceHeight* 0.1);
    if (MediaQuery.of(context).size.width / deviceHeight <= 0.267 ) {
      size = MediaQuery.of(context).size.shortestSide * 0.375;
    }

    List<User> users = User.users;
    UserCard card = UserCard(user: users[0]);
    UserCard nextCard = UserCard(user: users[1]);
    
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              Draggable(
                feedback: card,
                childWhenDragging: nextCard,
                onDragEnd: (drag) {
                  final endPosition = drag.offset;
                  if (endPosition.dx > 0) {
                    print('Direita');
                  } else if (endPosition.dx < 0) {
                    print('Esquerda');
                  }
                  print(endPosition.dx);
                  print(endPosition.dy);
                },
                child: card,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ChoiceButton(
                    color: const Color.fromARGB(255, 255, 88, 100), 
                    icon: Icons.clear_rounded,
                    size: size / 2,
                  ),
                  ChoiceButton(
                    color: const Color.fromARGB(255, 45, 185, 216), 
                    icon: Icons.star_rounded,
                    size: size /3,
                  ),
                  ChoiceButton(
                    color: const Color.fromARGB(255, 107, 253, 168), 
                    icon: Icons.favorite_rounded,
                    size: size /2,
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

