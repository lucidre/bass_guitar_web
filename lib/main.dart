import 'package:bass_guitar_web/constants/strings.dart';
import 'package:bass_guitar_web/constants/style.dart';
import 'package:bass_guitar_web/routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData(
      scaffoldBackgroundColor: lightColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
      canvasColor: lightColor,
      dialogBackgroundColor: lightColor,
      floatingActionButtonTheme: ThemeData.light()
          .floatingActionButtonTheme
          .copyWith(backgroundColor: primaryColor),
      cardColor: lightColor,
      iconTheme: ThemeData.light().iconTheme.copyWith(color: primaryColor),
      textTheme: GoogleFonts.titilliumWebTextTheme(
        Theme.of(context).textTheme,
      )
          .apply(
            bodyColor: Colors.black,
          )
          .copyWith(
            bodyText1: const TextStyle(
              fontSize: 18,
              color: darkColor,
              fontWeight: FontWeight.w500,
            ),

            bodyText2: const TextStyle(
              fontSize: 12,
              color: darkColor,
            ), // for body
          ),
    );

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: lightTheme,
    );
  }
}
