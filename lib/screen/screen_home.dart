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
      'title' : '자바의 출력 장치에 해당하는 것은?',
      'candidates' : ['println()', 'cook()', 'pupu()', 'spring()'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : '반복문이란?',
      'candidates' : ['특정 구조의 반복', '새로고침', '오류', '게임'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : '연산자의 종류가 아닌 것은?',
      'candidates' : ['비교', '산술', '논쟁', '대입'],
      'answer' : 2
    }),
    Quiz.fromMap({
      'title' : '자료형이 아닌 것은?',
      'candidates' : ['int', 'String', 'frame', 'double'],
      'answer' : 2
    }),
    Quiz.fromMap({
      'title' : '함수 선언 방식으로 옳은 것은?',
      'candidates' : ['*mtd*;', 'mtd();', 'mtd[];', 'mtd{};'],
      'answer' : 1
    }),
    Quiz.fromMap({
      'title' : '클라이언트의 요청 정보를 저장하는 내장 객체는?',
      'candidates' : ['response(응답)', 'animal(동물)', 'present(선물)', 'request(요청)'],
      'answer' : 3
    }),
    Quiz.fromMap({
      'title' : '숫자 1과 같은 뜻을 가지는 boolean 값은?',
      'candidates' : ['true', 'tree', 'boolone', 'onelean'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : '예외가 발생한 경우 사용하는 내장객체는?',
      'candidates' : ['error', 'isEnd', 'exception', 'other'],
      'answer' : 2
    }),
    Quiz.fromMap({
      'title' : 'SQL에서 테이블을 만드는 DDL 명령어는?',
      'candidates' : ['CREATE(생성)', 'ALTER(변경)', 'DROP(삭제)', 'ADD(추가)'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : 'SQL에서 정보를 검색하는 DML 명령어는?',
      'candidates' : ['SEARCH(검색)', 'INSERT(추가)', 'DELETE(삭제)', 'SELECT(검색)'],
      'answer' : 3
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
        backgroundColor: Colors.white,
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
              '안녕하세요. 반갑습니다. \n 도제반에 오신 걸 진심으로 환영합니다.',
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