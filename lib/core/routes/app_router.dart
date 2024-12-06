import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:asroo_store/core/routes/routes.dart';
import 'package:asroo_store/core/common/screens/under_build_screen.dart';
import 'package:asroo_store/test_one_screen.dart';
import 'package:asroo_store/test_two_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //  this arguments to be passed in any screen  like this (arguments & className)
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.testOneScreen:
        return BaseRoute(page: const TestOneScreen());
         case Routes.testTwoScreen:
   return BaseRoute(page: const TestTwoScreen());
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
