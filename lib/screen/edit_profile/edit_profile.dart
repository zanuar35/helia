import 'package:flutter/material.dart';
import 'package:helia/core/app_colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Male';
    String dropdownValue1 = 'United State';
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: ListView(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Full Name",
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2099),
                              ).then((date) {
                                //tambahkan setState dan panggil variabel _dateTime.
                                setState(() {});
                              });
                            },
                            icon: const Icon(Icons.calendar_today)),
                        hintText: "Tanggal Lahir",
                        hintStyle: const TextStyle(fontSize: 14)),
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        suffixIcon: Icon(Icons.email),
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: dropdownValue1,
                    isExpanded: true,
                    icon: const Icon(Icons.expand_more),
                    style: const TextStyle(color: Colors.deepPurple),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                    items: <String>[
                      'United State',
                      'Singapore',
                      'Thailand',
                      'England',
                      'Indonesia'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone number",
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 55,
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: dropdownValue,
                    isExpanded: true,
                    icon: const Icon(Icons.expand_more),
                    style: const TextStyle(color: Colors.deepPurple),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Male', 'Female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child:
                            Text(value, style: const TextStyle(fontSize: 14)),
                      );
                    }).toList(),
                  ),
                )),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 45,
              child: const Center(
                child: Text(
                  "Update",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: .6,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColors.green),
            )
          ],
        ),
      ),
    );
  }
}
