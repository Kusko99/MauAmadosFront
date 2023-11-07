import 'package:flutter/material.dart';
import 'package:mauamados/src/pages/pages.dart';

class App extends StatelessWidget {
  const App({super.key});

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
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginCadastro(deviceHeight: deviceHeight, fontSize1: fontSize1, fontSize2: fontSize2)
      // home:UserProfileForm()
      // home: LoginApp()
    );
  }
}