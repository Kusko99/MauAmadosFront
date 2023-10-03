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
  String dragDirection = '';
  Offset startPosition = Offset.zero;
  GlobalKey<DragTextIndicatorState> dragTextIndicatorKey = GlobalKey();

  void _next() {
    if (currentIndex < User.users.length - 1) {
      setState(() {
        currentIndex++;
        currentUser = User.users[currentIndex];
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
                feedback: Stack(
                  alignment: Alignment.center,
                  children: [
                    userCard,
                    Positioned(
                      top: 20, // Ajuste a posição vertical do texto conforme necessário
                      child: DragTextIndicator(
                        key: dragTextIndicatorKey, // Passe a chave global para o indicador
                      ),
                    ),
                  ],
                ),
                childWhenDragging: UserCard(
                  user: currentIndex < users.length - 1 ? users[currentIndex + 1] : users[0],
                  onUserChanged: (newUser) {},
                ),
                onDragStarted: () {
                  startPosition = Offset.zero;
                },
                onDragUpdate: (details) {
                  final dx = details.localPosition.dx;
                  final dy = details.localPosition.dy;

                  if (startPosition == Offset.zero) {
                    // Se for a primeira atualização, registre a posição inicial
                    startPosition = details.localPosition;
                  } else {
                    final deltaX = dx - startPosition.dx;
                    final deltaY = dy - startPosition.dy;

                    if (deltaX > 50) {
                      setState(() {
                        dragDirection = 'Direita'; // Atualize a direção do arrasto
                      });
                    } else if (deltaX < -50) {
                      setState(() {
                        dragDirection = 'Esquerda'; // Atualize a direção do arrasto
                      });
                    } else if (deltaY < -50) {
                      setState(() {
                        dragDirection = 'Cima'; // Atualize a direção do arrasto
                      });
                    } else {
                      setState(() {
                        dragDirection = ''; // Limpe a direção do arrasto se não for suficiente
                      });
                    }
                    print(deltaX);
                    print(dragDirection);
                  }
                },
                onDragEnd: (drag) {
                  final endPosition = drag.offset;
                  setState(() {
                    dragDirection = '';
                  });
                  if (endPosition.dx > 0 && endPosition.dx > 100) {
                    print('MAUÁprovado');
                    _next();
                  } else if (endPosition.dx < 0 && endPosition.dx < -100) {
                    _next();
                    print('MAUÁnulado');
                  } else if (endPosition.dy < -100) {
                    _next();
                    print('MAUÁmado');
                  };
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

class DragTextIndicator extends StatefulWidget {
  DragTextIndicator({Key? key}) : super(key: key);

  @override
  DragTextIndicatorState createState() => DragTextIndicatorState();
}

class DragTextIndicatorState extends State<DragTextIndicator> {
  String text = ''; // Inicialize com uma string vazia

  // Método para atualizar o texto
  void updateText(String newText) {
    setState(() {
      text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Arraste para a $text', // Use a string atualizada com base na direção do arrasto
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}