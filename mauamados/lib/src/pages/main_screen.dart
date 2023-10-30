import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';
import 'package:mauamados/models/models.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double fontSize1 = deviceHeight * 0.04;
    double fontSize2 = deviceHeight * 0.03;
    if (deviceHeight < deviceWidth) {
      deviceWidth = deviceHeight;
    }
    if (deviceHeight > deviceWidth*1.6){
      fontSize1 = deviceWidth * 0.072;
      fontSize2 = deviceWidth * 0.054;
    }
    if (fontSize1 < 15) {
      fontSize1 = 15;
    }
    if (fontSize2 < 11) {
      fontSize2 = 11;
    }
    
    double bottomNavBarSize = MediaQuery.of(context).size.height *  0.09;
    if (bottomNavBarSize < 40) {
      bottomNavBarSize = 40;
    }

    final screens = [
      const HomePage(),
      ProfilePage(fontSize1: fontSize1, fontSize2: fontSize2,),
      ChatPage(conversas: conversas,fontSize: fontSize2 * 0.75 < 12 ? 12 : fontSize2 * 0.75, idUsuarioAtual: 1,)
    ];

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