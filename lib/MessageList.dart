import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Message.dart';

class MessageList extends StatefulWidget {
  final String title;
  const MessageList({ Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = [];

  Future loadMessageList() async{
    // String content = await rootBundle.loadString('data/message.json');
    http.Response response =
      await http.get(Uri.parse(Uri.encodeFull('https://run.mocky.io/v3/d20a2a7b-99a8-4f70-a32d-b9c58e29cfa1')));
    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages = collection.map((json) => Message.fromJson(json)).toList();

    // print(content);
    setState(() {
      messages = _messages;
    });
  }

  void initState() {
    loadMessageList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index ) {
          Message message = messages[index];
          return ListTile(
            title: Text(message.subject),
            subtitle: Text(message.body),

            leading: CircleAvatar(backgroundColor: Colors.cyan,
                child: Text('$index')),
          );
        },
      ),
    );
  }
}