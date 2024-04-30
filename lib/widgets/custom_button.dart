import 'package:alex/helper/global.dart';
import 'package:alex/main.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const CustomBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation : 0,
              minimumSize: Size(mq.width * .4, 50),
              backgroundColor: Theme.of(context).ButtonColor),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          )),
    );
  }
}
