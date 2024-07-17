// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:dojeapp/screen/screen_lottie_result.dart';

class LottieTest extends StatefulWidget {
  List<bool> answerState;
  LottieTest({required this.answerState});
  @override
  State<LottieTest> createState() => _LottieTestState();
}

class _LottieTestState extends State<LottieTest> with TickerProviderStateMixin {
  late final AnimationController _lottieController;
  double _timeValue = 5;
  final double _thresholdValue = 0.5; // 속도가 충분히 빨라졌을 때의 값
  final int _maxTouches = 50; // 최대 터치 수
  int _touchCount = 0; // 현재 터치 수
  List<String> _jsonName = [
    'popheart.json',
    'fox.json',
    'hotpink.json',
    'lightpink.json',
    'hammer.json',
    'yoga.json',
    'turtle.json',
  ];
  String _jsonValue = "";

  @override
  void initState() { // 컨트롤러 생성
    _lottieController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() { // 컨트롤러 해제
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.answerState.length; i++) {
      if (widget.answerState[i] == true) {
        _jsonValue = _jsonName[i];
      }
    }

    double progress = _touchCount / _maxTouches;
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 게이지 바
            Container(
              width: width * 0.8,
              height: 20,
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 46, 46, 89), // 확인 버튼과 같은 색상
                  width: 2,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: width * 0.8 * progress,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent, // 연하늘색
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 170), // 게이지 바와 애니메이션 사이의 공간을 더 넓게 설정
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 중앙에 위치하게 조정
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          _touchCount++;
                          if (_touchCount >= _maxTouches) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LottieResultScreen(),
                              ),
                            );
                            return;
                          }

                          if (_timeValue > _thresholdValue) {
                            _timeValue -= 0.1;
                            _lottieController.duration = Duration(milliseconds: (_timeValue * 1000).round());
                            _lottieController.forward(from: _lottieController.value); // 현재 진행 상태부터 시작
                            _lottieController.repeat();
                          }
                        });
                      },
                      child: Lottie.asset(
                        'assets/' + _jsonValue,
                        repeat: true,
                        controller: _lottieController,
                        onLoaded: (composition) {
                          _lottieController.duration = composition.duration * _timeValue;
                          _lottieController.repeat();
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
