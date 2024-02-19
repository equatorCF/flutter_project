// ignore: duplicate_ignore
// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:hello_world/homePage.dart';
import 'package:hello_world/introScreen1.dart';
import 'package:hello_world/introScreen2.dart';
import 'package:hello_world/introScreen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({Key? key}) : super(key: key);

  @override
  _onBoardingScreenState createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  // ignore: prefer_final_fields
  PageController _controller = PageController();
  // keep track if we are on the last page
  bool OnLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              OnLastPage = index == 2;
            });
          },
          children: [
            IntroScreen1(),
            IntroScreen2(),
            IntroScreen3(),
          ],
        ),
        // dot indicator
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
                    )),

                //skip button

                // dot indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  textDirection: TextDirection.ltr,
                ),

                // next button
                OnLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text('Done',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            )),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(microseconds: 5000),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w100),
                        ),
                      )
              ],
            ),
            alignment: Alignment.bottomCenter)
      ],
    );
  }
}
