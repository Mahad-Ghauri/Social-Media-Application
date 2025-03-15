import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_application/screens/interface.dart';
import 'package:social_media_application/screens/welcome_screen.dart';
import 'package:social_media_application/screens/login_screen.dart';
import 'package:social_media_application/screens/signup_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  const url = "https://gttdwnnthusaqvujxoll.supabase.co";
  const anonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd0dGR3bm50aHVzYXF2dWp4b2xsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDE5Nzk2MzAsImV4cCI6MjA1NzU1NTYzMH0.tN5HjhRD6An99un_T9FIAVcCHcLNfmwmgXEsKGIV7VA";
  WidgetsFlutterBinding.ensureInitialized();
  //  Supbase Setup
  await Supabase.initialize(anonKey: anonKey, url: url)
      .then((value) {
        log("Supabase Initialized");
        runApp(const MyApp());
      })
      .onError((error, stackTrace) {
        log(error.toString());
      });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6D28D9),
          brightness: Brightness.light,
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
        InterfacePage.id : (context) => const InterfacePage(),

      },
    );
  }
}
