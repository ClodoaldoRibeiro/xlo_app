import 'package:flutter/material.dart';
import 'package:xlo_app/screens/chat/components/chat_empty.dart';
import 'package:xlo_app/screens/widgets/xlo_drawer.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Chats"),
          centerTitle: true,
        ),
        drawer: XLODrawer(),
      body: ChatEmpty(),

    );
  }
}
