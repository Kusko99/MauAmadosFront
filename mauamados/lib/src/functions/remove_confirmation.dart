import 'package:flutter/material.dart';

void showRemoveConfirmation(BuildContext context, String title, VoidCallback onRemove, double fontSize) {

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
                title, 
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
    )
  );
}
