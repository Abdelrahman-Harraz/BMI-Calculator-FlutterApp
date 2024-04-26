import 'package:bmi_calculator/features/Auth/presentation/screens/auth_screen.dart';
import 'package:bmi_calculator/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static const animationDuration = Duration(milliseconds: 600);

  static PageTransition onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.size,
          alignment: Alignment.center,
          duration: animationDuration,
          settings: settings,
        );
      case '/HomeScreen':
        return PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.size,
          alignment: Alignment.center,
          duration: animationDuration,
          settings: settings,
        );
      case '/AnonymousAuthScreen':
        return PageTransition(
          child: AnonymousAuthScreen(),
          type: PageTransitionType.size,
          alignment: Alignment.center,
          duration: animationDuration,
          settings: settings,
        );
      default:
        // If the route is not defined, return a default transition
        return PageTransition(
          child: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          type: PageTransitionType.fade,
          settings: settings,
        );
    }
  }
}
