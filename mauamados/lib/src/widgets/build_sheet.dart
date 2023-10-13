import 'package:flutter/material.dart';
import 'package:mauamados/models/models.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class BuildSheet extends StatelessWidget {
  final User user;

  const BuildSheet({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.longestSide;
    double fontSize = 0;
    if (side * 0.025 > 12) {
      if (side * 0.025 > 35) {
        fontSize = 35;
      } else {
        fontSize = side * 0.025;
      }
    } else {
      fontSize = 12;
    }
    return MakeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.058,
            bottom: MediaQuery.of(context).size.height * 0.058,
            left: MediaQuery.of(context).size.width * 0.09,
            right: MediaQuery.of(context).size.width * 0.09,
          ),
          child: ListView(
            controller: controller,
            children: [
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.07,
                ),
                child: Wrap(
                  children: 
                    InterestsBuilder(interesses: user.interesses, fontSize: fontSize).buildInterests(),
                ),
              ),
              Text(
                user.bio,
              style: TextStyle(fontSize: fontSize)
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.058,
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 71, 133),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(fontSize * 0.4),
                      child:Text(
                        'Fechar', 
                        style: TextStyle(fontSize: fontSize),
                      )
                    ),
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
