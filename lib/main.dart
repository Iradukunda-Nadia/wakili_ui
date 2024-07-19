import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wakili_ui/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Wakili Online',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(textTheme),
      ),
      home: const HomePage(),
    );
  }
}
