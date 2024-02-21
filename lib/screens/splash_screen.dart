import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  AnimationController? _animationController;

  Animation<double> get animation => _animationController!.view;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  @override
  void initState() {
    super.initState();
    // Simulate some loading time or async operation
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the Homepage screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FadeTransition(
            opacity: _animationController!,
            // Access animation directly from the class
            child: Image.asset('assets/images/splash_screen.png'),
          ),
        ),
      ),
    );
  }
}
