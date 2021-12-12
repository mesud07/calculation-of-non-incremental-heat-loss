import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/FiftPage/view/fiftPage.dart';
import 'package:untitled/FirstPage/view/firstPage.dart';
import 'package:untitled/FourthPage/view/fourthPage.dart';
import 'package:untitled/SecondPage/view/secondPage.dart';
import 'package:untitled/ThirdPage/view/thirdPage.dart';
Widget Continue(BuildContext context,int value){
  return InkWell(
                               splashColor: Colors.red,
                               onTap: (){
                                 switch(value){
                                   
                                   case 2:
                      Get.toNamed('/secondPage');
                                   break;
                                   case 3:
                      Get.toNamed('/thirdPage');
                                   break;
                                   case 4:
                      Get.toNamed('/fourthPage');
                                   break;
                                   case 5:
                      Get.toNamed('/fifthPage');
                                   break;
                                   case 6:
                      Get.toNamed('/firstPage');
                                   break;
                                 }

                               },
                               child: Container(
                                
                                 width: 200,
                                  padding: EdgeInsets.only(right: 20),
                                        height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [Text("Devam Et ",style: GoogleFonts.poppins(fontSize: 25),),Icon(Icons.arrow_forward,size: 40,)],),
                                  ),
                             );
}