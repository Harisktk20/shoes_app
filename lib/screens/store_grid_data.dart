import 'package:flutter/material.dart';

import '../widget/onboardpages_model.dart';

class StoreData extends StatefulWidget {
  const StoreData({super.key});

  @override
  State<StoreData> createState() => _StoreDataState();
}

class _StoreDataState extends State<StoreData> {
    List<OnBoardingModel> nikeData = [
    OnBoardingModel(
        subtitle1: "\$493.00",
        subtitle2: "subtitle2",
        image: "assets/images/nike_image2.png",
        text: "Best Seller",
        title: "Nike Jordan"),
    OnBoardingModel(
        subtitle1: "\$897.99",
        subtitle2: "subtitle2",
        image: "assets/images/nike_image1.png",
        text: "Best Seller",
        title: "Nike Air Max"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular Shoes",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "See All",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 220.0),
                        itemCount: nikeData.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Image.asset(
                                    nikeData[index].image,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    nikeData[index].text,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.blue),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    nikeData[index].title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        nikeData[index].subtitle1,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 33,
                                      width: 35,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          color: Colors.blue),
                                          child: IconButton(
                                            onPressed: () {
                                       
                                            },
                                          icon: const Icon(Icons.add,color: Colors.white,)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Arrivals",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "See All",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 130,
                        width: 400,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Best Choice",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.blue),
                                    ),
                                    Text(
                                      "Nike Air Jordan",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("\$849.69"),
                                  ],
                                ),
                              ),
                              Image.asset(
                                "assets/images/tick_img.png",
                                height: 1000,
                                width: 150,
                                //scale: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}
