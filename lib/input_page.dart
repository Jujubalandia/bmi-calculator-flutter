import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'costants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var _selectGender;
  int _height = 180;
  int _weight = 79;
  int _age = 21;

  void selectGender(Gender g) => setState(() => _selectGender = g);
  void addWeight(int i) => setState(() => _weight = _weight + i);
  void removeWeight(int i) => setState(() => _weight = _weight - i);
  void addAge(int i) => setState(() => _age = _age + i);
  void removeAge(int i) => setState(() => _age = _age - i);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () => selectGender(Gender.male),
                    colour: _selectGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColor,
                    cardChild: new CardContent(
                      iconType: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () => selectGender(Gender.female),
                    colour: _selectGender == Gender.male
                        ? kInactiveCardColor
                        : kActiveCardColour,
                    cardChild: new CardContent(
                      iconType: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              _height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x29EB1555),
                            thumbColor: Color(0xFFEB1555),
                          ),
                          child: Slider(
                            value: _height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              print(newValue);
                              setState(() {
                                _height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => addWeight(1),
                              onLongPress: () => addWeight(10), 
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => removeWeight(1),
                              onLongPress: () => removeWeight(10), 
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => addAge(1),
                              onLongPress: () => addAge(10), 
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => removeAge(1),
                              onLongPress: () => removeAge(10), 
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Function onLongPress;

  RoundIconButton(
      {@required this.icon,
      @required this.onPressed,
      @required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress: onLongPress,
      child: RawMaterialButton(
        child: Icon(icon),
        onPressed: onPressed,
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
      ),
    );
  }
}
