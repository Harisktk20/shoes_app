import 'package:flutter/material.dart';
import 'package:showes_app/screens/onboarding_screen1.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),(){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
         return OnBoardingScreen();
        }));
      }
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/splash_img.jpg"))
        ),
        child:Center(child: Text("OXY BOOTS",style: TextStyle(color: Colors.white),))
      ),
    );
  }
}
