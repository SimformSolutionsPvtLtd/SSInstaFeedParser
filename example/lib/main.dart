import 'package:flutter/material.dart';
import 'package:instafeedparser_example/modules/insta_feed_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Insta feed example'),
        ),
        body: Container(
          child: InstaFeedView(
            url: 'https://www.instagram.com/sachintendulkar/',
          ),
        ),
      ),
    );
  }
}
