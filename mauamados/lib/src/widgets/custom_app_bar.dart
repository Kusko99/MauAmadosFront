import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeigh = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    if (deviceHeigh < deviceWidth) {
      deviceWidth = deviceHeigh;
    }
    return AppBar(
      backgroundColor: Colors.transparent, 
      elevation: 0, 
      centerTitle: true, 
      toolbarHeight: deviceHeigh * 0.08, 
      leadingWidth: deviceHeigh * 0.08,
      leading: Image.network('https://i.imgur.com/mgKFZtj.jpg'),
      title: Text(
        'MAUÁmados', 
        style: TextStyle(
          color: const Color.fromARGB(255, 0, 71, 133), 
          fontWeight: FontWeight.bold, 
          fontSize: (deviceHeigh * 0.03)
        ),
      )  
    );
  }
}