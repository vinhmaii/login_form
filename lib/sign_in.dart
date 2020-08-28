import 'dart:convert';

import 'package:app_form222/main.dart';
import 'package:app_form222/screen_helper.dart';
import 'package:app_form222/story_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//part 'sign_in_http.g.dart';
const spinkit = SpinKitPouringHourglass(
  color: Color(0xFF009688),
  size: 50.0,
);

class SignIn extends StatefulWidget {
  SignIn({Key key, this.title}) : super(key: key);
  //final http.Client httpClient;
  var httpClient = http.Client();
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SignIn createState() => _SignIn();
}

@JsonSerializable()
class FormData {
  String username;
  String password;

  FormData({
    this.username,
    this.password,
  });

  static FormData fromJson(Map<String, dynamic> json) {
    return FormData(
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  static Map<String, dynamic> toJson(FormData instance) {
    return <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
  }
}

class _SignIn extends State<SignIn> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  var passwordInvalid = false;
  var emailInvalid = false;
  FocusNode _focusNode;
  FocusNode _focusNode2;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  /* void validateAndSave() {
    final FormState form = _formKey.currentState;
    final FormState form2 = _formKey2.currentState;
    if (form.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }*/

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
    _focusNode2 = new FocusNode();
    _focusNode2.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009688),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('\tSign in Form'),
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(height: 20),
          //key: _formKey,
          Container(
              width: 320,
              height: 80,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (!usernamecontroller.text.contains("@") ||
                        !usernamecontroller.text.contains(".")) {
                      return 'Invalid Email Format';
                    }
                    return null;
                  },
                  onChanged: (string) => _formKey.currentState.validate(),
                  // onTap: _requestFocus,
                  // autofocus: false,
                  focusNode: _focusNode,
                  controller: usernamecontroller,
                  //obscureText: true,
                  //focusNode: myFocusNode,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF009688)),
                      //  when the TextFormField in focused
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6A6A6A))),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    filled: true,
                    //errorText: emailInvalid ? 'Invalid Email' : null,
                    border: InputBorder.none,
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: _focusNode.hasFocus
                            ? Color(0xFF009688)
                            : Color(0xFF6A6A6A)),
                  ),
                ),
              )),
          //decoration: BoxDecoration(
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0)),
          //border: Border(bottom: BorderSide()),
          SizedBox(height: 5),
          Container(
            child: Form(
                key: _formKey2,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty)
                      return "Password can't empty";
                    else
                      return null;
                  },
                  onChanged: (value) => _formKey2.currentState.validate(),
                  // onTap: _requestFocus,
                  // autofocus: false,
                  focusNode: _focusNode2,
                  controller: passwordcontroller,
                  //obscureText: true,
                  //focusNode: myFocusNode,

                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF009688)),
                      //  when the TextFormField in focused
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6A6A6A))),
                    errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    filled: true,
                    //errorText: passwordInvalid ? 'Invalid Password' : null,
                    border: InputBorder.none,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: _focusNode2.hasFocus
                            ? Color(0xFF009688)
                            : Color(0xFF6A6A6A)),
                  ),
                )),
            //decoration: BoxDecoration(
            //  color: Color(0xFFF0F0F0), border: Border(bottom: BorderSide())),
            width: 320,
            height: 80,
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text('Sign in',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                onPressed: clickSignIn,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(message,
            style: TextStyle(
              fontSize: 25,
            )),
        actions: [
          FlatButton(
            child: Text('OK',
                style: TextStyle(fontSize: 25, color: Color(0xFF009688))),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showDialog2(String message) {
    showDialog(
      context: context,
      child: AlertDialog(
        backgroundColor: Color(0xFFFFEEAD),
        title: Text(message,
            style: TextStyle(
              color: Color(0xFF009688),
              fontSize: 25,
            )),
        actions: [
          FlatButton(
            child:
                Text('OK', style: TextStyle(fontSize: 25, color: Colors.black)),
            onPressed: () => ScreenHelper.gotoStoryGenerator(context,
                user: usernamecontroller.text),
          ),
        ],
      ),
    );
  }

  void _showDialog3() {
    showDialog(
        context: context,
        builder: (context) => Material(
              type: MaterialType.transparency,
              child: Center(
                //title: Text(message),
                //insetPadding: EdgeInsets.fromLTRB(150, 270, 150, 270),
                child: spinkit,
              ),
            ));
  }

  void clickSignIn() async {
    
    _showDialog3();
    
    await Future.delayed(Duration(seconds: 2));

    String user = usernamecontroller.text;
    String pass = passwordcontroller.text;
    if (!usernamecontroller.text.contains("@") ||
        !usernamecontroller.text.contains("."))
      emailInvalid = true;
    else {
      emailInvalid = false;
      print('email');
      print(usernamecontroller.text);
    }

    FormData formdata = new FormData(
        username: usernamecontroller.text.trim(),
        password: passwordcontroller.text);
    var data = json.encode(FormData.toJson(formdata));
    var result = await widget.httpClient.post(
        'http://192.168.1.213:3000/users/login',
        body: data,
        headers: {'content-type': 'application/json'});
    Navigator.pop(context);
    if (result.statusCode == 200) {
      print(result.body);
      if (result.body == 'FAIL') {
        _showDialog('Sorry, Username or Password incorrect');
        passwordInvalid = true;
      } else
        _showDialog2('Hi ${usernamecontroller.text.trim()}, \nWelcome back!');
      // _showDialog('Succesfully signed in.');
    } else if (result.statusCode == 401) {
      _showDialog('Unable to sign in.');
    } else {
      _showDialog('Something went wrong. Please try again.');
    }
    /*if ((emailInvalid == false) && (passwordInvalid == false))
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StoryGenerator(
                      username: usernamecontroller.text,
                    )));
      //Navigator.pop(context);
    })*/
  }
}

/*String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}*/
