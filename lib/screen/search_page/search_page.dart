import 'package:flutter/material.dart';
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
                height: 55,
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
            height: 48,
            child: Row(
              children: [
                const Icon(Icons.search_rounded),
                const SizedBox(
                  width: 20,
                ),
                const Text("Search"),
                const Expanded(child: SizedBox()),
                IconButton(
                    icon: const Icon(Icons.tune_rounded),
                    onPressed: () {
                      showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35),
                            ),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35),
                                  )),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text('Modal BottomSheet'),
                                    ElevatedButton(
                                      child: const Text('Close BottomSheet'),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    })
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200]),
          ),
        ),
      ],
    );
  }

  Widget categoryContainer({required String title, required int index}) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: index == 1 ? AppColors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.green, width: 1.5),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: .2,
            color: index == 1 ? AppColors.white : AppColors.green),
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
        color: Colors.grey[100],
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                "Paris, France",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              Row(
                children: const [
                  Icon(Icons.star, size: 16, color: Colors.orange),
                  Text(
                    "4.5",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    " (4738 review )",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
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
              const Text(
                "/ night",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    letterSpacing: .7),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark))
            ],
          )
        ],
      ),
    );
  }
}
