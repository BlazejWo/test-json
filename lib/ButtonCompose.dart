import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Message.dart';
import 'MessageCompose.dart';

class ButtonCompose extends StatelessWidget {
  final List<Message> messages;
  const ButtonCompose( this.messages) ;

  @override
  Widget build(BuildContext context) {
    return
     FloatingActionButton(
      child: Icon(Icons.add_outlined, color: Colors.black),
      onPressed: () async{ Message message = await
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MessageCompose()));

        if (message != null) {
          messages.add(message);
          // print(intention);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Wysłałeś wiadomość ",),

            backgroundColor: Colors.blueAccent,
          ),);
        }

    },
    );
  }
}
