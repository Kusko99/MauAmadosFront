import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const ProfilePage(),
    const ChatPage()
  ];

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