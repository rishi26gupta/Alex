import 'dart:developer';

import 'package:alex/controller/translate_controller.dart';
import 'package:alex/helper/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSheet extends StatefulWidget {

  final TranslateController c;
  final  RxString s;


  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
 
 final _search = ''.obs;
  @override
  Widget build(BuildContext context) {

    
    return Container(
      height:mq.height*.5,
      padding: EdgeInsets.only(
          left: mq.width * .04, right: mq.width * .04, top: mq.height * .02),
    decoration:  BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
  
    ),

    child: Column(
        children: [

           TextFormField(
             onChanged: (s) => _search.value = s.toLowerCase(),
           
            //  controller: _c.resultC,
             onTapOutside: (e)=> FocusScope.of(context).unfocus(),
             decoration:InputDecoration(
               prefixIcon: Icon(Icons.translate_sharp, color: Colors.blue),
               hintText: "Search language....... ",
               fillColor:Colors.white , 
               border: OutlineInputBorder(borderRadius:BorderRadius.circular(22)
             )
             )
           ),

           Expanded(
            child: Obx(
              () {
                final List<String> list = _search.isEmpty
                    ? widget.c.lang
                    : widget.c.lang
                        .where((e) => e.toLowerCase().contains(_search.value))
                        .toList();

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  padding: EdgeInsets.only(top: mq.height * .02, left: 6),
                  itemBuilder: (ctx, i) {
                    return InkWell(
                      onTap: () {
                        widget.s.value = list[i];
                        log(list[i]);
                        Get.back();
                      },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: mq.height*.02),
                    child: Text(list[i]),
                  ),
                );
              });
              },
            ),
          )

      
        ],
      )
    );
  }
}