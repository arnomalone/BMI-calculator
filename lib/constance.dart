import 'package:flutter/cupertino.dart';

class ColorClass
{
  static const kActiveCardColor = Color(0xFF1D1E33);
  static const kBackgroundColor = Color(0xFF0A0E21);
  static const kBottomContainerColor = Color(0xFFEB1555);
  static const kInactiveCardColor = Color(0xFF111328);
  static const kFontColor = Color(0xFF8D8E98);
  static const kTranslucentBottomContainerColor = Color(0x29EB1555);
}

class FontStyle
{
  static const kTextStyle = TextStyle(
  fontSize: 18.0,
  color: ColorClass.kFontColor,
  );

  static const kMediumTextStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w900,
  );

  static const kBigTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  );

  static const kBottomContainerTextStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
  );

  static const kResultTextStyle = TextStyle(
    color: Color(0xFF24D876),
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  static const kBMITextStyle = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
  );

  static const kResultBodyTextStyle = TextStyle(
    fontSize: 22.0,
  );
}