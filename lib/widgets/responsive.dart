import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key key,
    @required this.movile,
    this.tablet,
    @required this.desktop,
  }) : super(key: key);

  final Widget movile;
  final Widget tablet;
  final Widget desktop;

  static bool isMovile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width <= 1200;

  static bool isDesktop(BuildContext context) {
    print('>> ${MediaQuery.of(context).size.width}');
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    final _screenSizeWidth = MediaQuery.of(context).size.width;
    print(_screenSizeWidth);
    if (_screenSizeWidth >= 1200) {
      return desktop;
    } else if (_screenSizeWidth >= 800) {
      return tablet ?? movile;
    } else {
      return movile;
    }
  }
}

// @override
// Widget build(BuildContext context) {
//   return LayoutBuilder(builder: (context, constraints) {
//     print(constraints.maxWidth);
//     if (constraints.maxWidth >= 1200) {
//       return desktop;
//     } else if (constraints.maxWidth >= 800) {
//       return tablet ?? movile;
//     } else {
//       return movile;
//     }
//   });
// }
//}
