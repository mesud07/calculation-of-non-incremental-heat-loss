import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/FiftPage/view/fiftPage.dart';
import 'package:untitled/FirstPage/view/firstPage.dart';
import 'package:untitled/FourthPage/view/fourthPage.dart';
import 'package:untitled/SecondPage/view/secondPage.dart';
import 'package:untitled/ThirdPage/view/thirdPage.dart';
import 'package:untitled/utils/controller.dart';
final _controller = Get.put(Controller());
Widget Continue(BuildContext context,int page){
  return InkWell(
                               splashColor: Colors.red,
                               onTap: (){
                                 switch(page){
                                   
                                   case 2:
                      Get.toNamed('/secondPage');
                                   break;
                                   case 3:
                                   
                      Get.toNamed('/thirdPage');
                      print(_controller.sehir.value);
                                   break;
                                   case 4:
                      Get.toNamed('/fourthPage');
                                   break;
                                   case 5:
                      Get.toNamed('/fifthPage');
                                   break;
                                   case 6:
                      Get.toNamed('/resultPage');
                                   break;
                                 }

                               },
                               child: Container(
                                
                                 width: 200,
                                  padding: EdgeInsets.only(right: 20),
                                        height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [Text(page==6?"Hesapla":"Devam Et ",style: GoogleFonts.poppins(fontSize: 25),),Icon(Icons.arrow_forward,size: 40,)],),
                                  ),
                             );
}

Widget Back(BuildContext context,int page){
  return InkWell(
                               splashColor: Colors.red,
                               onTap: (){
                                 switch(page){
                                   case 1:
                      Get.toNamed('/firstPage');
                                   break;
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
                      Get.toNamed('/resultPage');
                                   break;
                                 }

                               },
                               child: Container(
                                
                                 
                                  padding: EdgeInsets.only(right: 20),
                                        height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [Icon(Icons.arrow_back,size: 40,),Text("Geri ",style: GoogleFonts.poppins(fontSize: 25),),],),
                                  ),
                             );
}

class KaydetButton extends StatelessWidget {
  const KaydetButton({
    Key? key,
    required TextEditingController disDuvarUzunlukController,
    required Controller controller,
    required TextEditingController disDuvarYukseklikController,
    required TextEditingController katsayiController,
  }) : _disDuvarUzunlukController = disDuvarUzunlukController, _controller = controller, _disDuvarYukseklikController = disDuvarYukseklikController, _katsayiController = katsayiController, super(key: key);

  final TextEditingController _disDuvarUzunlukController;
  final Controller _controller;
  final TextEditingController _disDuvarYukseklikController;
  final TextEditingController _katsayiController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(double.parse(_disDuvarUzunlukController.text));
        _controller.totalDisDuvarUzunlukSet=double.parse(_disDuvarUzunlukController.text);
        _controller.disDuvarYukseklikSet=double.parse(_disDuvarYukseklikController.text);
        _controller.disDuvarKatsayisiSet=double.parse(_katsayiController.text);
        print(_controller.totalDisDuvarUzunlukGet.toString() +" "+ _controller.disDuvarYukseklikGet.toString() +" "+ _controller.disDuvarKatsayisiGet.toString());
                
                
      },
      child: Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text("Kaydet",style:TextStyle(fontSize:20,color:Colors.white,)),),
    ));
  }
}