import 'package:flutter/material.dart';

class ProfileImages extends StatelessWidget{
  final String image;
  final VoidCallback onClicked;
  const ProfileImages({required this.image, required this.onClicked, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.shortestSide * 0.02),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.shortestSide * 0.2,
                height: MediaQuery.of(context).size.shortestSide * 0.3,
                child: InkWell(onTap: onClicked,),
              ),
            )
          )
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.shortestSide * 0.07,
            height: MediaQuery.of(context).size.shortestSide * 0.07,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 71, 133),
              borderRadius: BorderRadius.circular(90),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: MediaQuery.of(context).size.shortestSide * 0.05,
              ),
            ),
          ),
        ),
      ],
    );
  }
}