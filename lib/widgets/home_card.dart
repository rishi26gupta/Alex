import 'package:alex/helper/global.dart';
import 'package:alex/main.dart';
import 'package:alex/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue.withOpacity(.2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18))),
        elevation: 0,
        margin: EdgeInsets.only(bottom: mq.height * .02),
        child: InkWell(
          onTap: homeType.OnTap,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: homeType.leftAlign
              ? Row(
                  children: [
                    Padding(
                      padding: homeType.Padding,
                      child: Lottie.asset('assets/lottie/${homeType.lottie}',
                          width: mq.width * .36),
                    ),
                    Spacer(),
                    Text(homeType.Title,
                        style: TextStyle(
                            color: Theme.of(context).textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5)),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Spacer(flex: 2),
                    Text(homeType.Title,
                        style: TextStyle(
                           color: Theme.of(context).textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5)),
                    Spacer(),
                    Container(
                      width: mq.width * .36,
                      child: Padding(
                        padding: homeType.Padding,
                        child: Lottie.asset(
                          'assets/lottie/${homeType.lottie}',
                        ),
                      ),
                    ),
                  ],
                ),
        ));
  }
}
