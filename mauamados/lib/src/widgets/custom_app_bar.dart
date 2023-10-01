import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      leading: SvgPicture.asset(
        'assets/logo.svg', 
        colorFilter: const ColorFilter.mode(Color.fromARGB(255, 0, 71, 133), BlendMode.srcIn)
      ),    
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