import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.longestSide;
    double fontSize = side * 0.025;
    if (side * 0.025 < 14) {
      fontSize = 14;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 120,
        minHeight: 158.5,
      ),
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.shortestSide * 0.02),
        width: MediaQuery.of(context).size.shortestSide * 0.28,
        height: MediaQuery.of(context).size.shortestSide * 0.37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: SizedBox.expand(
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: 10,
              color: Colors.grey[350],
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => BottomSheet(
                  onClosing: () {},
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.photo_camera,
                              color: const Color.fromARGB(255, 0, 71, 133),
                              size: fontSize,
                            ),
                            title: Text(
                              'Câmera', 
                              style: TextStyle(
                                fontSize: fontSize,
                                color: const Color.fromARGB(255, 0, 71, 133)
                              ),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.image,
                              color: const Color.fromARGB(255, 0, 71, 133),
                              size: fontSize,
                            ),
                            title: Text(
                              'Galeria', 
                              style: TextStyle(
                                fontSize: fontSize,
                                color: const Color.fromARGB(255, 0, 71, 133)
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}