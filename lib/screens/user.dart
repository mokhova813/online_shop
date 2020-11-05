import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailScreen.dart';

class UserScreen extends StatefulWidget {
  UserScreen() : super();


  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: const Center(
        child: Text('Here display user data(avatar, setting, etc..)'),
      ),
    );

  }
}
