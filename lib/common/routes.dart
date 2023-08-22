import 'package:flutter/material.dart';

import '../features/home/home.dart';
import '../features/quiz/presentation/quiz.dart';
import '../features/splash_screen/presentation/pages/splash_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> appRoutes = {
    'splash_screen': (context) => const SplashScreen(),
    'home': (context) => Home(title: '', result: '',),
    'quiz': (context) => Quiz(),

  };
}
