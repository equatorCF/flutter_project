// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      Expanded(child: Image.asset("assets/images/maths.jpg"))
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xff4254f5),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text(
                          "Learning Everything",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Learning with pleasure with us, where are you!!",
                          style: TextStyle(
                            color: Colors.black54,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
