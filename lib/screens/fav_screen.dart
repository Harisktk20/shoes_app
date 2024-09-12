import 'package:flutter/material.dart';
import 'package:showes_app/widget/onboardpages_model.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

//bool isFavIcon = true;

class _FavScreenState extends State<FavScreen> {
  //Map<int, bool> isFav = {};

  List<OnBoardingModel> favData = [
    OnBoardingModel(
      
     myColor: Color.fromRGBO(253, 255, 167, 1),
     circleColor: Color.fromRGBO(108, 207, 192, 1),
        subtitle1: "\$57.7",
        subtitle2: "",
        image: "assets/images/nike_image2.png",
        text: "Best Seller",
        title: "Nike Jordan"),
    OnBoardingModel(
      myColor: Color(0xFF92CAFF),
      circleColor:Color(0xFF656B7E) ,
        subtitle1: "\$30.8",
        subtitle2: "",
        image: "assets/images/nike_image1.png",
        text: "Best Seller",
        title: "Nike Air Max"),
    OnBoardingModel(
      myColor: Color.fromRGBO(22, 133, 212, 1),
      circleColor:Color.fromRGBO(246, 201, 84, 1) ,
        subtitle1: "\$47.7",
        subtitle2: "",
        image: "assets/images/tick_img.png",
        text: "Best Seller",
        title: "Nike Club Max"),
    OnBoardingModel(
      myColor: Color.fromRGBO(125, 219, 218, 1),
      circleColor:Color.fromRGBO(96, 106, 203, 1) ,
        subtitle1: "\$57.6",
        subtitle2: "",
        image: "assets/images/fav_img1.png",
        text: "Best Seller",
        title: "Nike Club Max"),
  ];
  // @override
  // void initState() {
  //   super.initState();
  //   for (int index = 0; index < favData.length; index++) {
  //     isFav[index] = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAFA),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    )),
                const Text(
                  "Favourite",
                  style: TextStyle(fontSize: 16),
                ),
                const Icon(Icons.favorite_border_rounded)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: favData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 220),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  favData[index].seletedindex =
                                      !favData[index].seletedindex;
                                });
                              },
                              icon: favData[index].seletedindex
                                  ? const Icon(Icons.favorite_outline_sharp)
                                  : const Icon(
                                      Icons.favorite_outlined,
                                      color: Colors.red,
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Image.asset(
                              favData[index].image,
                              height: 90,
                              width: 130,
                            ),
                          ),
                          Text(
                            favData[index].text,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.blue),
                          ),
                          Text(
                            favData[index].title,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                favData[index].subtitle1,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 70,),
                              Icon(Icons.circle,color: favData[index].myColor,),
                               SizedBox(width: 10,),
                              Icon(Icons.circle,color: favData[index].circleColor,)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
