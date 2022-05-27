import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helia/screen/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.urbanistTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
