import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/ThirdPage/model/c%C4%B1karilacakAlanModel.dart';
import 'package:untitled/cikarilacakElemanListPage/view/cikarilacakElemanListPage.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
import 'package:untitled/utils/controller.dart';
class ThirdPage extends StatefulWidget {
  const ThirdPage({ Key? key }) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final _controller = Get.put(Controller());

  TextEditingController yukseklikController=TextEditingController();
  TextEditingController uzunlukController=TextEditingController();
  TextEditingController isiGecisKatsayisiController=TextEditingController();
  TextEditingController adetController=TextEditingController();


  String secilenEleman="Pencere";
  double yukseklik=0;
  double uzunluk =0;
  double isiGecisKatsayisi=0;
  int adet=0;

  List<String> elemanlar=["Pencere","Kapı","Çift Katlı Pencere"];

  List<DropdownMenuItem<String>> elemanListDropDown=[];
  


  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setElemanlarItems(elemanlar);
  }
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
                              "Çıkarılacak Alan bilgilerini Giriniz",style: style1,)),

                              


                          //Çıkarılacak eleman türü
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
                        value: secilenEleman,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 8,
                        style: GoogleFonts.aBeeZee(fontSize: 20,color:Colors.black),
                        underline: Container(
                              height: 0,
                              color: Colors.orangeAccent,
                        ),
                        onChanged: (newValue) {
                              setState(() {
                                secilenEleman = newValue!;
                                print("new value :"+newValue);
                              });
                        },
                        items: elemanListDropDown,
                      ),
                                ),
                              ),
                            ],
                          ),


                           Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                              controller: yukseklikController,
                               onChanged: (value){
                                 yukseklik=double.parse(value);
                                 print(yukseklik);
                                 
                                 },
                              
                              keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                             
                              hintText: "Yükseklik",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),


                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                              controller: uzunlukController,
                              onChanged: (value){
                                 uzunluk=double.parse(value);
                                 print(uzunluk);
                                 
                                 },
                                 keyboardType: TextInputType.number,
                              
                            decoration: InputDecoration(
                              hintText: "Uzunluk",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),


                           Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                              controller: isiGecisKatsayisiController,
                              onChanged: (value){
                                 isiGecisKatsayisi=double.parse(value);
                                 print(isiGecisKatsayisi);
                                 
                                 },
                              
                              keyboardType: TextInputType.number,

                            decoration: InputDecoration(
                              hintText: "Isı Geçiş Katsayısı",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),


                        Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: TextField(
                              
                              controller: adetController,
                               onChanged: (value){
                                 adet=int.parse(value);
                                 print(adet);
                                 
                                 },
                                 keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Adet",
                              border: OutlineInputBorder()
                              )
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              //EKLENEN ALANLAR
                              Container(
                            
                            alignment: Alignment.centerRight,
                            // color: Colors.black,
                      margin: EdgeInsets.only(top: 10,left: 20),
                      
                      child: FloatingActionButton.extended(
                        heroTag: 1,
                        backgroundColor: Colors.black,
                        onPressed: (){

                         Get.to(CikarilacakElemanListPage(),transition: Transition.fadeIn);
                        }, label: Row(
                          children: [
                          
                          Icon(Icons.list,size: 30,),Text("Eklenen Alanlar",style: TextStyle(fontSize: 15),)],))
                       ),



                       //EKLE BUTONU
                              Container(
                                
                                alignment: Alignment.centerRight,
                                // color: Colors.black,
                      margin: EdgeInsets.only(top: 10,right: 20),
                      
                      child: FloatingActionButton.extended(
                        heroTag: 2,
                        backgroundColor: Colors.blueAccent,
                        onPressed: (){

                              _controller.cikarilacakElemanList.add(CikarilacakEleman(secilenEleman, yukseklik, uzunluk, isiGecisKatsayisi, adet));
                                CikarilacakEleman a = _controller.cikarilacakElemanList.first;
                                print("uzunluk :"+a.uzunluk.toString());
                                print("Liste eleman sayısı : "+_controller.cikarilacakElemanList.length.toString());
                        }, label: Row(
                              children: [
                              
                              Icon(Icons.add,size: 30,),Text("Ekle",style: TextStyle(fontSize: 20),)],))
                       ),
                            ],
                          ),
                            
                          
                        
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
                              Back(context, 2),
                             Continue(context,4)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
           
        
    );
  }

   setElemanlarItems(List<String> elemanList) {
 
      for (String eleman in elemanList) {
            setState(() {
              elemanListDropDown.add(DropdownMenuItem<String>(
                  value: eleman,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        eleman,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )));
            });
          }

  }
}