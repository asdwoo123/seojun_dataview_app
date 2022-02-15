import 'package:flutter/material.dart';
import 'package:seojun_dataview_app/pages/monitor.dart';
import 'package:seojun_dataview_app/pages/project.dart';
import 'package:seojun_dataview_app/pages/setting.dart';
import 'package:seojun_dataview_app/service/account.dart';

import '../theme.dart';

List<Widget> widgetOptions = <Widget>[
  MonitorPage(),
  ProjectPage(),
  SettingPage()
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String projectName = 'project name';

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text(projectName),),
     body: SafeArea(
       child: Container(
         child: widgetOptions.elementAt(selectedIndex),
       ),
     ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.desktop_windows), label: 'Monitor'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Project'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting')
        ],
        currentIndex: selectedIndex,
        selectedItemColor: selectedItemColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
