import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/user_card.dart';

class DraggableUserCard extends StatelessWidget {
  final UserCard userCard;
  final String feedbackText;

  DraggableUserCard({required this.userCard, required this.feedbackText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        userCard,
        Positioned(
          top: 0,
          child: Container(
            color: Colors.white,
            child: Text(
              feedbackText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}