import 'package:alex/helper/global.dart';
import 'package:alex/helper/pref.dart';
import 'package:alex/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alex/view/home/home_provider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Pref.initialize(); 
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]
  );
  runApp(const  ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   return  GetMaterialApp(
    title: appName,
    debugShowCheckedModeBanner: false,

   themeMode: Pref.defaultTheme,


   
  // dark mode theme
    darkTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
      appBarTheme:   AppBarTheme(
        elevation: 3,
        centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500),
                
       
    ),
    ),


    // light  mode theme
    theme: ThemeData(appBarTheme:   AppBarTheme(
        elevation: 3,
        centerTitle: true,
        backgroundColor: Colors.white,
         iconTheme: IconThemeData(color: Colors.blue,),
            titleTextStyle: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500),
                
       
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
    ),


    home: splashscreen(),
   );
  }
}


// light text color1
extension AppTheme on ThemeData{

  Color get lightTextColor1 => brightness == Brightness.dark ? Colors.white70 :  Colors.black54;


  Color get imageTextColor1 => brightness == Brightness.dark ? Colors.white70 : Color.fromARGB(255, 41, 41, 41);

  Color get ButtonColor => brightness == Brightness.dark ? const Color.fromARGB(255, 5, 98, 174) :  Colors.blue;
  
  Color get textColor => brightness == Brightness.dark ? Colors.white70 :  Colors.black87;
  }


// light text color2



