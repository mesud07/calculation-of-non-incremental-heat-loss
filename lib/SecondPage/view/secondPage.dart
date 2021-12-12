import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';

class SecondPage extends StatefulWidget {
  

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
                              "Dış Duvar bilgilerinizi giriniz",style: style1,)),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Toplam Dış Duvar Uzunluğu",
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
                              hintText: "Duvar katsayısı",
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
                          
                        
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      color: Colors.orangeAccent,
                      height: MediaQuery.of(context).size.height*1/5,
                      child: Column(
                        children: [
                             Continue(context,3)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
           
        
    );
  }
}