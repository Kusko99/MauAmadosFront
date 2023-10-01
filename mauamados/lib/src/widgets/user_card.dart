import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class UserCard extends StatefulWidget{
  final User user;
  const UserCard({required this.user, super.key});

  @override
  State<UserCard> createState() {
    return _UserCardState();
  }
}

class _UserCardState extends State<UserCard> {
  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < widget.user.urlFotos.length -1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _preve() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double fontSize1 = deviceHeight * 0.058;
    double fontSize2 = deviceHeight * 0.023;
    double iconSize = deviceHeight * 0.0405;
    if (deviceHeight < deviceWidth) {
      deviceWidth = deviceHeight;
    }
    if ((deviceHeight > deviceWidth) && (deviceHeight * 0.058 > deviceWidth * 0.09)){
      fontSize1 = deviceWidth * 0.09;
      fontSize2 = deviceWidth * 0.037;
      iconSize = deviceWidth * 0.0635;
    }
    if (fontSize1 < 15) {
      fontSize1 = 15;
    }
    if (fontSize2 < 7) {
      fontSize2 = 7;
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: SizedBox(
        height: deviceHeight / 1.5,
        width: deviceWidth,
        child: Stack(
          children: [
            Container(
              height: deviceHeight / 1.5,
              width: deviceWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(widget.user.urlFotos[currentIndex]),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(3, 3),
                  )
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: deviceWidth,
                      margin: const EdgeInsets.all(15),
                      child: Row(
                        children: IndicatorBuilder(
                          currentIndex: currentIndex,
                          urlFotos: widget.user.urlFotos,
                        ).buildIndicators(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => _preve(),                  
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _next(),                   
                  )
                ),
              ],
            ),
            Positioned(
              bottom: deviceHeight * 0.05,
              left: deviceWidth * 0.05,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.user.nome}, ${widget.user.idade}',
                            style: TextStyle(
                              fontSize: fontSize1,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.user.curso,
                            style: TextStyle(
                              fontSize: fontSize2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: iconSize * 3,
                        height: iconSize * 3,
                        child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          onPressed: () => showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => BuildSheet(user: widget.user),
                          ),
                          child: Icon(
                            Icons.info_outline,
                            size: iconSize,
                            color: Colors.grey[350],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
