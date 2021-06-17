import 'package:flutter/material.dart';
import 'package:gym_app/Screens/IntroPage.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        accentColor: Colors.black54,
        accentColorBrightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
        ),
        canvasColor: Colors.white,
        primaryColor: Colors.white,
      ),
      initialRoute: IntroPage.id,
      routes: {
        IntroPage.id : (context) => IntroPage(),
      },
    ),
  );
}
