import 'dart:ui';
import 'package:flutter/material.dart';

Color? color1 = Colors.white;

bool IsDark = false;

SetMode() {
  IsDark =! IsDark;
  IsDark ? color1 = Colors.black : color1 = Colors.white;
  

}
