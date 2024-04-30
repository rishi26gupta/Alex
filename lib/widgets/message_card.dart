import 'package:alex/helper/global.dart';
import 'package:alex/main.dart';
import 'package:alex/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    return message.msgType == MessageType.bot
        ?

        // For bot
        Row(
            children: [
              CircleAvatar(
                  radius: 22,
                  child: Image.asset('assets/images/logo.png', width: 35)),
              SizedBox(width: 7),
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * .6),
                margin: EdgeInsets.only(
                    bottom: mq.height * .02, left: mq.width * .02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * 0.01, horizontal: mq.width * .02),
                decoration: BoxDecoration(
                    border: Border.all(color:  Theme.of(context).lightTextColor1),
                    borderRadius:
                        BorderRadius.only(topLeft: r, bottomRight: r)),
                //
                child: message.msg.isEmpty
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'please wait....',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      )
                    : Text(
                        message.msg,
                        textAlign: TextAlign.center,
                      ),
              ),
            ],
          )
        :

        // For User
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  constraints: BoxConstraints(maxWidth: mq.width * .6),
                  margin: EdgeInsets.only(
                      bottom: mq.height * .02, right: mq.width * .02),
                  padding: EdgeInsets.symmetric(
                      vertical: mq.height * 0.01, horizontal: mq.width * .02),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius:
                          BorderRadius.only(bottomLeft: r, topRight: r)),
                  child: Text(
                    message.msg,
                    textAlign: TextAlign.center,
                  )),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  child: Icon(Icons.person, color: Colors.blue)),
              SizedBox(width: 7),
            ],
          );
  }
}
