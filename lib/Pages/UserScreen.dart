import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import '../Pages/InfoScreen.dart';

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
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  List data;
  Map user;

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/users"),
        headers:  {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<String> getUserData(int id) async {
    http.Response response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/users/"+id.toString()),
        headers:  {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      user = json.decode(response.body);
    });

    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new InfoScreen(user)),
    );
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body:
      new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext contex, int index) {
          var button;
          if(Platform.isAndroid) {
            button = new RaisedButton(child:  Text(data[index]["name"]),
                onPressed:  () => getUserData(data[index]["id"])
            );
          }
          if (Platform.isIOS) {
            button = new CupertinoBtton(child:  Text(data[index]["name"]),
                color: CupertinoColours.activeBlue,
                onPressed:  () => getUserData(data[index]["id"])
            );
          }
          return new Card(
              child:
              button
          );
        },
      ),
    );
  }
}
