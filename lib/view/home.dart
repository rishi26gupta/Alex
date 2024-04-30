import 'dart:typed_data';

import 'package:alex/helper/global.dart';
import 'package:alex/helper/my_dailogs.dart';
import 'package:alex/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alex/view/home/home_provider.dart';
import 'package:lottie/lottie.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final fWatch = ref.watch(homeProvider);
    final fRead = ref.read(homeProvider);



    void checker(){
    if(textController.text == ""){
      MyDialog.info("Please provide description for image creation ");
    }
    else {

          fRead.textToImage(textController.text, context);
                          fRead.searchingChange(true);
    }
  }

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Creation with Alex'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:25),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context). imageTextColor1),
                          borderRadius: BorderRadius.circular(12.0)),
                      child: TextField(
                        textAlign: TextAlign.center,
                        onTapOutside: (e)=> FocusScope.of(context).unfocus(),
                        controller: textController,
                        style: TextStyle(
                            color:  Theme.of(context).textColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            ),
                        cursorColor: const Color.fromARGB(255, 72, 165, 241),
                        maxLines: null,
                        minLines: 3,
                        decoration: InputDecoration(
                            hintText:
                                'Type here your wonderfull imaginations \n & I will create for you',
                            hintStyle: TextStyle(
                                color:  Theme.of(context).imageTextColor1,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Colors.blue)),
                            
                            contentPadding: const EdgeInsets.all(12.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  fWatch.isLoading == true
                      ? Container(
                          alignment: Alignment.center,
                          height: 320,
                          width: 320,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              ),
                          child: Image.memory(fWatch.imageData!),
                        )
                      : Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Container(
                            alignment: Alignment.center,
                            height: 320,
                            width: 320,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                              12.0,
                            )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                
                                Lottie.asset('assets/lottie/ai_play.json',
                                height: mq.height*.29,
                                ),
                                Text(
                                  'No Image has been generated yet.',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 130, 125, 125),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                          checker();
                          // fRead.textToImage(textController.text, context);
                          // fRead.searchingChange(true);
                          
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: mq.height*.07,
                            width: mq.width*.39,
                            decoration: BoxDecoration(gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.blue, Color.fromARGB(255, 112, 171, 201)]),
                                color: Colors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: fWatch.isSearching == false
                                ? Text(
                                    'Create',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                      ),

                    

                      GestureDetector(
                        onTap: () {
                          fRead.loadingChange(false);
                          textController.clear();
                        },
                        child: Container(
                          alignment: Alignment.center,
                         height: mq.height*.07,
                            width: mq.width*.39,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Color.fromARGB(255, 233, 43, 106), Color.fromARGB(255, 238, 76, 64)]),
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Text(
                            'Clear',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                             ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }

  
}


































// import 'package:alex/view/home/controller/home_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';


// class  HomeScreen extends StatelessWidget { 
//   const HomeScreen({super.key});
  
//    @override
//   Widget build(BuildContext context) {


//     return Scaffold(


//        body:SafeArea(child: 
//        Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('evison',style:TextStyle(color: Colors.blue,
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: GoogleFonts.openSans().fontFamily),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         Container(
//                            height:320,
//                            width:320,
//                            decoration:BoxDecoration(
//                             border: Border.all(color: Colors.blue),
//                             borderRadius: BorderRadius.circular(12.0),
//                            ) ,

//                            child: Consumer<HomeProvider>(
//                             builder: (context, provider, child){
//                                 return Image.memory(provider.imageData!);
//                             },
//                             ),
                            
//                         ),
//                         Container(
//                            height:320,
//                            width:320,
//                            decoration:BoxDecoration(
//                             border: Border.all(color: Colors.blue),
//                             borderRadius: BorderRadius.circular(12.0),
//                            ) ,

//                            child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                             Icon(Icons.image_outlined,
//                             color: Colors.blue,
//                             size: 100,
//                             ),
//                             SizedBox(height:30,
//                             ),
//                              Text('no image generated yet',style:TextStyle(color: Colors.blue,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: GoogleFonts.openSans().fontFamily),
//                         ),

//                            ],)
//                         ),
                        
                        
//        ],)
//        ) ,

//     );
//   }
// }
