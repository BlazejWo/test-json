import 'package:flutter/material.dart';

import 'MessageList.dart';


void main() {runApp( MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      theme: ThemeData(primarySwatch: Colors.cyan,),
      home: const MessageList(title: 'Country & City !',),
    );
  }
}



