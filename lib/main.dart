
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {

  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons =
  
  [
      ('C'),
      ('DEL'), 
      ('%'), 
      ('/'),
      ('9'), 
      ('8'),
      ('7'), 
      ('x'),
      ('6'), 
      ('5'),
      ('4'), 
      ('-'),
      ('3'), 
      ('2'), 
      ('1'), 
      ('+'),
      ('0'), 
      ('00'),
      ('.'), 
      ('='),
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 7, 7), // target background color
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(userQuestion, style:const  TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(userAnswer, style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            ),
          Expanded(
            flex: 2,
            child: 
             GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (BuildContext constext, int index) {
              // Clear button
                if(index == 0) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      userQuestion = '';
                      userAnswer = '';
                    });
                  },
                  buttonText: buttons[index],
                  color: Colors.green, // target color
                  textColor: Colors.white, // target textcolor
                );
              } 
              // Delete button
              else if (index == 1) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
                    });
                  },
                  buttonText: buttons[index],
                  color: Colors.red, // target color
                  textColor: Colors.white, // target textcolor
                );
              } 
              // Equal button
              else if (index == buttons.length - 1) {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      eqaulPressed();
                    });
                  },
                  buttonText: buttons[index],
                  
                  color: const Color.fromARGB(255, 159, 157, 157), // target color
                  textColor: Colors.black, // target textcolor
                );
              } 
              // Rest of the buttons
              else {
                return MyButton(
                  buttonTapped: () {
                    setState(() {
                      userQuestion += buttons[index];
                    });
                  },
                  buttonText: buttons[index],
                  color: isOperator(buttons[index]) ? const Color.fromARGB(255, 163, 160, 160) : const Color.fromARGB(255, 34, 32, 32), // target color
                  textColor: isOperator(buttons[index]) ? Colors.black : Colors.white, // target textcolor
                );
              }
              },
            ), 
          ),
        ],
      
      ),
    );
  }
  bool isOperator(String x) {
    if(x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void eqaulPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('%', '/100');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
