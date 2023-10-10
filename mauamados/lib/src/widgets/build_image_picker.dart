import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class BuildImagePicker extends StatelessWidget{
  final VoidCallback onPressed;
  const BuildImagePicker({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context){
    double side = MediaQuery.of(context).size.longestSide;
    double fontSize = 0;
    if (side * 0.025 > 12) {
      if (side * 0.025 > 25) {
        fontSize = 25;
      } else {
        fontSize = side * 0.025;
      }
    } else {
      fontSize = 12;
    }

    return MakeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.2,
        maxChildSize: 0.2,
        builder: (_, controller) => 
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            controller: controller,
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 0),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.width * 0.09,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.photo_camera, color: const Color.fromARGB(255, 0, 71, 133), size: fontSize,),
                    const SizedBox(width: 8.0),
                    Text(
                      'Câmera',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 71, 133),
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                )
              ),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 0),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04,
                    bottom: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.09,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.image, color: const Color.fromARGB(255, 0, 71, 133), size: fontSize,),
                    const SizedBox(width: 8.0),
                    Text(
                      'Galeria',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 71, 133),
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ) 
      )
    );
  }
}