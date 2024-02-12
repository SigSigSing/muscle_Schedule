import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: SafeArea(
        child: MyStatefulWidget()));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: カレンダー', style: optionStyle,),
    Text('Index 1: 種目入力', style: optionStyle,),
    Text('Index 2: 設定', style: optionStyle,),
  ];

  void _onItemTapped(int index) {
    setState(() {_selectedIndex = index;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('muscle_schedule'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'カレンダー',),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: '種目',),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定',),
        ],
        currentIndex: _selectedIndex, 
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.amber[900], 
        onTap: _onItemTapped,
      ),
    );
  }
}