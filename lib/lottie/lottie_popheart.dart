// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_field, prefer_final_fields, prefer_interpolation_to_compose_strings

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
  List<String> _jsonName = [
    'popheart.json',
    'heart.json',
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
    for(int i = 0; i < widget.answerState.length; i++) {
      if(widget.answerState[i] == true) {
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
                    if (_timeValue > 0.1) {
                      _timeValue -= 0.1;
                    }
                    _lottieController.duration = Duration(milliseconds: (_timeValue * 1000).round());
                    _lottieController.forward(from: _lottieController.value); // 현재 진행 상태부터 시작
                    _lottieController.repeat();
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