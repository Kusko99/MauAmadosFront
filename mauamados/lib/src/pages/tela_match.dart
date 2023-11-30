import 'package:flutter/material.dart';

class TelaMatch extends StatefulWidget {
  final String link;
  const TelaMatch({
    required this.link,
    Key? key,
  }) : super(key: key);

  @override
  State<TelaMatch> createState() => _TelaMatchState();
}

class _TelaMatchState extends State<TelaMatch> {
  @override
  void initState() {
    super.initState();
    sair();
  }

  void sair() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double fotoHeight = deviceHeight;
    double fotoWidth = deviceHeight;

    if (deviceHeight > deviceWidth) {
      fotoHeight = deviceHeight;
      fotoWidth = deviceWidth;
    } else {
      fotoWidth = deviceHeight;
      fotoHeight = deviceHeight;
    }

    return Container(
      width: deviceWidth,
      height: deviceHeight,
      color: Colors.black,
      child: Center(
        child: Container(
          height: fotoHeight,
          width: fotoWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image(
              image: NetworkImage(
                widget.link,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
