import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:budget_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        useMaterial3: true,
        fontFamily: 'lato',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
      
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/budget.json',
              height: 300, fit: BoxFit.fill),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 142, 255, 189),
      nextScreen: HomeScreen(),
      splashIconSize: 600,
      pageTransitionType: PageTransitionType.fade,
      duration: 1800,
    );
  }
}
