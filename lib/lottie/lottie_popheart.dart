// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings

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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    if (_timeValue > _thresholdValue) {
                      _timeValue -= 0.1;
                      _lottieController.duration = Duration(milliseconds: (_timeValue * 1000).round());
                      _lottieController.forward(from: _lottieController.value); // 현재 진행 상태부터 시작
                      _lottieController.repeat();
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LottieResultScreen(),
                        ),
                      );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
