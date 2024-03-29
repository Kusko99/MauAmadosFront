import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/models/models.dart';

class MainScreen extends StatefulWidget {
  final double fontSize1;
  final double fontSize2;
  final int idUsuarioAtual;
  final User usuarioAtual;
  final List pretendentes;

  const MainScreen({
    required this.fontSize1,
    required this.fontSize2,
    required this.idUsuarioAtual,
    required this.usuarioAtual,
    required this.pretendentes,
    super.key
    });

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    if (widget.pretendentes.isEmpty) {
      setState(() {
        screens = [
          const HomeAlter(),
          ProfilePage(
            fontSize1: widget.fontSize1, 
            fontSize2: widget.fontSize2, 
            usuarioAtual: widget.usuarioAtual
          ),
          ChatPage(
            fontSize: widget.fontSize2 * 0.75 < 12 ? 12 : widget.fontSize2 * 0.75, 
            idUsuarioAtual: 1,
          )
        ];
      });
    } else {
      setState(() {
        screens = [
          HomePage(
            idUsuarioAtual: widget.idUsuarioAtual, 
            pretendentes: widget.pretendentes,
            fontSize1: widget.fontSize1, 
            fontSize2: widget.fontSize2,
            user1: widget.usuarioAtual,
          ),
          ProfilePage(
            fontSize1: widget.fontSize1, 
            fontSize2: widget.fontSize2, 
            usuarioAtual: widget.usuarioAtual
          ),
          ChatPage(
            fontSize: widget.fontSize2 * 0.75 < 12 ? 12 : widget.fontSize2 * 0.75, 
            idUsuarioAtual: 1,
          )
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    double bottomNavBarSize = MediaQuery.of(context).size.height *  0.09;
    if (bottomNavBarSize < 40) {
      bottomNavBarSize = 40;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(    
        body: IndexedStack(
          index: currentIndex,
          children: screens
        ),
        bottomNavigationBar: Container(
          constraints: BoxConstraints(
            minHeight: bottomNavBarSize,
          ),
          child: SizedBox(                
            height: bottomNavBarSize,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: const Color.fromARGB(255, 0, 71, 133),
              unselectedItemColor: const Color.fromARGB(255, 158, 189, 255),
              showUnselectedLabels: false,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              iconSize: bottomNavBarSize * 0.4,
              selectedFontSize: bottomNavBarSize * 0.2,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), 
                  label: 'Home'
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.person), 
                  label: 'Perfil'
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.chat), 
                  label: 'Chat'
                )
              ]
            ),
          )
        )
      )
    );
  }
}