import 'package:alex/controller/chat_controller.dart';
import 'package:alex/helper/global.dart';
import 'package:alex/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatBotFeature extends StatefulWidget {
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  
  final _c = ChatController();

  // for accesing All over the project using get x
  // final _c = Get.put(ChatController());
  // final find = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:  AppBar(
        title:Text('Chat with Alex'),
        
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat  ,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          Expanded(child: TextFormField(
            controller: _c.textC,
            textAlign: TextAlign.center,
            onTapOutside: (e)=> FocusScope.of(context).unfocus(),
            decoration:InputDecoration(
              fillColor: Theme.of(context).scaffoldBackgroundColor ,
              filled: true,
              isDense: true,
              hintText: 'Ask me anything you want.....',
              hintStyle: TextStyle(
                fontSize: 14), 
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(40)
            )
            )
          )
          ),

          SizedBox(width :8),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 23,
            child: IconButton(
              onPressed: _c.askQuestion,
              icon: Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 28,)),)
        ],),
      ) ,
      body: Obx(
        () => ListView(
          physics: BouncingScrollPhysics(),
          controller: _c.scrollC ,
          padding:EdgeInsets.only(top: mq.height*0.02, bottom:mq.height*0.1, left: mq.width*0.02) ,
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}