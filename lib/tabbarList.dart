import 'package:flutter/material.dart';
import 'package:listview_flutter/listView.dart';

class TabbarExample extends StatefulWidget {
  const TabbarExample({Key? key}) : super(key: key);

  @override
  State<TabbarExample> createState() => _TabbarExampleState();
}

class _TabbarExampleState extends State<TabbarExample>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Text('Chat')),
    Tab(icon: Text('Status')),
    Tab(icon: Text('Panggilan')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          bottom: TabBar(
            onTap: (ListSiswa) {},
            controller: _controller,
            tabs: list,
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(controller: _controller, children: [
          ListSiswa(),
          Center(
              child: Text(
                _selectedIndex.toString(),
                style: TextStyle(fontSize: 40),
              )),
          Center(
              child: Text(
                _selectedIndex.toString(),
                style: TextStyle(fontSize: 40),
              )),
        ]),
      ),
    );
  }
}