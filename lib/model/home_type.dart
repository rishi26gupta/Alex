import 'package:alex/screens/feature/chatbot_feature.dart';
// import 'package:alex/screens/feature/image_feature.dart';
import 'package:alex/screens/feature/translator_feature.dart';
import 'package:alex/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType{AIChatBot, AIImage, AITranslator}


extension MyHomeType on HomeType{

  String get Title => switch(this){
    
    HomeType.AIChatBot => 'AI Chat Bot',
    
    HomeType.AIImage => 'AI Image Creator',
   
    HomeType.AITranslator => 'Language Translator',
  };
  String get lottie => switch(this){
    
    HomeType.AIChatBot => 'ai_hand_waving.json',
    
    HomeType.AIImage => 'ai_play.json',
   
    HomeType.AITranslator => 'ai_ask_me.json',
  };

  bool get leftAlign => switch (this){

       HomeType.AIChatBot => true,
    
    HomeType.AIImage => false,
   
    HomeType.AITranslator => true,
  };
  EdgeInsets get Padding => switch (this){

       HomeType.AIChatBot => EdgeInsets.zero,
    
    HomeType.AIImage => EdgeInsets.all(20),
   
    HomeType.AITranslator => EdgeInsets.zero,
  };

  // for navigation
  VoidCallback get OnTap => switch (this){

       HomeType.AIChatBot =>()=> Get.to(()=>ChatBotFeature()),
    
    HomeType.AIImage =>()=> Get.to(()=>HomePage()),
   
    HomeType.AITranslator =>()=> Get.to(()=>Translatorfeature()),
  };
}