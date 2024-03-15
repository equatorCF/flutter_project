// ignore_for_file: unused_import, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hello_world/auth/database.dart';
import 'package:hello_world/models/data_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    final datas = Provider.of<List<TestData?>?>(context);
    return StreamBuilder<List<TestData?>?>(
      stream: DataBaseService().datas,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return ListView.builder(
            itemCount: datas!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.brown[datas[index]!.strength!],
                  ),
                  title: Text(datas[index]!.name!),
                  subtitle: Text(datas[index]!.sugar!),
                ),
              );
            },
          );
        } else {
          return Center(
              child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.red,
            child: const Center(child: CircularProgressIndicator()),
          ));
        }
      },
    );
  }
}
