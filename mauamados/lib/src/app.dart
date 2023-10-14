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

  @override
  Widget build(BuildContext context) {
    
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double fontSize1 = deviceHeight * 0.04;
    double fontSize2 = deviceHeight * 0.03;
    if (deviceHeight < deviceWidth) {
      deviceWidth = deviceHeight;
    }
    if ((deviceHeight > deviceWidth) && (deviceHeight * 0.047 > deviceWidth * 0.072)){
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
      const ChatPage()
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