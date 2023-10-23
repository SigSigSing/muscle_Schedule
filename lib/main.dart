import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'muscle_schedule';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: カレンダー画面',
      style: optionStyle,
    ),
    Text(
      'Index 1: 種目画面',
      style: optionStyle,
    ),
    Text(
      'Index 2: 設定画面',
      style: optionStyle,
    ),
  ];

  //Iconクリック時の処理
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_edit),
            label: 'カレンダー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '種目',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex, //現在のアクティブインデックスを表示
        backgroundColor: Colors.grey[100], //ボトムバーの背景色
        selectedItemColor: Colors.amber[900], //Icon選択時にIcon色を指定
        onTap: _onItemTapped, //Iconタップ時のイベント
      ),
    );
  }
}
