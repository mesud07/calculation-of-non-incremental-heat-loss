import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
import 'package:untitled/utils/controller.dart';




class SecondPage extends StatefulWidget {
  

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  TextEditingController _disDuvarUzunlukController=TextEditingController();
  TextEditingController _disDuvarYukseklikController=TextEditingController();
  TextEditingController _katsayiController=TextEditingController();
  final _controller = Get.put(Controller());
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          Container(
              color: Colors.orangeAccent,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                
                child: Obx(()=>Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height*0.9,
                            child: Column(
                      
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Container(
                                  margin: EdgeInsets.only(top:30,left:30,right: 30,bottom: 10),
                                  height: 60,
                                  width: double.infinity,
                                  child: Text(
                                    "Dış Duvar bilgilerinizi giriniz",style: style1,)),




                                Container(
                                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                                    child: TextField(
                                      controller: _disDuvarUzunlukController,
                                    decoration: InputDecoration(
                                      hintText: _controller.totalDisDuvarUzunlukGet==0?"Toplam Dış Duvar Uzunluğu":_controller.totalDisDuvarUzunlukGet.toString(),
                                      border: OutlineInputBorder()
                                      )
                                    ),
                                  ),
                                
                                Container(
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                                  child: TextField(
                                    controller: _disDuvarYukseklikController,
                                  decoration: InputDecoration(
                                    hintText: _controller.totalDisDuvarUzunlukGet==0?"Yükseklik":_controller.totalDisDuvarUzunlukGet.toString(),
                                    border: OutlineInputBorder()
                                    )
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                                  child: TextFormField(
                                   controller: _katsayiController,
                                     
                                  decoration: InputDecoration(
                                    hintText: _controller.totalDisDuvarUzunlukGet==0?"Duvar Katsayısı":_controller.disDuvarKatsayisiGet.toString(),
                                    border: OutlineInputBorder()
                                    )
                                  ),
                                ),
                                        
                                Container(
                                  margin: EdgeInsets.all(30),
                                  height: 75,
                                  width: double.infinity,
                                  child: Text(
                                    'Duvar katsayısı "Arttırımsız ısı kaybı hesabı " yaparken sizin biliyor olmanız gereken bir değerdir.',style: GoogleFonts.poppins(fontSize: 15),)),
                                
                                KaydetButton(disDuvarUzunlukController: _disDuvarUzunlukController, controller: _controller, disDuvarYukseklikController: _disDuvarYukseklikController, katsayiController: _katsayiController),
                              ],
                            ),
                          ),
                       
                        Container(
                          alignment: Alignment.centerRight,
                          color: Colors.orangeAccent,
                          height: MediaQuery.of(context).size.height*1/10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                  Back(context, 1),
                                 Continue(context,3)
                            ],
                          ),
                        )
                      ],
                  ),
                ),
              ),
            ),
      );
    }
  }

