import 'package:asroo_store/core/common/screens/under_build_screen.dart';
import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:asroo_store/core/routes/routes.dart';
import 'package:asroo_store/features/auth/presentation/screens/login_screen.dart';
import 'package:asroo_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // ignore: strict_raw_type
  Route generateRoute(RouteSettings settings) {
    //  this arguments to be passed in any screen  like this (arguments & className)
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreen:
        return BaseRoute(page: const LoginScreen());
        case Routes.signupScreen:
  return BaseRoute(page: const SignUpScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}

MaterialPageRoute<dynamic> materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}
