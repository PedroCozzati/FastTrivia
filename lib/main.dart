import 'package:fasttrivia1/common/routes.dart';
import 'package:flutter/material.dart';

import 'features/splash_screen/presentation/pages/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: AppRoutes.appRoutes,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}
