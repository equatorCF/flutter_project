// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

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
                  decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50))),
                  child: Column(
                    children: [
                      Expanded(
                        child: Lottie.network(
                            'https://lottie.host/d633e7f3-000a-4245-9ab1-58e26d624595/dmfMboZmAR.lottie'),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
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
