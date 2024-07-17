// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/material.dart';
import 'package:dojeapp/model/model_quiz.dart';
import 'package:dojeapp/screen/screen_quiz.dart';
import 'package:dojeapp/screen/screen_anim.dart';
import 'package:dojeapp/model/model_anim.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Quiz> quizs = [
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'test',
      'candidates' : ['a', 'b', 'c', 'd'],
      'answer' : 0
    }),
  ];

  List<Anim> anims = [
    Anim.fromMap({
      'title' : '원하시는 캐릭터를 선택해주세요.',
      'value' : ['팡하트', '여우', '찐핑', '연핑', '망치', '요가', '꼬부기']
    }),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙에 컬럼 배치
          crossAxisAlignment: CrossAxisAlignment.center, // 중앙에 컬럼 배치
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/sangilLogo.png', 
                width: width * 0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              '도제 퀴즈 앱',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '안녕하세요. 반갑습니다. \n 도제에 오신 걸 진심으로 환영합니다.',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.018),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 46, 46, 89),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      '지금 퀴즈 풀기',
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            quizs: quizs,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 119, 142, 89),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      '스트레스 풀러 가기',
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimScreen(
                            anims: anims,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}