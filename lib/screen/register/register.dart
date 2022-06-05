import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helia/core/app_colors.dart';
import 'package:helia/core/app_text_style.dart';
import 'package:helia/screen/home/home.dart';
import 'package:helia/screen/letin/let_in.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 8),
            Text("Create Your \nAccount",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                )),
            const Expanded(child: SizedBox()),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "Email",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.remove_red_eye),
                labelStyle: AppTextStyles.subtitle,
                hintText: "Password",
                fillColor: Colors.green,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: AppColors.green),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Radio(
                    focusColor: Colors.transparent,
                    value: 0,
                    groupValue: null,
                    onChanged: null),
                Text("Remember me",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, letterSpacing: .3)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            nextButton(),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                dividerLine(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "or continue with",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                dividerLine()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.facebook)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.apple)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.email)),
              ],
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const LetIn()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Text(
                      "Sign in",
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

  Widget nextButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MyHomePage(title: "a"),
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
                "Sign up",
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
}
