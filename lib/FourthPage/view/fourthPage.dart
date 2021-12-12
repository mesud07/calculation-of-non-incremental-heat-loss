import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
class FourthPage extends StatefulWidget {
 

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          Container(
              color: Colors.orangeAccent,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                
                child: Column(
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
                              "Tavan ve Taban bilgilerini giriniz",style: style1,)),
                             
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Genişlik",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),
                           Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Uzunluk",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),
                           Divider(
                                height: 20,
                                thickness: 5,
                        
                              ),
                              Text("TAVAN",style: style1,),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Katsayı",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),

                           Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Türü",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),
                              Divider(
                                height: 20,
                                thickness: 5,
                              ),
                              Text("TABAN",style: style1,),   
                         Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Katsayı",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),

                           Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Türü",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),
                             
                          
                        
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      color: Colors.orangeAccent,
                      height: MediaQuery.of(context).size.height*0.1,
                      child: Column(
                        children: [
                             Continue(context,5)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
           
        
    );
  }
}