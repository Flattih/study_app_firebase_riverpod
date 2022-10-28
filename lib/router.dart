import 'package:flutter/material.dart';
import 'package:study_app/screens/home/home_screen.dart';
import 'package:study_app/screens/introduction/introduction_screen.dart';
import 'package:study_app/screens/login/login_screen.dart';
import 'package:study_app/screens/question/questions_screen.dart';
import 'package:study_app/screens/splash/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SplashScreen(),
      );
    case AppIntroductionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AppIntroductionScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case QuestionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const QuestionScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
