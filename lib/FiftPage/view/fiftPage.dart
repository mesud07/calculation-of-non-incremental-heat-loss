import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
class FiftPage extends StatefulWidget {
 

  @override
  _FiftPageState createState() => _FiftPageState();
}

class _FiftPageState extends State<FiftPage> {
  bool isSwitch=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        
        child: isSwitch==true ? FloatingActionButton.extended(
          backgroundColor: Colors.blueAccent,
          onPressed: (){}, label: Row(
            children: [
            
            Icon(Icons.add,size: 30,),Text("Ekle",style: TextStyle(fontSize: 20),)],)):
            null,
      ),
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
                            height: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top:30,left:30,right: 30,),
                                  height: 30,
                                  width: double.infinity,
                                  child: Text(
                                    "İç duvar mevcut mu?",style: style1,)),
                               switchOfIcDuvar(),
                              
                              ],
                            ),
                          ),

                             



                         isSwitch==true ? Column(
                            children: [
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
                              hintText: "Katsayı",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),

                           Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: "Bitişik Olduğu Oda Türü",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),
                           Container(
                            padding: EdgeInsets.only(left: 40,right: 40),
                            child:Text("Not : Boşlukları doldurduktan sonra ekle butonuna basınız",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white),) ),
                            ],
                          ) : Container(
                            height: 335,
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
                             Continue(context,6)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
           
        
    );
  }
  
  Container switchOfIcDuvar() {
    return Container(
                               
                                height: 60,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                       isSwitch=true;   
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        
                                        decoration: BoxDecoration(
                                        color: isSwitch==true?Colors.blueAccent : Colors.white,

                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                                        ),
                                        child: Center(child: Text("Evet",style: isSwitch == true ? isSwitchText : style1,),),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          isSwitch=false;  
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        
                                        decoration: BoxDecoration(
                                        color: isSwitch==false?Colors.black : Colors.white,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                                        ),
                                      child: Center(child: Text("Hayır",style: isSwitch==false ? isSwitchText : style1,),),

                                      ),
                                    ),
                                  ],
                                ),
                              );
  }
}