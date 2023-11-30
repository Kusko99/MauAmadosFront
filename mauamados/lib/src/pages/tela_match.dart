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
    double deviceSize = MediaQuery.of(context).size.shortestSide * 0.02;
    double fotoHeight = deviceHeight;
    double fotoWidth = deviceHeight;

    if (deviceHeight > deviceWidth) {
      fotoHeight = deviceHeight;
      fotoWidth = deviceWidth;
    } else {
      fotoWidth = deviceHeight;
      fotoHeight = deviceHeight;
    }

    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        color: Colors.black,
        child: Center(
          child: Stack(
            children: [
              SizedBox(
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
              Positioned(
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(deviceSize * 5),
                  child:   Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.green
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(deviceSize),
                      child: Text(
                        'MATCH',
                        style: TextStyle(
                          fontSize: deviceSize * 5,
                          color: Colors.green,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    
  }
}
