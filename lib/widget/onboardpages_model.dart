// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class OnBoardingModel {
  Color? myColor;
  Color? circleColor;
  String image;
  bool seletedindex;
  String text;
  String title;
  String subtitle1;
  String subtitle2;
  OnBoardingModel({
    this.circleColor,
     this.myColor,
    this.seletedindex = true,
    required this.subtitle1,
    required this.subtitle2,
    required this.image,
    required this.text,
    required this.title,
  });
}
