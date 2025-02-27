import 'package:asroo_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/screens/under_build_screen.dart';
import 'package:asroo_store/core/di/inject_container.dart';
import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:asroo_store/core/routes/routes.dart';
import 'package:asroo_store/features/admin/home_admin/representation/screens/home_admin_screen.dart';
import 'package:asroo_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:asroo_store/features/auth/presentation/screens/login_screen.dart';
import 'package:asroo_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:asroo_store/features/customer/presentation/screens/home_customer.dart';
import 'package:asroo_store/features/customer/product_details/presentation/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  // ignore: strict_raw_type
  Route generateRoute(RouteSettings settings) {
    //  this arguments to be passed in any screen  like this (arguments & className)
   // final argument = settings.arguments;
    switch (settings.name) {
      case Routes.loginScreen:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => sl<AuthBloc>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return BaseRoute(page: MultiBlocProvider(
          providers: [
             BlocProvider(create: (context) => sl<AuthBloc>()),
            BlocProvider(create: (context) => sl<UploadImageCubit>()),
          ],
          child: const SignUpScreen(),
        ),);
      case Routes.homeAdminScreen:
        return BaseRoute(page: const HomeAdminScreen());
         case Routes.productDetailsScreen:
        return BaseRoute(
          page: ProductDetailsScreen(
            productId: settings.arguments! as int,
          ),
        );
      case Routes.homeCustomerScreen:
        return BaseRoute(page: const HomeCustomerScreen());
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
