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
              child: InkWell(onTap: onRemove),
            ),
          ),
        ),
      ),
    );
  }
}