import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helia/bloc/home/cubit/homecubit_cubit.dart';
import 'package:helia/core/app_colors.dart';
import 'package:helia/core/app_text_style.dart';
import 'package:helia/screen/recenty_booked/recenty_booked.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomecubitCubit homecubitCubit = HomecubitCubit();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomecubitCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Color(0xff20BF63), Color(0xff35DB7B)],
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Helia",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.4)),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {
                            homecubitCubit.insertData();
                          },
                          icon: const Icon(Icons.notifications)),
                      IconButton(
                          onPressed: () {
                            homecubitCubit.getData();
                          },
                          icon: const Icon(Icons.bookmark))
                    ],
                  ),
                ),
                Text("Hello, Daniel", style: AppTextStyles.title),
                const SizedBox(
                  height: 20,
                ),
                searchBox(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  color: const Color(0xffE7F6FF),
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      categoryContainer(title: "Recomended", index: 1),
                      categoryContainer(title: "Popular", index: 2),
                      categoryContainer(title: "Trending", index: 3),
                      categoryContainer(title: "Recent", index: 4)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  color: const Color(0xffE7F6FF),
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [carouselCard(), carouselCard(), carouselCard()],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Recently Booked",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: .4,
                          fontSize: 16),
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const RecentlyBooked())),
                        child: const Text("See all"))
                  ],
                ),
                hotelTile(),
                hotelTile(),
                hotelTile(),
                hotelTile(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget carouselCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: const [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "4",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.green,
                ),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Text(
            "Emeralda De Hotel",
            style: TextStyle(
                fontSize: 18,
                letterSpacing: .4,
                color: AppColors.white,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Paris, France",
            style: TextStyle(
                fontSize: 14,
                letterSpacing: .4,
                color: AppColors.white,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                "\$ 29",
                style: TextStyle(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ),
              const Text("/ night"),
              const Expanded(child: SizedBox()),
              IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark))
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          opacity: .7,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10000319-915392dee9000d9272e375167ad81131.jpeg?_src=imagekit&tr=dpr-2,c-at_max,h-360,q-40,w-640'),
        ),
      ),
    );
  }

  Widget categoryContainer({required String title, required int index}) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: .2,
            color: AppColors.white),
      )),
    );
  }

  Widget searchBox() {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.search),
              SizedBox(width: 10),
              Text("Search"),
            ],
          ),
          const Expanded(child: SizedBox()),
          const Icon(Icons.settings)
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey[200],
      ),
    );
  }

  Widget hotelTile() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              image: const DecorationImage(
                  opacity: .8,
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/10000319-915392dee9000d9272e375167ad81131.jpeg?_src=imagekit&tr=dpr-2,c-at_max,h-360,q-40,w-640')),
            ),
            child: const SizedBox(),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "President Hotel",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text(
                "Paris, France",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Row(
                children: const [
                  Icon(Icons.star, size: 16, color: Colors.orange),
                  Text(
                    "4.5",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    "(4738 review )",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  )
                ],
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$35",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green),
              ),
              const Text("/ night"),
              IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark))
            ],
          )
        ],
      ),
    );
  }


}
