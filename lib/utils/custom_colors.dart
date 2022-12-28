import 'dart:math';

import 'package:flutter/material.dart';

class CustomColors {
  static final primary = Color(0xFF34A0A4);
  static final background = Color(0xFFF5F5FA);
  static final border = Color(0xFFE8E8E8);
  static final textPrimary = Color(0xFF383838);
  static final textSecondary = Color(0xFFA9A9A9);
  static final disabled = Color(0xFFCED4DA);

  static final linearPrimary = LinearGradient(
      colors: [Color(0xFF52B69A), CustomColors.primary],
      stops: [0.0, 0.695],
      transform: GradientRotation(2.13959913 * pi));
}
