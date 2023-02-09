import 'package:flutter/material.dart';

class HomeController {
  double minWidth(BuildContext context) {
    double width;
    isPortrait(context)
        ? width = MediaQuery.of(context).size.width / 2
        : width = (MediaQuery.of(context).size.width - 80 - 80 - 80) / 3;
    return width;
  }

  bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}
