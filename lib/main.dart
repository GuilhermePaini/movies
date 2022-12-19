import 'package:flutter/material.dart';

import 'package:themoviedbapp/screens/home.dart';
import 'package:themoviedbapp/screens/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Movie DB app',
      theme: ThemeData(primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.black),
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'resources/logo.png',
          width: 200,
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => Search()),
                    ),
                  ),
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Home(),
    );
  }
}
