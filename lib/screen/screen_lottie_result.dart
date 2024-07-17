// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'screen_home.dart';

class LottieResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/awesome.json',
              width: width * 0.8,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              '수고하셨습니다!',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width * 0.8, height * 0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color.fromARGB(255, 46, 46, 89),
                foregroundColor: Colors.white,
              ),
              child: Text('홈으로'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
