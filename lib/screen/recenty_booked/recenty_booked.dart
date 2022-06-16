import 'package:flutter/material.dart';
import 'package:helia/core/app_colors.dart';
import 'package:helia/core/app_widget.dart';

class RecentlyBooked extends StatefulWidget {
  const RecentlyBooked({Key? key}) : super(key: key);

  @override
  State<RecentlyBooked> createState() => _RecentlyBookedState();
}

class _RecentlyBookedState extends State<RecentlyBooked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left)),
            title: const Text('Recently Booked'),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.view_list_rounded,
                    color: AppColors.green,
                  )),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.grid_view_rounded)),
            ]),
        body: Column(
          children: [
            AppWidget.hotelTile(),
            AppWidget.hotelTile(),
            AppWidget.hotelTile(),
            AppWidget.hotelTile()
          ],
        ));
  }
}
