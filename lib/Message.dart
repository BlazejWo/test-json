import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Message {
  String subject;
  String body;

  Message(this.subject, this.body);

  Message.fromJson(Map<String, dynamic> json)
      : subject = json ['subject'],
        body = json['body'];

  static Future<List<Message>> browse()  async{
    // String content = await rootBundle.loadString('data/message.json');
    http.Response response =
    await http.get(Uri.parse(Uri.encodeFull('https://run.mocky.io/v3/d20a2a7b-99a8-4f70-a32d-b9c58e29cfa1')));

    await Future.delayed(Duration(seconds:2));

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages = collection.map((json) => Message.fromJson(json)).toList();

    // print(content);
    return _messages;
  }
}

