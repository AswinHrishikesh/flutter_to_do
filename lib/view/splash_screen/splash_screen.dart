import 'package:flutter/material.dart';
import 'package:flutter_to_do/constants/color_constants.dart';
import 'package:flutter_to_do/home_scree/home_screen.dart';
import 'package:flutter_to_do/utils/animation_constants.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then(
      (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainblack,
      body: Center(
        child: Lottie.asset(AnimationConstants.splash_logo),
      ),
    );
  }
}
