import 'package:flutter/material.dart';

class SenderRowWidger extends StatelessWidget {
  SenderRowWidger({
    Key? key,
    required this.mWidth,
    required this.text,
  }) : super(key: key);
  final double mWidth;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: mWidth * 0.70,
          // height: mWidth / 2,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  wordSpacing: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
