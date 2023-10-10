import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class ProfileImagesBuilder {
  final List<String> images;

  ProfileImagesBuilder({required this.images});

  List<Widget> imagesBuilder() {
    List<Widget> imagesList = [];

    for (int i = 0; i < images.length; i++){
      imagesList.add(ProfileImages(image: images[i],onClicked: () {},));
    }
    if (imagesList.length < 9) {
      for (int i = imagesList.length; i < 9; i++) {
        imagesList.add(const ImageButton());
      }
    }

    return imagesList;
  }
}