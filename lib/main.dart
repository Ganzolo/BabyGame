// Copyright 2022 All Rights reserved Nicolas Millasseau

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './animals.dart';
import './alphabet.dart';
import './settings.dart';

void main() {
  print("Started");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Baby Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTabBarIndex = 0;

  final List _appScreens = [
    {"screen": const Alphabets(), "title": "Alphabet"},
    {"screen": Animals(), "title": "Animals"},
    {"screen": const Settings(), "title": "Settings"},
  ];

  void _selectScreen(int index) {
    setState(() {
      if (index == 1) {
        print("Selected screen");
        (_appScreens[index]["screen"] as Animals).readText();
      }

      _selectedTabBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.grey[800],
      ),
      body: _appScreens[_selectedTabBarIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabBarIndex,
        onTap: _selectScreen,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Alphabet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Animals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        backgroundColor: Colors.grey[800],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
      ),
    );
  }
}
