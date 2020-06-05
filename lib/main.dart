import 'package:flutter/material.dart';
import 'package:flutterdemo/login.dart';
import 'package:flutterdemo/home.dart';
import 'package:flutterdemo/profile.dart';
import 'package:flutterdemo/contactlist.dart';
import 'package:flutterdemo/OrderList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget openwidget;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login demo ',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/homepage': (context) => HomePage(),
        '/profilepage': (context) => ProfilePage(),
        '/contactlist': (context) => ContactList(),
        '/orderlist': (context) => OrderListPage(),
      },

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
      ),
      home: LoginPage(),

    );
  }
}

