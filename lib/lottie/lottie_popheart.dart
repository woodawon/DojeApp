// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieTest extends StatefulWidget {
  List<bool> answerState;
  LottieTest({required this.answerState});
  @override
  State<LottieTest> createState() => _LottieTestState();
}

class _LottieTestState extends State<LottieTest> with TickerProviderStateMixin {

  late final AnimationController _lottieController;
  double _timeValue = 5;
  double _addValue = 1;

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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  if(_timeValue != 0) {
                    _timeValue = _timeValue - 1;
                  } else {
                    for(int i = 0; i < _addValue; i++) {
                      _timeValue = _timeValue * 0.1;
                    }
                    _addValue = _addValue + 1;
                  }
                },
                child: 
                  Lottie.asset(
                      'assets/popheart.json',
                      repeat: true,
                      animate: true,
                      controller: _lottieController,
                      onLoaded: (composition) {
                      _lottieController.duration = composition.duration * _timeValue;
                      _lottieController.repeat(
                      min: 0,
                      max: 1,
                      );
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