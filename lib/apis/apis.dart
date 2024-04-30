import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:alex/helper/global.dart';
import 'package:http/http.dart';
import 'package:translator_plus/translator_plus.dart';

class APIs{
  // get answer from openai
   static Future<String> getAnswer(String question) async {
    try{
       final res = 
     await post(Uri.parse('https://api.openai.com/v1/chat/completions'),
     headers: {
      HttpHeaders.contentTypeHeader : 'application/json',
      HttpHeaders.authorizationHeader : 'Bearer $apiKey'
     },
      body:jsonEncode({
      "model": "gpt-3.5-turbo",
      "max_tokens": 2000,
      "temperature": 0,
    "messages": [
      {"role": "user", "content": question },
    ]
     })); 

     final data = jsonDecode(res.body);
       
     log('res: $data');     

    //  log('res: ${res.body}');

    return data['choices'][0]['message']['content'];

    }catch(e){
      log('getanswerE: $e');
      return 'Something went wrong( Please Try again after some time !!)';
    }
  }

  static Future<String> googleTranslate(
    {required String from, required String to, required String text}) async{
     try{
     
     final res = await GoogleTranslator().translate(text,from: from, to: to);
     return res.text;

     }catch(e){
         log('googletranslate: $e');
         return 'Something went wrong!';     
     }


  }
}