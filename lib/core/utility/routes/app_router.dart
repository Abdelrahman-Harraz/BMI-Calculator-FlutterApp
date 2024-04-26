import 'package:bmi_calculator/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:bmi_calculator/features/Auth/presentation/screens/auth_screen.dart';
import 'package:bmi_calculator/features/Auth/repo/auth_repository.dart';
import 'package:bmi_calculator/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import BlocProvider
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static const animationDuration = Duration(milliseconds: 600);
  late AuthRepository authRepo;
  late AuthBloc authBloc;

  AppRouter() {
    authRepo = AuthRepository();
    authBloc = AuthBloc(authRepository: authRepo);
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageTransition(
          child: BlocProvider(
            create: (context) => AppRouter().authBloc,
            child: AnonymousAuthScreen(),
          ),
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
          child: BlocProvider(
            create: (context) => AppRouter().authBloc,
            child: AnonymousAuthScreen(),
          ),
          type: PageTransitionType.size,
          alignment: Alignment.center,
          duration: animationDuration,
          settings: settings,
        );
      default:
        // If the route is not defined, return a default transition
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
