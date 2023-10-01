import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class InterestsBuilder {
  final List interesses;
  final double fontSize;

  InterestsBuilder({required this.interesses, required this.fontSize});

  List<Widget> buildInterests() {
    List<Widget> interessesList = [];
    for (int i = 0; i < interesses.length; i++) {
      interessesList.add(Interests(interesse: interesses[i], fontSize: fontSize));
    }
    return interessesList;
  }
}