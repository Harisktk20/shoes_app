import 'package:flutter/material.dart';
import 'package:showes_app/screens/store_grid_data.dart';
import 'package:showes_app/widget/custom_textfield.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAFA),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 10, right: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(Icons.dashboard_outlined)),
                //  SizedBox(width: 80,),
                const Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Store location",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "Mondolibug, Sylhet",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Icon(Icons.shopping_bag)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomTextField(
                  hinttext: "Looking for Shoes",
                  keboard: TextInputType.text,
                  sufex: const Icon(Icons.search)),
            ),
            TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //shape: BoxShape.circle,
                  color: Colors.blue),
              controller: tabController,
              physics: const BouncingScrollPhysics(),
              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
              labelStyle: const TextStyle(fontSize: 14),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/nike.png",
                            ),
                            scale: 1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const Text("Nike"),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/puma.png",
                        ),
                        scale: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
               StoreData(),
                const Icon(Icons.email),
              ]),
            )
          ],
        ),
        
      ),
    );
  }
}
