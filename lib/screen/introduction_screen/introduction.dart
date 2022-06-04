import 'package:flutter/material.dart';
import 'package:helia/core/app_colors.dart';
import 'package:helia/core/app_text_style.dart';

import '../letin/let_in.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int curentPage = 0;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              color: Colors.blue[200],
              child: PageView.builder(
                  controller: _controller,
                  itemCount: 3,
                  onPageChanged: (value) {
                    setState(() {
                      curentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Expanded(
                        child: Container(
                      child: Center(
                        child: Text(index.toString()),
                      ),
                      color: Colors.redAccent,
                    ));
                  }),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Travel safely", style: AppTextStyles.title),
                    Text(
                      "Comfortably & easily",
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Lorem ipsum dolor Sit amet, consectefur adipiscing elit, sed do eiusmod tempor\n incididunt ut labore et dolore magna aliqua.",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subtitle),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                            3, (index) => buildDot(index: index))),
                    Expanded(child: Container()),
                    const SizedBox(
                      height: 20,
                    ),
                    nextButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    skipButton(),
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget skipButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const LetIn()),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 50,
            child: Center(
              child: Text(
                "Skip",
                style: AppTextStyles.buttonSoftGreen,
              ),
            ),
            decoration: BoxDecoration(
                color: AppColors.softGreen,
                borderRadius: BorderRadius.circular(30)),
          ))
        ],
      ),
    );
  }

  Widget nextButton() {
    return InkWell(
      onTap: () {
        _controller.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      },
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 50,
            child: Center(
              child: Text(
                "Next",
                style: AppTextStyles.onBoardButton1,
              ),
            ),
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(30)),
          ))
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 6,
        width: curentPage == index ? 25 : 6,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff21C064), Color(0xff3EDF83)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
