import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
class ThirdPage extends StatefulWidget {
  const ThirdPage({ Key? key }) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
                      height: MediaQuery.of(context).size.height*4/5,
                      child: Column(
                        
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:30,left:30,right: 30,bottom: 10),
                            height: 60,
                            width: double.infinity,
                            child: Text(
                              "Çıkarılacak Alan bilgilerini Giriniz",style: style1,)),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Eleman Türü",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),
                           Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Yükseklik",
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

                           Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Isı Geçiş Katsayısı",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),

                        Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Adet",
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
                      height: MediaQuery.of(context).size.height*1/5,
                      child: Column(
                        children: [
                             Continue(context,4)
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