import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helia/core/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              searchBox(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryContainer(title: "All Hotel", index: 1),
                    categoryContainer(title: "Recomended", index: 2),
                    categoryContainer(title: "Popular", index: 3),
                    categoryContainer(title: "Recent", index: 4)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    "Recomended (637 Hotels)",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .9),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.view_list_rounded,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.grid_view_rounded)
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 7,
                itemBuilder: ((context, index) {
                  return hotelTile();
                }),
              )
            ],
          )),
    );
  }

  Widget searchBox() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            child: Row(
              children: const [
                FaIcon(FontAwesomeIcons.magnifyingGlass),
                SizedBox(
                  width: 20,
                ),
                Text("Search"),
                Expanded(child: SizedBox()),
                Icon(Icons.tune_rounded)
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]),
          ),
        ),
      ],
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
