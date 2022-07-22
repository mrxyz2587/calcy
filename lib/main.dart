import 'package:flutter/material.dart';
import 'package:calcy/buttons.dart';

void main() {
  runApp(MyCalcyApp());
}

class MyCalcyApp extends StatefulWidget {
  const MyCalcyApp({Key? key}) : super(key: key);

  @override
  State<MyCalcyApp> createState() => _MyCalcyAppState();
}

class _MyCalcyAppState extends State<MyCalcyApp> {
  String textToDisplay = '';
  String hist = "";
  String res = "";
  int firstNumber = 0;
  int secondNumb = 0;
  String operation = "";
  void onButtonCLick(String btnValue) {
    print(btnValue);

    if (btnValue == "AC") {
      textToDisplay = "";
      hist = "";
      firstNumber = 0;
      secondNumb = 0;
      res = "";
    } else if (btnValue == "👈👈") {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnValue == "+/-") {
      if (textToDisplay[0] != "-") {
        res = "-" + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnValue == "C") {
      textToDisplay = "";
      firstNumber = 0;
      secondNumb = 0;
      res = "";
    } else if (btnValue == "+" ||
        btnValue == "-" ||
        btnValue == "X" ||
        btnValue == "%") {
      firstNumber = int.parse(textToDisplay);
      operation = btnValue;
      res = "";
    } else if (btnValue == "=") {
      secondNumb = int.parse(textToDisplay);
      if (operation == "+") {
        res = (firstNumber + secondNumb).toString();
        hist = firstNumber.toString() +
            operation.toString() +
            secondNumb.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnValue).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(backgroundColor: Colors.black26),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'CALCULATOR APP',
          ),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 30,
                color: Colors.white,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                hist,
                style: TextStyle(fontSize: 25, color: Colors.white70),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textToDisplay,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Divider(
              color: Colors.orange,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  colour: Colors.red,
                  btnText: 'AC',
                  calBack: onButtonCLick,
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: 'C',
                  calBack: onButtonCLick,
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: '%',
                  calBack: onButtonCLick,
                ),
                Buttons(
                  colour: Colors.red,
                  calBack: onButtonCLick,
                  btnText: 'X',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  colour: Colors.red,
                  calBack: onButtonCLick,
                  btnText: '1',
                ),
                Buttons(
                  colour: Colors.red,
                  calBack: onButtonCLick,
                  btnText: '2',
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: '3',
                  calBack: onButtonCLick,
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: '+',
                  calBack: onButtonCLick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  colour: Colors.red,
                  btnText: '4',
                  calBack: onButtonCLick,
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: '5',
                  calBack: onButtonCLick,
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: '6',
                  calBack: onButtonCLick,
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: '-',
                  calBack: onButtonCLick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  colour: Colors.red,
                  calBack: onButtonCLick,
                  btnText: '7',
                ),
                Buttons(
                  colour: Colors.red,
                  calBack: onButtonCLick,
                  btnText: '8',
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: '9',
                  calBack: onButtonCLick,
                ),
                Buttons(
                  colour: Colors.red,
                  btnText: '=',
                  calBack: onButtonCLick,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Buttons(
                    colour: Colors.yellow,
                    btnText: "👈👈",
                    calBack: onButtonCLick),
                Buttons(
                    colour: Colors.yellow,
                    btnText: "+/-",
                    calBack: onButtonCLick)
              ],
            )
          ],
        ),
      ),
    );
  }
}
