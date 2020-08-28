import 'package:app_form222/main.dart';
import 'package:app_form222/screen_helper2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

import 'screen_helper3.dart';

class StoryGenerator extends StatefulWidget {
  String username;

  //StoryGenerator({this.username});
  StoryGenerator({Key key, this.title, this.username}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _StoryGenerator createState() => _StoryGenerator();
}

class _StoryGenerator extends State<StoryGenerator> {
  //String username;
  //StoryGenerator({this.username});
  //String usernamee;
  AudioCache player = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF009688),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          actions: [
            Container(
                width: 90,
                child:
                    FlatButton(child: Text('Submit'), onPressed: PressSubmit))
          ],
          title: Row(
            children: [
              Icon(Icons.menu_book_outlined, color: Colors.red),
              Text('  Story Generator')
            ],
          )),
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(height: 20),
          Container(
            child: Row(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 4),
                Text('\t\t\t\tEnter an adjective',
                    style: TextStyle(fontSize: 12, color: Color(0xFFDA5454))),
                Text('\t\t${widget.username}',
                    style: TextStyle(fontSize: 16, color: Color(0xFFA9A9A9))),
              ])
            ]),
            decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              //borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0)),
              border: Border(bottom: BorderSide()),
            ),
            width: 320,
            height: 50,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 40),
              Text('Not a valid adjective',
                  style: TextStyle(color: Color(0xFFDA5454), fontSize: 12))
            ],
          ),
          SizedBox(height: 20),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF0F0F0),
                  border: Border(bottom: BorderSide())),
              width: 320,
              height: 50,
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text('\t\t\t\t',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFDA5454))),
                    Text('\t\t${widget.username}',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFA9A9A9))),
                  ],
                )
              ])),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 30),
              Icon(Icons.check_box, color: Color(0xFF009688)),
              SizedBox(width: 10),
              Text('I agree to the terms of service',
                  style: TextStyle(fontWeight: FontWeight.w400))
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(widget.username)],
          )
        ],
      ),
    );
  }

  void PressSubmit() {
    setState(() {
      if (widget.username.contains('dog')) player.play('dog.mp3');
      if (widget.username.contains('chicken')) player.play('chicken.mp3');
    });
  }
}
