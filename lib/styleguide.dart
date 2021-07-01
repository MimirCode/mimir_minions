import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const TextStyle display1 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static const TextStyle heading = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w900,
    fontSize: 34,
    color: Colors.white70,
    letterSpacing: 1.2,
  );

  static const TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: Colors.white70,
  );
}
