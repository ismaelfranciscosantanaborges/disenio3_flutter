import 'package:flutter/material.dart';

class Constant {
  static const textWithBoldWhite = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static const textWithBoldBlack = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
  static const textWithBoldH2 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );

  static const text = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const textDescriptions = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      shadows: [
        Shadow(
          color: Colors.black,
          offset: Offset(2, 4),
          blurRadius: 6,
        ),
      ]);
}
