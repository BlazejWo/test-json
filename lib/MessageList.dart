import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    messages = messages;
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
      drawer: Drawer(  //trzy 3 kreski menu
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Błażej Woźniak"),
                accountEmail: Text("ewozniakblazej@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://media-exp1.licdn.com/dms/image/C4E03AQHocLEBYvlmXA/profile-displayphoto-shrink_200_200/0/1528812075555?e=1660780800&v=beta&t=GrIMga4ZaMx05oAVB-LujxKG5iHzHt_P5FiSNfDBuVs"),
                ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (context) => AlertDialog(title: Text("Dodaj nowe konto.."),)
                    );
                    },
                  child: CircleAvatar(
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),

            Padding(padding: EdgeInsets.only(top: 5)),
            ListTile(
              leading: Icon(FontAwesomeIcons.inbox),
              title: Text("MENU"),
              trailing: Chip(
                label: Text("4", style: TextStyle(fontSize: 9),),
                backgroundColor: Colors.cyanAccent,
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.edit),
              title: Text("Project"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.archway),
              title: Text("Archiwum"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.paperPlane),
              title: Text("Status"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.trash),
              title: Text("Bin"),
            ),
            Divider(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomRight,
              child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),),),




          ],
        ),
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