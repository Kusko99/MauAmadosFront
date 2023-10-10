import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.shortestSide * 0.02),
        width: MediaQuery.of(context).size.shortestSide * 0.28,
        height: MediaQuery.of(context).size.shortestSide * 0.37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey
        ),
        child: SizedBox.expand(
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: 10,
              color: Colors.grey[350],
            ),
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => BuildImagePicker(onPressed: (){},),
            ),
          ),
        ),
      ),
    );
  }
}