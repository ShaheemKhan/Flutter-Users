import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Models/User.dart';

class InfoScreen extends StatelessWidget {
  Map user;

  InfoScreen(Map usr) {
    this.user = usr;
  }
  @override
  Widget build(BuildContext context) {
    User usr = new User(user);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Info Screen"),
      ),
      body:
      new GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 10/2,
        children: <Widget>[
          new Text("Name:"),
          new Text(usr.name),
          new Text("Username:"),
          new Text(usr.username),
          new Text("Email:"),
          new Text(usr.email),
          new Text("Address"),
          new Text(usr.getAddress()),
          new Text("Phone"),
          new Text(usr.phone),
          new Text("Website"),
          new Text(usr.website),
          new Text("Company"),
          new Text(usr.getCompany()),
        ],
      ),
    );
  }
}