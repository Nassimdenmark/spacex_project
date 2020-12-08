import 'package:flutter/material.dart';
import 'screens/home/fetch_missions_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX',
      home: Scaffold(
        body: FetchMissionsPage(),
      ),
    );
  }
}
