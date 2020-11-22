import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black12),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(fontSize: 40.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: KeyRowForCalculator("AC", "+/-", "%", "/")),
              Expanded(child: KeyRowForCalculator("7", "8", "9", "*")),
              Expanded(child: KeyRowForCalculator("4", "5", "6", "-")),
              Expanded(child: KeyRowForCalculator("1", "2", "3", "+")),
              Expanded(child: KeyRowForCalculator("0", "", ".", "=")),
            ],
          ),
        ));
  }
}

class KeyRowForCalculator extends StatefulWidget {
  final String button1;
  final String button2;
  final String button3;
  final String button4;
  final double height = 120;
  final double buttonFontSize = 20.0;
  KeyRowForCalculator(this.button1, this.button2, this.button3, this.button4,
      {Key key})
      : super(key: key);

  @override
  _KeyRowForCalculatorState createState() => _KeyRowForCalculatorState();
}

class _KeyRowForCalculatorState extends State<KeyRowForCalculator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FlatButton(
            height: widget.height,
            child: Text(
              "${widget.button1}",
              style: TextStyle(fontSize: widget.buttonFontSize),
            ),
            onPressed: () {
              print("pressed ${widget.button1}");
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            height: widget.height,
            child: Text(
              "${widget.button2}",
              style: TextStyle(fontSize: widget.buttonFontSize),
            ),
            onPressed: widget.button2.isEmpty
                ? null
                : () {
                    print("pressed ${widget.button2}");
                  },
          ),
        ),
        Expanded(
          child: FlatButton(
            height: widget.height,
            child: Text(
              "${widget.button3}",
              style: TextStyle(fontSize: widget.buttonFontSize),
            ),
            onPressed: () {
              print("pressed ${widget.button3}");
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            height: widget.height,
            child: Text(
              "${widget.button4}",
              style: TextStyle(fontSize: widget.buttonFontSize),
            ),
            onPressed: () {
              print("pressed ${widget.button4}");
            },
          ),
        )
      ],
    );
  }
}
