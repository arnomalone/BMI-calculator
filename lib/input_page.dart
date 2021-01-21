import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constance.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'bottom_container.dart';
import 'calculator.dart';

enum Gender  {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = ColorClass.kInactiveCardColor;
  Color femaleCardColor = ColorClass.kInactiveCardColor;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(
            child: Text('BMI CALCULATOR')
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: selectedGender==Gender.male ? ColorClass.kActiveCardColor : ColorClass.kInactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, text: 'MALE',),
                    onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender==Gender.female ? ColorClass.kActiveCardColor : ColorClass.kInactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, text: 'FEMALE',
                    ),
                  ),

                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: ColorClass.kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('HEIGHT', style: FontStyle.kTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: FontStyle.kBigTextStyle,
                    ),
                    Text(
                      'cm',
                      style: FontStyle.kTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: ColorClass.kBackgroundColor,
                      thumbColor: ColorClass.kBottomContainerColor,
                      overlayColor: ColorClass.kTranslucentBottomContainerColor,
                      // trackHeight: 2.5,
                      thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                    ),
                      overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 30.0,
                    )
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ReusableCard(colour: ColorClass.kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT', style: FontStyle.kTextStyle,),
                    Text(weight.toString(), style: FontStyle.kBigTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),),
              ),
              Expanded(
                child: ReusableCard(colour: ColorClass.kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: FontStyle.kTextStyle,),
                      Text(age.toString(), style: FontStyle.kBigTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if(age>18) age--;
                                if(age<18) age=18;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),),

              ),
            ],
          ),
          ),
         GestureDetector(
           onTap: () {

             Calculator calc = Calculator(height: height, weight: weight);
             calc.calculateBMI();

             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => ResultPage(result: calc.getResult(), bmi: calc.getBMI(), statement: calc.getInterpretation(),))
             );
           },
           child: BottomContainer(text: 'CALCULATE',),
         )
        ],
      )
    );
  }
}




class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: this.onPressed,
      elevation: 0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: ColorClass.kFontColor,
      child: Icon(this.icon, color: ColorClass.kBackgroundColor),
    );
  }
}


