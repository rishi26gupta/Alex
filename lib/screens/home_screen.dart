import 'package:alex/apis/apis.dart';
import 'package:alex/helper/pref.dart';
import 'package:alex/model/home_type.dart';
import 'package:alex/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../helper/global.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final _isDarkMode = Pref.isDarkMode.obs;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    // intializing device size
    mq = MediaQuery.sizeOf(context);

    // sample api call

    //APIs.getAnswer('hii');

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        centerTitle: true,
        title: Text("ALEX: Your AI Assistant",
                ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 7),
            onPressed: () {
                  Get.changeThemeMode(
                    _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

                _isDarkMode.value = !_isDarkMode.value;
                Pref.isDarkMode = _isDarkMode.value;
            },
            icon: Obx(()=>
            
             Icon(
              _isDarkMode.value ?
               Icons.brightness_2_rounded :
              Icons.brightness_6_rounded)),

          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * .04, vertical: mq.height * .015),
        children: HomeType.values.map((e) =>
         HomeCard(homeType: e)).toList(),
      )
      .animate().fade( duration: Duration(seconds: 2), curve: Curves.easeIn),
    );
  }
}
