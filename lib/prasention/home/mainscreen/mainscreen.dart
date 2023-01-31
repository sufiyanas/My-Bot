import 'package:chat_gpt_integration/prasention/home/Imagescreen/image_screen.dart';
import 'package:chat_gpt_integration/prasention/home/chatscreen/chat_screen.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Bot",
          ),
          bottom: const TabBar(indicatorColor: Colors.black, tabs: [
            Tab(
              text: "ChatGpt",
            ),
            Tab(
              text: "Dall E",
            ),
          ]),
        ),
        body: TabBarView(children: [
          ChatScreen(),
          ImadeScreen(),
        ]),
      ),
    );
  }
}
