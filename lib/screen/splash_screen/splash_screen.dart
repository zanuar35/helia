import 'package:flutter/material.dart';
import 'package:helia/screen/onboarding/onboarding.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
                child: SizedBox(
              height: 1,
            )),
            Image.asset("assets/img/Vector 1.png"),
            const Expanded(
                child: SizedBox(
              height: 1,
            )),
            LoadingAnimationWidget.dotsTriangle(
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [Color(0xff1FBD62), Color(0xff35DB7A)],
          ),
        ),
      ),
    );
  }
}
