// ignore_for_file: prefer_const_constructors, unused_local_variable, library_private_types_in_public_api, use_key_in_widget_constructors, unused_field, prefer_final_fields, must_be_immutable, sized_box_for_whitespace, sort_child_properties_last

import 'package:dojeapp/screen/screen_result.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_swiper_3/flutter_swiper_3.dart';
import 'package:dojeapp/model/model_anim.dart';

class AnimScreen extends StatefulWidget {
  List<Anim> anims;
  AnimScreen({required this.anims});
  @override
  _AnimScreenState createState() => _AnimScreenState();
}

class _AnimScreenState extends State<AnimScreen> {
  
  List<bool> _answerState = [false, false, false, false, false, false, false];
  int _currentIndex = 0;
  SwiperController _controller = SwiperController();
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 63, 62, 91),
        body: Center(
          child: Container(
            width: width * 0.85,
            height: height * 0.5,
            child: Swiper(
              controller: _controller,
              loop: false,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return _buildAnimCard(widget.anims[index], width, height);
              },
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildAnimCard(Anim anim, double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width * 0.8,
            padding: EdgeInsets.only(top : width * 0.012),
            child: AutoSizeText(
              anim.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: width * 0.048,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Column(children: _buildCandidates(width, anim),),
          Container(
            padding: EdgeInsets.all(width * 0.024),
            child: Center(
              child: ButtonTheme(
                minWidth: width * 0.5,
                height: height * 0.05,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  child: Text('확인'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 46, 46, 89),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  List<Widget> _buildCandidates(double width, Anim anim) {
    List<Widget> _children = [];
    for(int i = 0; i < 7; i++) {

    }
    return _children;
  }
}