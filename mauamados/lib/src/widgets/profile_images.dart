import 'package:flutter/material.dart';
import 'package:mauamados/src/functions/remove_confirmation.dart';

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
                enableFeedback: false,
                highlightColor: Colors.transparent,
                onTap: () {
                  showRemoveConfirmation(context, 'Remover Foto', onRemove, fontSize);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}