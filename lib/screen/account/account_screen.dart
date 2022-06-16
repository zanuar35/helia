import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helia/core/app_colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text('Profile',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: .5)),
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[500],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("John Doe",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 5,
              ),
              const Text("Email@gmail.com",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5,
                      fontSize: 20)),
              const SizedBox(
                height: 30,
              ),
              rowWidget(
                  text: "Edit Profile",
                  iconData: FontAwesomeIcons.solidUser,
                  color: Colors.grey),
              rowWidget(
                  text: "Payment",
                  iconData: FontAwesomeIcons.wallet,
                  color: Colors.grey),
              rowWidget(
                  text: "Notofication",
                  iconData: FontAwesomeIcons.solidBell,
                  color: Colors.grey),
              rowWidget(
                  text: "Security",
                  iconData: FontAwesomeIcons.shield,
                  color: Colors.grey),
              rowWidget(
                  text: "help",
                  iconData: FontAwesomeIcons.circleInfo,
                  color: Colors.grey),
              rowWidget(
                  text: "Logout",
                  iconData: FontAwesomeIcons.arrowRightFromBracket,
                  color: Colors.red)
            ],
          ),
        ),
      ),
    );
  }

  Widget rowWidget(
      {required String text,
      required IconData iconData,
      required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            height: 60,
            child: Row(
              children: [
                FaIcon(
                  iconData,
                  color: color,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: .5),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
