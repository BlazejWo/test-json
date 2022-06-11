import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:test1/ButtonCompose.dart';
import 'package:test1/MessageCompose.dart';
import 'package:test1/MessageDetail.dart';
import 'Message.dart';

class MessageList extends StatefulWidget {
  final String title;
  const MessageList({ Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  late List<Message> messages;
    late Future<List<Message>> future;

                                                                                   // bool isLoading = true;

                                                                                  //  Future loadMessageList() async{
                                                                                  // String content = await rootBundle.loadString('data/message.json');
                                                                                  // List<Message> _messages = await Message.browse();
   // setState(() {
    //  messages = _messages;
                                                                                  // isLoading = false;
  //  });
 // }

  void initState() {
    super.initState();
    fetch();

  }
void fetch() async {
    future = Message.browse();
    messages = await future;
    setState.call(() {

    });
    _MessageListState;
}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(icon: Icon(Icons.refresh),
            onPressed: () async {
          var _messages = await Message.browse();
          setState(() {
            messages = _messages;
          });
        },
            )],
      ),
      body: FutureBuilder (
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              var messages = snapshot.data;
              return ListView.separated(
                    itemCount: messages.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (BuildContext context, int index ) {
                      Message message = messages[index];
                      return ListTile(
                        title: Text(message.subject),
                        subtitle: Text(message.body),

                        leading: CircleAvatar(backgroundColor: Colors.cyan,
                            child: Text('$index')),

                      onTap:(){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) => MessageDetail(message.subject, message.body),
                            ),
                        );
                      },);
                    },
                  );

          }

        },
      ),
floatingActionButton: ButtonCompose(messages),

      //isLoading?Center(child: RefreshProgressIndicator()):
      // ListView.separated(
      //   itemCount: messages.length,
      //   separatorBuilder: (context, index) => Divider(),
      //   itemBuilder: (BuildContext context, int index ) {
      //     Message message = messages[index];
      //     return ListTile(
      //       title: Text(message.subject),
      //       subtitle: Text(message.body),
      //
      //       leading: CircleAvatar(backgroundColor: Colors.cyan,
      //           child: Text('$index')),
      //     );
      //   },
      // ),
    );
  }
}