import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerTV extends GetxController{

  Color _iconColor = Colors.yellow.obs as Color;

  Color get iconColor => _iconColor;

  set iconColor(Color value) {
    _iconColor = value;
  }

}