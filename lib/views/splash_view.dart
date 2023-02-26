import 'package:apifucntional/views/homeview.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Homeview(),
            ));
      },
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: LottieBuilder.asset("assets/lottie/splash.json"),
      ),
    );
  }
}
