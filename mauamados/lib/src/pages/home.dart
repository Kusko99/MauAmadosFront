import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  static const User user = 
    User(
      id: 1, 
      nome: 'Carlos', 
      idade: 18, 
      urlFotos: [
        'https://media.licdn.com/dms/image/D4E03AQHgAMy3qx5SNg/profile-displayphoto-shrink_800_800/0/1683990505413?e=2147483647&v=beta&t=Jab6vrLkz8UOjKFhd_MF9RCEeg4PikNScMzosoLHAWo', 
        'https://i.imgur.com/PUfQZfl.jpg',
        'https://i.imgur.com/kKMbl23.jpg'
      ], 
      bio: 'Shrek é um ogro rabugento e nada sociável que se vê com um problema enorme: todas as criaturas de contos de fadas foram despejadas no pântano onde vive. Determinado a tirá-las dali e voltar a viver em paz, ele faz um trato com o príncipe do reino, que por sua vez precisa de alguém bruto e forte para resgatar a princesa Fiona, com quem o monarca pretende se casar para virar rei. Porém, a moça está guardada em uma torre por um dragão feroz. Se conseguir trazer a princesa, Shrek terá suas terras de volta. Assim, ele logo parte em sua missão, mas não sem a companhia de um inconveniente burro falante.', 
      curso: 'Ciências da Computação',
      interesses: []
    );

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double size = (deviceHeight* 0.1);
    if (MediaQuery.of(context).size.width / deviceHeight <= 0.267 ) {
      size = MediaQuery.of(context).size.shortestSide * 0.375;
    }
    
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              const UserCard(user: user),
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

