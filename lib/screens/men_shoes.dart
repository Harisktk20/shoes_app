import 'package:flutter/material.dart';

import '../widget/onboardpages_model.dart';

class MenShoesScreen extends StatefulWidget {
  const MenShoesScreen({super.key});

  @override
  State<MenShoesScreen> createState() => _MenShoesScreenState();
}

class _MenShoesScreenState extends State<MenShoesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAFA),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 20, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ),
                Text(
                  "Men's Shoes",
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.shopping_bag_outlined)
              ],
            ),
            Image.asset("assets/images/nike_image1.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Best Seller",
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              "Nike Air Jordan",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "\$967.800",
              style: TextStyle(fontSize: 20),
            ),
            Text("Air Jordan is an American brand of basketball shoes athletic, casual, and style clothing produced by Nike....")
          ],
        ),
      ),
    );
  }
}
