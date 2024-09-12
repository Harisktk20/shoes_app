import 'package:flutter/material.dart';
import 'package:showes_app/screens/login_screen.dart';
import 'package:showes_app/widget/custom_button.dart';
import 'package:showes_app/widget/onboardpages_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  List<OnBoardingModel> onboarding = [
    OnBoardingModel(
        image: "assets/images/sketche.png",
        title: "With Nike",
        text: "Start Journey",
        subtitle1: "Smart, Gorgeous & Fashionable",
        subtitle2: "Collection"),
    OnBoardingModel(
        image: "assets/images/sketche2.png",
        title: "Styles Showes",
        text: "Follow latest",
        subtitle1: "There Are Many Beautiful And",
        subtitle2: "Attractive Plants To Your Room"),
    OnBoardingModel(
        image: "assets/images/sketche3.png",
        title: "Nikes 2022",
        text: "Summer Shoes",
        subtitle1: "Amet Minim Lit Nodeseru Saku",
        subtitle2: "Nandu sit Alique Dolor")
  ];
  bool secondButton = false;
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Onboard-1.jpg"),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Container(
                height: 700,
                child: PageView.builder(
                  physics:secondButton? const BouncingScrollPhysics():const NeverScrollableScrollPhysics(),
                  controller: controller,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: onboarding.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Image.asset(
                          onboarding[index].image,
                          width: 370,
                          height: MediaQuery.of(context).size.height * 0.4,
                          fit: 
                          BoxFit.contain,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            onboarding[index].text,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            onboarding[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            onboarding[index].subtitle1,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff707B81),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                            onboarding[index].subtitle2,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff707B81),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  onPageChanged: (index){
                    setState(() {
                      index=index;
                      print("index is $index");
                    });
                  },
                ),
              ),
              Container(
                height: 130,
               // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    secondButton
                     
                        ? SmoothPageIndicator(
                            effect: const WormEffect(dotHeight: 10, dotWidth: 20),
                            controller: controller,
                            count: 3,
                          )
                        : const SizedBox(),
                    secondButton
                        ? CustomButton(name: "Next",
                        onTap: () {
                          controller.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
                          controller.page==2? Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                              return const LoginScreen();
                             })):null;
                         
                        },)
                        : CustomButton(
                            name: "Get Starded",
                            onTap: () {
                              secondButton = true;
                              setState(() {});
                            },
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
