// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hello_world/auth/database.dart';
import 'package:hello_world/models/user_model.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();

  final sugars = <String>['0', '1', '3', '4'];

  String? _currentName;
  String? _currentSugar;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<Users?>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width * .8,
          child: StreamBuilder<UsersData?>(
              stream: DataBaseService(uid: user!.uid).userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  UsersData userdata = snapshot.data!;
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text('Update your settings'),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          initialValue: userdata.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            labelText: 'Name',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Please enter a name' : null,
                          onChanged: (val) =>
                              setState(() => _currentName = val),
                        ),
                        const SizedBox(height: 20.0),
                        DropdownButtonFormField(
                          value: _currentSugar ?? userdata.sugars,
                          onChanged: (value) => setState(
                            () => _currentSugar = value.toString(),
                          ),
                          onTap: () => print(''),
                          items: sugars.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text('$e sugars'),
                            );
                          }).toList(),
                        ),
                        Slider(
                          min: 100.0,
                          max: 900.0,
                          divisions: 8,
                          inactiveColor: Colors.red,
                          activeColor: Colors.black,
                          value: (_currentStrength ?? userdata.strength)
                              .toDouble(),
                          onChanged: (val) {
                            setState(() {
                              _currentStrength = val.floor();
                            });
                          },
                        ),
                        MaterialButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await DataBaseService(uid: user.uid)
                                  .updateUserData(
                                _currentSugar ?? userdata.sugars,
                                _currentName ?? userdata.name,
                                _currentStrength ?? userdata.strength,
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Update'),
                          color: Colors.red,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
