// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:dojeapp/model/model_quiz.dart';
import 'package:dojeapp/screen/screen_home.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {

  List<int> answers;
  List<Quiz> quizs;
  ResultScreen({required this.answers, required this.quizs});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for(int i = 0; i < quizs.length; i++) {
      if(quizs[i].answer == answers[i]) {
        score += 1;
      }
    }
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: 
          Container(
            width: width * 0.85,
            height: height * 0.6,
            child: Column(
              children: <Widget>[
                Lottie.asset(
                  'assets/check.json',
                  width: width * 0.3,
                  repeat: false,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: width * 0.048),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 46, 46, 89),
                  ),
                  width: width * 0.73,
                  height: height * 0.25,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          0, width * 0.048, 0, width * 0.012
                        ),
                        child: Text(
                          '수고하셨습니다.',
                          style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '당신의 점수는..',
                        style: TextStyle(
                          fontSize: width * 0.048,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        score.toString() + '/' + quizs.length.toString(),
                        style: TextStyle(
                          fontSize: width * 0.21,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 254, 242, 134),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: width * 0.048),
                  child: ButtonTheme(
                    minWidth: width * 0.73,
                    height: height * 0.05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) {
                            return HomeScreen();
                          }));
                      },
                      child: Text('홈으로 돌아가기'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}