import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
   MessageDetail(  this.subject, this.body);

  final String subject;
  final String body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.subject)),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Text(this.body)));


  }
}
