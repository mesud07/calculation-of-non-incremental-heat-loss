import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/FourthPage/view/fourthPage.dart';
import 'package:untitled/SecondPage/view/secondPage.dart';
import 'package:untitled/ThirdPage/view/thirdPage.dart';

import 'FiftPage/view/fiftPage.dart';
import 'FirstPage/view/firstPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),

       getPages:
      [
        GetPage(name: "/firstPage",page : () => FirstPage(),transition: Transition.fadeIn),
        GetPage(name: "/secondPage",page : () => SecondPage(),transition: Transition.fadeIn),
        GetPage(name: "/thirdPage",page : () => ThirdPage(),transition: Transition.fadeIn),
        GetPage(name: "/fourthPage",page : () => FourthPage(),transition: Transition.fadeIn),
        GetPage(name: "/fifthPage",page : () => FiftPage(),transition: Transition.fadeIn),

      ],
      home: FirstPage(),
    );
  }
}

