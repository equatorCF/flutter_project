// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hello_world/auth/auth.dart';
import 'package:hello_world/auth/database.dart';
import 'package:hello_world/models/data_test.dart';
import 'package:hello_world/widgets/list_test.dart';
import 'package:hello_world/widgets/setting.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthSerives _serives = AuthSerives();

  void logOut(BuildContext context) async {
    await _serives.logOut();
  }

  void _showActionPanel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: SettingForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<TestData?>?>.value(
      value: DataBaseService().datas,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          centerTitle: true,
          actions: [
            TextButton.icon(
              onPressed: () => logOut(context),
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              label: Text(
                'log out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () => _showActionPanel(context),
              color: Colors.red,
              child: Text('Settings'),
              textColor: Colors.white,
            ),
          ],
        ),
        body: ListWidget(),
      ),
    );
  }
}
