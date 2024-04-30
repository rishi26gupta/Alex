import 'package:alex/helper/pref.dart';
import 'package:alex/screens/home_screen.dart';
import 'package:alex/screens/onboarding_screen.dart';
import 'package:alex/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      // Navigator.pushReplacement(context,MaterialPageRoute
      // (builder: (context) => Pref.showOnboarding
      //  ? OnBoardingScreen()
      //   : HomeScreen(),));

      // getx manamegent for navigation off is used for push . replacement
      Get.off(() => Pref.showOnboarding ? OnBoardingScreen() : HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    // intializing device size
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: EdgeInsets.all(mq.width * .15),
                  child: Image.asset('assets/images/logo.png',
                      width: mq.width * .32),
                ),
              ),
              Text(
                "Alex : The AI Assistant  ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              Spacer(),
              CustomLoading(),
              Spacer(),
            ],
          )),
    );
  }
}
