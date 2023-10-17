import 'package:flutter/material.dart';
import 'package:mauamados/src/functions/remove_confirmation.dart';

class InterestsButton extends StatelessWidget {
  final String interesse;
  final double fontSize;
  final VoidCallback onRemove;

  const InterestsButton({
    required this.interesse,
    required this.fontSize,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showRemoveConfirmation(context, 'Remover Interesse', onRemove, fontSize);
      },
      child: Container(
        margin: EdgeInsets.all(fontSize * 0.3),
        padding: EdgeInsets.all(fontSize * 0.5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 71, 133),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          interesse,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
