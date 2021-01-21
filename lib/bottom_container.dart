import 'package:flutter/cupertino.dart';
import 'constance.dart';

const bottomContainerHeight = 75.0;

class BottomContainer extends StatelessWidget {

  final String text;

  BottomContainer({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(this.text, style: FontStyle.kBottomContainerTextStyle,)),
      color: ColorClass.kBottomContainerColor,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: bottomContainerHeight,
    );
  }
}