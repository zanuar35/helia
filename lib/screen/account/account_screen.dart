// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helia/core/app_colors.dart';
import 'package:helia/screen/edit_profile/edit_profile.dart';
import 'package:helia/screen/notification/notification.dart';
import 'package:helia/screen/security/security.dart';

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
        title: const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text('Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5)),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[500],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz_outlined,
                color: Colors.red,
              )),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: double.infinity,
          height: double.infinity,
          child: ListView(
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(
                height: 5,
              ),
              const Text("Email@gmail.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: .7,
                      fontSize: 13)),
              const SizedBox(
                height: 10,
              ),
              rowWidget(
                  text: "Edit Profile",
                  iconData: FontAwesomeIcons.solidUser,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                  color: Colors.grey),
              rowWidget(
                  text: "Payment",
                  iconData: FontAwesomeIcons.wallet,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                  color: Colors.grey),
              rowWidget(
                  text: "Notification",
                  iconData: FontAwesomeIcons.solidBell,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationPage()));
                  },
                  color: Colors.grey),
              rowWidget(
                  text: "Security",
                  iconData: FontAwesomeIcons.shield,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecurityScreen()));
                  },
                  color: Colors.grey),
              rowWidget(
                  text: "help",
                  iconData: FontAwesomeIcons.circleInfo,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  },
                  color: Colors.grey),
              rowWidget(
                  onTap: logOut,
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
      required GestureTapCallback onTap,
      required Color color}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
              height: 55,
              child: Row(
                children: [
                  FaIcon(
                    iconData,
                    color: color,
                    size: 20,
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
      ),
    );
  }

  void logOut() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'Logout',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const Text(
                'Are you sure you want to logout?',
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: .4,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(300, 45)),
                  backgroundColor: MaterialStateProperty.all(AppColors.green),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text('Yes'),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(300, 45)),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xffE8F8EF)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.green),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        );
      },
    );
  }
}
