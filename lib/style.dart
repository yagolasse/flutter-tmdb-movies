import 'package:flutter/material.dart';

const LargeTextSize = 22.0;
const MediumLargeTextSize = 20.0;
const MediumTextSize = 14.0;
const SmallTextSize = 12.0;

//const String FontNameDefault = 'Montserrat';

const Color TextColorDark = Colors.black;
const Color TextColorLight = Colors.white;
const Color TextColorAccent = Colors.red;
const Color TextColorFaint = Color.fromRGBO(125, 125, 125, 1.0);

const DefaultPaddingHorizontal = 12.0;

const AppBarTextStyle = TextStyle(
//    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: MediumTextSize,
    color: Colors.white);

const MainTitleTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.white,
  fontSize: MediumLargeTextSize,
//    fontFamily: FontNameDefault,
);

const Display1 = TextStyle(
//    fontFamily: FontNameDefault,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: MediumTextSize);

const Display2 = TextStyle(
//  fontFamily: FontNameDefault,
  color: Colors.blueAccent,
  fontWeight: FontWeight.w300,
  fontSize: SmallTextSize,
);
