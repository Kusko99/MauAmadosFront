import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class IndicatorBuilder {
  final int currentIndex;
  final List<String> urlFotos;

  IndicatorBuilder({required this.currentIndex, required this.urlFotos});

  List<Widget> buildIndicators() {
    List<Widget> indicators = [];
    if (urlFotos.length > 1){
      for (int i = 0; i < urlFotos.length; i++) {
        if (currentIndex == i) {
          indicators.add(const Indicator(isActive: true));
        } else {
          indicators.add(const Indicator(isActive: false));
        }
      }
    }
    return indicators;
  }
}