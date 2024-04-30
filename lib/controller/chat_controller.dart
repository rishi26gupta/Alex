import 'package:alex/apis/apis.dart';
import 'package:alex/helper/my_dailogs.dart';
import 'package:alex/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{

  final scrollC = ScrollController();

  final textC =  TextEditingController();

  final list = <Message>[Message(msg: 'Hello, I am alex  How can I Help You ? ..', msgType: MessageType.bot)].obs;

  Future<void> askQuestion() async {
    if(textC.text.trim().isNotEmpty){
      // user 

      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: '', msgType: MessageType.user));
      _scrollDown();
       
       final res =  await APIs.getAnswer(textC.text);
      // Alex
      
      list.removeLast();
      list.add(Message(msg: res , msgType: MessageType.bot));
      _scrollDown();

      textC.text = '';

    }

    else{
      MyDialog.info('Please write something');
    }
  }

  // for moving to end of the message
  void _scrollDown(){
    scrollC.animateTo(scrollC.position.maxScrollExtent, duration: Duration(milliseconds:500), curve: Curves.ease);
  }
}