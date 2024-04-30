import 'package:alex/helper/global.dart';
import 'package:alex/main.dart';
import 'package:alex/model/onboard.dart';
import 'package:alex/screens/home_screen.dart';
import 'package:alex/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      // onboarding 1
      OnBoard(
          title: 'Hi, I am Alex ',
          subtitle1: ' Ask me Whatever you Want',
          subtitle2:
              'I can be your best buddy & you can ask me anything & I will help you  ',
          lottie: 'ai_ask_me'),

      // on boarding 2
      OnBoard(
          title: 'Welcome to Creation World',
          subtitle1: 'Imagination to Reality',
          subtitle2:
              'Just imagine any thing and let me know , I will create Something wonderful for you ',
          lottie: 'ai_play')
    ];
    return Scaffold(
        body: PageView.builder(
      controller: c,
      itemCount: list.length,
      itemBuilder: (ctx, ind) {
        final isLast = ind == list.length - 1;
        return Column(
          children: [
            // lottie
            Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                height: mq.height * .6, width: isLast ? mq.width * .7 : null),

            // title

            Text(list[ind].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5)),

            SizedBox(height: mq.height * .02),

            // subtitle1
            Text(list[ind].subtitle1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5,
                    color: Theme.of(context).textColor)),

            SizedBox(height: mq.height * .005),

            // subtitle2
            SizedBox(
              width: mq.width * .8,
              child: Text(list[ind].subtitle2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14, letterSpacing: .5, color: Theme.of(context).textColor)),
            ),

            const Spacer(),
            // dot
            Wrap(
              spacing: 10,
              children: List.generate(
                  list.length,
                  (i) => Container(
                        width: i == ind ? 15 : 10,
                        height: 8,
                        decoration: BoxDecoration(
                            color: i == ind
                                ? Color.fromARGB(255, 19, 142, 244)
                                : Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      )),
            ),

            // button
            const Spacer(),

            CustomBtn(
                onTap: () {
                  if (isLast) {
                    // get method
                    Get.off(() => HomeScreen());
                    //  Navigator.pushReplacement(context ,MaterialPageRoute(builder: (context) => HomeScreen(),));
                  } else {
                    c.nextPage(
                        duration: Duration(milliseconds: 700),
                        curve: Curves.ease);
                  }
                },
                text: isLast ? 'Finished' : 'Next'),

            const Spacer(flex: 2),
          ],
        );
      },
    ));
  }
}
