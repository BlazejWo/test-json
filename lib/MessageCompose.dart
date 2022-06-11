import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/Message.dart';
class MessageCompose extends StatefulWidget {
  const MessageCompose({Key? key}) : super(key: key);

  @override
  State<MessageCompose> createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  final key = GlobalKey<FormState>();
  String add = "";
  String body = "";
  String subject = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BACK"),
      ),

      body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(


              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                ListTile(
                  title: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Add",
                          //prefixIcon: Icon(Icons.add_sharp),
                          labelStyle: TextStyle(fontWeight: FontWeight.normal)),
                      onSaved: (value) =>
                        add = value!
                  ),
                ),
                ListTile(
                  title: TextFormField(
                      onSaved: (value) =>
                      subject = value!,
                      decoration: InputDecoration(labelText: "SUBJECT",
                          labelStyle: TextStyle(fontWeight: FontWeight.normal))
                  ),
                ),
                Divider(),
                ListTile(
                  title: TextFormField(
                    onSaved: (value) => body = value!,
                    decoration: InputDecoration(labelText: "BODY",
                        floatingLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal),),
                    maxLines: 6,
                  ),
                ),
                ListTile(
                  title: RaisedButton(
                    child: Text('Send Message'),
                    onPressed: () {
                      this.key.currentState!.save();
                      Message message = Message(subject, body);


                      Navigator.pop(context, message);
                    },
                  ),
                )
              ],
              // Text("Compose NEW MESSAGE", style: Theme.of(context).textTheme.titleSmall),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     RaisedButton(
              //         onPressed: (){
              //           Navigator.pop(context,"YES");
              //         },
              //         child: Text("YES")),
              //
              //     RaisedButton(
              //       onPressed: (){
              //         Navigator.pop(context,"NO");
              //       },
              //         child: Text("NO")
              //     ),
              //   ],
              // )

            ),
          )
      ),
    );
  }
}

