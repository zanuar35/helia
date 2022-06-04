import 'package:flutter/material.dart';
import 'package:helia/core/app_colors.dart';
import 'package:helia/screen/register/register.dart';
import '../../core/app_text_style.dart';

class LetIn extends StatefulWidget {
  const LetIn({Key? key}) : super(key: key);

  @override
  State<LetIn> createState() => _LetInState();
}

class _LetInState extends State<LetIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          const Text(
            "Let's you in",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
          ),
          const Expanded(child: SizedBox()),
          sosmedButton(text: "Continue with facebook"),
          sosmedButton(text: "Continue with facebook"),
          sosmedButton(text: "Continue with facebook"),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              dividerLine(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Or"),
              ),
              dividerLine()
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          nextButton(),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  },
                  child: Text(
                    " Sign up",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }

  Widget nextButton() {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 50,
            child: Center(
              child: Text(
                "Sign in with password",
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

  Widget dividerLine() {
    return Expanded(
      child: Divider(
        color: AppColors.borderColor,
        height: 1,
        thickness: 1,
      ),
    );
  }

  Widget sosmedButton({required String text}) {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook, color: AppColors.grey),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: AppTextStyles.body161,
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: 2),
              borderRadius: BorderRadius.circular(10)),
        ))
      ],
    );
  }
}
