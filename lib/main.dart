import 'dart:developer';

import 'package:chat_gpt_integration/domain/chatgpt_modal.dart';
import 'package:chat_gpt_integration/prasention/home/chatscreen/chat_screen.dart';
import 'package:chat_gpt_integration/prasention/home/mainscreen/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "gFont",
      ),
      home: MainScreen(),
    );
  }
}
