// ignore_for_file: file_names, dead_code, unused_import
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/screens/home_screen.dart';
import 'package:hello_world/widgets/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
