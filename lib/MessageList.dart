import 'dart:collection';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'Message.dart';

class MessageList extends StatefulWidget {
  final String title;
  const MessageList({ Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
   late Future<List<Message>> messages;
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
                                                                                  // loadMessageList();
    super.initState();
    messages = Message.browse();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[IconButton(onPressed: (){
          var _messages = Message.browse();
          setState(() {
            messages = _messages;
          });
        },
            icon: Icon(Icons.refresh))],
      ),
      body: FutureBuilder (
        future: messages,
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
                      );
                    },
                  );

          }

        },
      )

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