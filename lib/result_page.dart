import 'package:flutter/material.dart';
import 'constance.dart';
import 'reusable_card.dart';
import 'bottom_container.dart';

class ResultPage extends StatelessWidget {

  final String result;
  final String bmi;
  final String statement;

  ResultPage({@required this.result, @required this.bmi, @required this.statement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text('Your Result', style: FontStyle.kTitleTextStyle,)
              )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: ColorClass.kActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(result.toUpperCase(), style: FontStyle.kResultTextStyle,),
                  Text(bmi, style: FontStyle.kBMITextStyle,),
                  Text(statement, style: FontStyle.kResultBodyTextStyle, textAlign: TextAlign.center,)
                ],
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: BottomContainer(text: 'RE-CALCULATE'),
          ),
        ],
      )
    );

  }
}