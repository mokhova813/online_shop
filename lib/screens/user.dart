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
        title: Text("Профиль"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://sun9-61.userapi.com/impf/c846520/v846520874/126f95/MC1_StliW5w.jpg?size=883x1080&quality=96&proxy=1&sign=f097a3b3b984bd14fa59d760ec240184&type=album"),
                  radius: 50,
                  // child: ClipRRect(
                  //   borderRadius:,
                  //   child: Image.network("https://sun9-67.userapi.com/impf/c855524/v855524341/91dfb/Pfv2MKhdkmE.jpg?size=1080x1350&quality=96&proxy=1&sign=292f40b678da759b184fbeb069239290&type=album"),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Text("Анастасия", style: TextStyle(fontSize: 25),),
                      Text("Мохова", style: TextStyle(fontSize: 25),)
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("email: mokhova813@gmail.com", style: TextStyle(fontSize: 20),),
                )
              ],
            )
          ],
        ),
      )
    );

  }
}
