import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onRemove;
  const ProfileImage({
    required this.imageUrl,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double side = MediaQuery.of(context).size.longestSide;
    double fontSize = side * 0.025;
    if (side * 0.025 < 14) {
      fontSize = 14;
    }
    if (side * 0.025 > 25) {
      fontSize = 25;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 120,
        minHeight: 158.5,
      ),
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.shortestSide * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
            color: Colors.transparent,
            child: Ink.image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.shortestSide * 0.28,
              height: MediaQuery.of(context).size.shortestSide * 0.37,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomSheet(
                      onClosing: () {},
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.delete,
                                color: const Color.fromARGB(255, 0, 71, 133),
                                size: fontSize,
                              ),
                              title: Text(
                                'Remover Foto', 
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: const Color.fromARGB(255, 0, 71, 133)
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                onRemove();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}