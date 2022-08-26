import 'package:flutter/material.dart';
import 'package:listview_flutter/ListAllFootball.dart';
import 'package:listview_flutter/listView.dart';
import 'package:listview_flutter/tabbarList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TabbarExample(),
    );
  }
}
