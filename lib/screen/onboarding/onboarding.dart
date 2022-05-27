import 'package:flutter/material.dart';
import 'package:helia/core/app_colors.dart';
import 'package:helia/screen/introduction_screen/introduction.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IntroductionScreen(),
            ),
          );
        },
        child: Container(
            color: AppColors.transparent,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset("assets/img/splash_screen_img.png",
                    fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: SizedBox()),
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        "Welcome to ",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 50,
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Helia",
                        style: TextStyle(
                            color: AppColors.green,
                            fontSize: 100,
                            letterSpacing: 0.9,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 31,
                      ),
                      const Text(
                          "The best hotel booking in this century \nto accompany your vacation",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 18,
                              letterSpacing: 0.6,
                              fontWeight: FontWeight.w500,
                              height: 1)),
                      const SizedBox(
                        height: 31,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
