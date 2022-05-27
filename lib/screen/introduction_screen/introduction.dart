import 'package:flutter/material.dart';
import 'package:helia/core/app_text_style.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              color: Colors.blue[200],
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                color: Colors.red[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Travel safely", style: AppTextStyles.h1),
                    Text(
                      "Comfortably and easily",
                      style: AppTextStyles.h1,
                    ),
                    Text(
                      "Lorem ipsum dolor Sit amet, consectefur adipiscing\n elit, sed do eiusmod tempor incididunt ut labore et\n dolore magna aliqua.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h1,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
