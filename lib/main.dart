import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mini_e_commerce/core/functions.dart';
import 'package:mini_e_commerce/core/http_overrides.dart';
import 'package:mini_e_commerce/views/screens/home_screen.dart';
import 'views/screens/login_screen.dart';
import 'views/screens/signup_screen.dart';

bool? isAuthenticated;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  isAuthenticated = await isAuth();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Project E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            isAuthenticated! ? const HomeScreen() : const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
