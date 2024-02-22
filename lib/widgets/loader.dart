import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:todoapp/constant/colors.dart';

class AnimatedLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyLoaderScreen();
  }
}

class MyLoaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
            size: 75, color: purpleColor),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
