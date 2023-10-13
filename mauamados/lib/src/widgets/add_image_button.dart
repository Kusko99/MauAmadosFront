import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ImageButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}