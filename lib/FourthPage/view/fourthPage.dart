import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
import 'package:untitled/utils/controller.dart';
class FourthPage extends StatefulWidget {
 

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  String secilenTabanTuru="Seciniz";
    String secilenTavanTuru="Seciniz";
    final _controller = Get.put(Controller());
    TextEditingController _genislikController= TextEditingController();
        TextEditingController _uzunlukController= TextEditingController();

    TextEditingController _tavanKatsayiController= TextEditingController();

    TextEditingController _tabanKatsayiController= TextEditingController();


  List<String> turler=["Seciniz","Çimento","Tuğla","Taş"];
  List<DropdownMenuItem<String>> turListDropDown=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setElemanlarItems(turler);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:  Container(
                        alignment: Alignment.centerRight,
                        color: Colors.orangeAccent,
                        height: MediaQuery.of(context).size.height*1/10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                Back(context, 3),
                               Continue(context,5)
                          ],
                        ),
                      ),
      body: 
          Obx(()=>Container(
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
                                controller: _genislikController,
                              decoration: InputDecoration(
                                hintText: _controller.tabanTavanGenislikGet==0?"Genişlik" : _controller.tabanTavanGenislikGet.toString(),
                                border: OutlineInputBorder()
                                )
                              ),
                            ),
                             Container(
                              margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                              child: TextField(
                               controller:_uzunlukController,
                              decoration: InputDecoration(
                                hintText: _controller.tabanTavanUzunlukGet==0?"Uzunluk" : _controller.tabanTavanUzunlukGet.toString(),
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
                                controller: _tavanKatsayiController,
                              decoration: InputDecoration(
                               
                               hintText: _controller.tavanKatsayiGet==0?"Katsayı":_controller.tavanKatsayiGet.toString(),
                                border: OutlineInputBorder()
                                )
                              ),
                            ),
          
                              Row(
                              children: [
          
                                Container(
                              margin: EdgeInsets.only(left:20,top:30,bottom: 10),
                              height: 40,
                              
                              child: Text(
                                "Eleman Türü",style: elemanTuruText,)),
                                Container(
                                  
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                                  height: 40,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade100),
                                  child: Center(
                                  child :DropdownButton<String>(
                                  value: _controller.tavanElemanTuruGet,
                                  //icon: const Icon(Icons.arrow_downward),
                                  elevation: 8,
                                  style: GoogleFonts.poppins(fontSize: 15,color:Colors.black),
                                  underline: Container(
                                        height: 0,
                                        color: Colors.orangeAccent,
                                  ),
                                  onChanged: (newValue) {
                                        _controller.tavanElemanTuruSet=newValue;
                                  },
                                   items: turListDropDown,
                        ),
                                  ),
                                ),
                              ],
                            ),
                                Divider(
                                  height: 20,
                                  thickness: 5,
                                ),
                                Text("TABAN",style: style1,),   
                           Container(
                              margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                              child: TextField(
                                controller: _tabanKatsayiController,
                              decoration: InputDecoration(
                                hintText: _controller.tabanKatsayiGet==0?"Katsayı":_controller.tabanKatsayiGet.toString(),
                                border: OutlineInputBorder()
                                )
                              ),
                            ),
          
                              Row(
                              children: [
          
                                Container(
                              margin: EdgeInsets.only(left:20,top:30,bottom: 10),
                              height: 40,
                              
                              child: Text(
                                "Eleman Türü",style: elemanTuruText,)),
                                Container(
                                  
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                                  height: 40,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade100),
                                  child: Center(
                                  child :DropdownButton<String>(
                                  value: _controller.tabanElemanTuruGet,
                                  //icon: const Icon(Icons.arrow_downward),
                                  elevation: 8,
                                  style: GoogleFonts.poppins(fontSize: 15,color:Colors.black),
                                  underline: Container(
                                        height: 0,
                                        color: Colors.orangeAccent,
                                  ),
                                  onChanged: (newValue) {
                                       _controller.tabanElemanTuruSet=newValue;
                                  },
                                   items: turListDropDown,
                        ),
                                  ),
                                ),


                                
                              ],
                            ),
                               
                        InkWell(
      onTap: (){
        
        _controller.tabanTavanGenislikSet=double.parse(_genislikController.text);
        _controller.tabanTavanUzunlukSet=double.parse(_uzunlukController.text);
        _controller.tavanKatsayiSet=double.parse(_tavanKatsayiController.text);
        _controller.tabanKatsayiSet=double.parse(_tabanKatsayiController.text);

        print(_controller.tabanTavanGenislikGet.toString()+_controller.tabanTavanUzunlukGet.toString()+_controller.tabanElemanTuruGet);

                
                
      },
      child: Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text("Kaydet",style:TextStyle(fontSize:20,color:Colors.white,)),),
    )),
                          
                          ],
                        ),
                      ),
                        
                    ],
                  ),
                ),
              ),
          ),
           
        
    );
  }
  setElemanlarItems(List<String> elemanList) {
 
      for (String eleman in elemanList) {
            setState(() {
              turListDropDown.add(DropdownMenuItem<String>(
                  value: eleman,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        eleman,
                        
                      ),
                    ),
                  )));
            });
          }

  }
}