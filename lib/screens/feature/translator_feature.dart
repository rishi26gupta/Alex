import 'package:alex/controller/translate_controller.dart';
import 'package:alex/helper/global.dart';
import 'package:alex/widgets/custom_button.dart';
import 'package:alex/widgets/custom_loading.dart';
import 'package:alex/widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Translatorfeature extends StatefulWidget {
  const Translatorfeature({super.key});

  @override
  State<Translatorfeature> createState() => _TranslatorfeatureState();
}

class _TranslatorfeatureState extends State<Translatorfeature> {
 
   final _c = TranslateController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:  AppBar(title:Text('Translate with Alex'),
      ),
      body: ListView(
         physics: BouncingScrollPhysics(),
          padding:EdgeInsets.only(
            top: mq.height*0.02, 
          bottom:mq.height*0.1, 
      ),
        children: [
         

         // from langauge
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          InkWell(
            onTap: () => Get.bottomSheet(LanguageSheet(c:_c, s: _c.from)),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Container(
              height: 50,
              width: mq.width*.4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
               border: Border.all(color: Colors.blue),
               borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            
              child: Obx( ()=>
              Text (_c.from == " " ? 'Auto' :  _c.from.value  ))
            ),
          ),
            
            IconButton(onPressed: (){
              
            }, icon: Icon(CupertinoIcons.repeat, color: Colors.blue)),
          // To language
         InkWell(
            onTap: () => Get.bottomSheet(LanguageSheet(c:_c, s: _c.to)),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Container(
              height: 50,
              width: mq.width*.4,
              alignment: Alignment.center,
              decoration: BoxDecoration(
               border: Border.all(color: Colors.blue),
               borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            
              child: Obx( ()=>
              Text (_c.to == " " ? 'To' :  _c.to.value  ))
            ),
          ),
         ],),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width*.04, vertical: mq.height*.04),
            child: TextFormField(
            
              controller: _c.textC,
              minLines: 5,
              maxLines: null,
              onTapOutside: (e)=> FocusScope.of(context).unfocus(),
              decoration:InputDecoration(
                fillColor:Colors.white ,
                hintText: 'Type here your sentence, I will translate for you...... ',
                hintStyle: TextStyle(fontSize: 14), 
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)
              )
              )
            ),
          ),


          // output field
        
          Obx(
            ()=> translateResult(),
          ),
          
          // adding some space
          SizedBox(
            height: mq.height*.04
          ),
          CustomBtn(onTap:
          // _c.translate,
           _c.googleTranslate,
            text: 'Translate')
        ],
      )
    );
  }

  Widget translateResult() => switch (_c.status.value) {
    Status.none => SizedBox(),
    Status.complete => Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width*.04),
              child: TextFormField(
              
                controller: _c.resultC,
                maxLines: null,
                onTapOutside: (e)=> FocusScope.of(context).unfocus(),
                decoration:InputDecoration(
                  fillColor:Colors.white , 
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)
                )
                )
              ),
            ),
    Status.loading => Align(child: const CustomLoading())
  };
}