import 'package:calculator/constants/constant_colors.dart';
import 'package:calculator/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();
}
class _CalculatorState extends State<Calculator> {
  // vars
  bool isDark =true;
  String _operation='';
  String _result='';
  // functions
  clear(){
    setState(() {
      if (_operation != null && _operation.length > 0) {
        _operation = _operation.substring(0, _operation.length - 1);
      }
    });
  }
  clearAll(){
    setState(() {
      _result='';
      _operation='';
    });
  }
  clickButton(String string){
    setState(() {
      _operation+=string;
    });
  }
  value(){
    Parser p=Parser();
    Expression expression=p.parse(_operation);
    ContextModel contextModel=ContextModel();
    setState(() {
      _result=_operation;
      _operation=expression.evaluate(EvaluationType.REAL, contextModel).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:isDark? KheadColor:KheadColor2,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isDark?KbodyColor2.withOpacity(.6):KbodyColor.withOpacity(.6),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Switch(
                  activeColor: KbodyColor,
                  onChanged: (v){
                    setState(() {
                      isDark=v;
                    });
                  },
                  value: isDark,
                ),

              ),
             Spacer(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _result,
                    style: TextStyle(
                        fontSize: 24,
                        color: isDark?KtxtColor:Color(0xff3C4043),
                      ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _operation,
                    style:  TextStyle(
                        fontSize: 48,
                        color: isDark?KtxtColor:KtxtColor2,
                      ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color:isDark? KbodyColor:KbodyColor2,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcButton(
                          size: 55,
                          text: 'AC',
                          isDark: isDark,
                          type: 2,
                          textSize: 25,
                          callback: ()=>clearAll(),
                        ),
                        CalcButton(
                          size: 55,
                          text: 'Del',
                          isDark: isDark,
                          type: 2,
                          textSize: 25,
                          callback: ()=>clear(),
                        ),
                        CalcButton(
                          size: 55,
                          text: '%',
                          isDark: isDark,
                          type: 3,
                          textSize: 30,
                          callback: () =>clickButton('%'),
                        ),
                        CalcButton(
                          isDark: isDark,
                          type: 2,
                          size: 60,
                          text: '(',
                          textSize: 35,
                          callback: () =>clickButton("("),
                        ),
                        CalcButton(
                          size: 60,
                          text: ')',
                          isDark: isDark,
                          type: 2,
                          textSize: 35,
                          callback: () =>clickButton(")"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcButton(
                          text: '7',
                          isDark: isDark,
                          type: 0,
                          textSize: 30,
                          callback: () =>clickButton("7"),
                        ),
                        CalcButton(
                          text: '8',
                          isDark: isDark,
                          type: 0,
                          textSize: 30,
                          callback: () =>clickButton("8"),
                        ),
                        CalcButton(
                          text: '9',
                          isDark: isDark,
                          type: 0,
                          textSize: 30,
                          callback: () =>clickButton("9"),
                        ),
                        CalcButton(
                          text: '/',
                          isDark: isDark,
                          type: 1,
                          textSize: 35,
                          callback: () =>clickButton("/"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcButton(
                          text: '4',
                          isDark: isDark,
                          type: 0,
                          textSize: 30,
                          callback: () =>clickButton("4"),
                        ),
                        CalcButton(
                          text: '5',
                          isDark: isDark,
                          type: 0,
                          textSize: 30,
                          callback: () =>clickButton("5"),
                        ),
                        CalcButton(
                          text: '6',
                          isDark: isDark,
                          type: 0,
                          textSize: 30,
                          callback: () =>clickButton("6"),
                        ),
                        CalcButton(
                          text: 'x',
                          isDark: isDark,
                          type: 1,
                          textSize: 35,
                          callback: () =>clickButton("*"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalcButton(
                          isDark: isDark,
                          type: 0,
                          text: '1',
                          textSize: 30,
                          callback: () =>clickButton("1"),
                        ),
                        CalcButton(
                          isDark: isDark,
                          type: 0,
                          text: '2',
                          textSize: 30,
                          callback: () =>clickButton("2"),
                        ),
                        CalcButton(
                          isDark: isDark,
                          type: 0,
                          text: '3',
                          textSize: 30,
                          callback: () =>clickButton("3"),
                        ),
                        CalcButton(
                          isDark: isDark,
                          type: 1,
                          text: '-',
                          textSize: 35,
                          callback: () =>clickButton("-"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        CalcButton(
                          isDark: isDark,
                          type: 0,
                          text: '0',
                          textSize: 30,
                          callback: () =>clickButton("0"),
                        ),
                        CalcButton(
                          isDark: isDark,
                          type: 0,
                          text: '.',
                          textSize: 30,
                          callback: () =>clickButton("."),
                        ),
                        CalcButton(
                          isDark: isDark,
                          type: 1,
                          text: '=',
                          textSize: 40,
                          callback: ()=>value(),
                        ),
                        CalcButton(
                          isDark: isDark,
                          type: 1,
                          text: '+',
                          textSize: 35,
                          callback: () =>clickButton("+"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
