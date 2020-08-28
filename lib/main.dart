import 'package:app_form222/screen_helper.dart';
import 'package:app_form222/screen_helper2.dart';
import 'package:app_form222/story_generator.dart';
import 'package:flutter/material.dart';

import 'sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF009688),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                ScreenHelper2.gotoSignIn(context);
              }),
          title: Text('\t Form Widget'),
        ),
        body: Container(
            width: 390,
            height: 490,
            decoration: BoxDecoration(
                color: Colors.white10,
                border: Border(
                    bottom: BorderSide(color: Colors.black26, width: 1.5),
                    top: BorderSide(color: Colors.black26, width: 1.5),
                    left: BorderSide(color: Colors.black26, width: 1.5),
                    right: BorderSide(color: Colors.black26, width: 1.5)),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        // color: Colors.red,
                        width: 300,
                        height: 50,
                        child: Row(
                          children: [
                            Text('\t\tTitle',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFFA9A9A9))),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F0F0),
                          border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top:
                                  BorderSide(color: Colors.white10, width: 3.0),
                              left:
                                  BorderSide(color: Colors.white10, width: 3.0),
                              right: BorderSide(
                                  color: Colors.white10, width: 3.0)),
                          //borderRadius: BorderRadius.all(Radius.circular(5.0))
                        )),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        // color: Colors.red,
                        width: 300,
                        height: 110,
                        child: Row(
                          children: [
                            Text('\t\tDescription',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFFA9A9A9))),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black26, width: 1.5),
                                top: BorderSide(
                                    color: Colors.black26, width: 1.5),
                                left: BorderSide(
                                    color: Colors.black26, width: 1.5),
                                right: BorderSide(
                                    color: Colors.black26, width: 1.5)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)))),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            Text('7/28/2020')
                          ],
                        )),
                    SizedBox(width: 150),
                    Column(
                      children: [
                        Text('\nEdit',
                            style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text('Estimated value',
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
                Row(
                  children: [SizedBox(width: 30), Text("\$257")],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 35),
                    Image.asset('assets/scroll_bar.png')
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.check_box, color: Color(0xFF009688)),
                    SizedBox(width: 15),
                    Text('Brushed Teeth',
                        style: TextStyle(fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text('Enable Feature',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(width: 170),
                    Image.asset('assets/switch.png')
                  ],
                ),
              ],
            )));
  }

  
}
