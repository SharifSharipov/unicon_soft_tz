import 'package:flutter/material.dart';
import 'package:unicon_soft_tz/app_options.dart';
import 'package:unicon_soft_tz/core/extension/extension.dart';
import 'package:unicon_soft_tz/core/themes/themes.dart';
import 'package:unicon_soft_tz/router/routes.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context){
  
    return ModelBinding(
    initialModel: AppOptions(themeMode: ThemeMode.light, locale: const Locale('ru')),
    child: Builder(
      builder: (context) {

        return MaterialApp.router(
          /// title
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,

          /// theme style
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.options.themeMode,

          /// pages
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        );
      },
    ),
  );
  }
}
