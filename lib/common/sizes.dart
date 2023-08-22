import 'package:flutter/material.dart';

class AppSizes {
  final BuildContext context;
  AppSizes({required this.context});
  late Size size = MediaQuery.of(context).size;
  late double height = size.height;
  late double width = size.width;
}