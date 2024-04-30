import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialog {

  // info 

  static void  info(String msg){

    Get.snackbar('info', msg, backgroundColor:Colors.blue.withOpacity(.8), colorText: Colors.white);
  }

  // 
  static void  Succsess(String msg){

    Get.snackbar('Succsess', msg, backgroundColor:Colors.blue.withOpacity(.8), colorText: Colors.white);
  }
  static void  Error(String msg){

    Get.snackbar('Error', msg, backgroundColor:Colors.blue.withOpacity(.8), colorText: Colors.white);
  }
}