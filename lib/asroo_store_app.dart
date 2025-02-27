import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:asroo_store/core/app/connectivity_controller.dart';
import 'package:asroo_store/core/common/screens/no_network_screen.dart';
import 'package:asroo_store/core/di/inject_container.dart';
import 'package:asroo_store/core/language/app_localizations_setup.dart';
import 'package:asroo_store/core/routes/app_router.dart';
import 'package:asroo_store/core/routes/routes.dart';
import 'package:asroo_store/core/services/shared_pref/pref_keys.dart';
import 'package:asroo_store/core/services/shared_pref/shared_pref.dart';
import 'package:asroo_store/core/style/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({required this.appRouter, super.key});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, bool networkStatus, __) {
        if (networkStatus) {
          return BlocProvider(
            create: (context) => sl.get<AppCubit>()
              ..changeAppThemeMode(
                sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
              ),
            child: ScreenUtilInit(
              designSize: const Size(390, 844),
              minTextAdapt: true,
              splitScreenMode: true,

              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previousState, currState) =>
                    previousState != currState,
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: cubit.isDark ? themeDark():themeLight(),

                    builder: (context, widget) {
                      return GestureDetector(
                        onTap: () {
                          // to close any text form field i don't open it
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        child: Scaffold(
                          body: Builder(
                            builder: (context) {
                              ConnectivityController.instance.init();
                              return widget!;
                            },
                          ),
                        ),
                      );
                    },
                    locale: Locale(cubit.currentLangCode),
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    navigatorKey: sl<GlobalKey<NavigatorState>>(),
                    onGenerateRoute: appRouter.generateRoute,
                    initialRoute:
                    // Routes.loginScreen
                    SharedPref()
                                .getString(PrefKeys.accessToken) !=
                            null
                        ? SharedPref().getString(PrefKeys.userRole) != 'admin'
                            ? Routes.homeCustomerScreen
                            : Routes.homeAdminScreen
                        : Routes.loginScreen,
                  );
                },
              ),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
