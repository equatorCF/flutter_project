// ignore_for_file: file_names, dead_code, unused_import
import 'package:flutter/material.dart';
import 'views/signUp_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpView(),
    );
  }
}
