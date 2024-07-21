import 'package:flutter/material.dart';
import 'package:laundromat_flutter/language_povider.dart';
import 'package:laundromat_flutter/screen/home_screen.dart';
import 'package:laundromat_flutter/screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
