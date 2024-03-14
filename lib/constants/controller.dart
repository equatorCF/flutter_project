// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hello_world/models/user_model.dart';
import 'package:hello_world/screens/screen.dart';
import 'package:provider/provider.dart';

class Controller extends StatelessWidget {
  const Controller({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return user != null ? HomeScreen() : WelcomeScreen();
  }
}
