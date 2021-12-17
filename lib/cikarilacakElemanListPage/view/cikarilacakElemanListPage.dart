import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/datahelper/style.dart';
import 'package:untitled/utils/controller.dart';
class CikarilacakElemanListPage extends StatefulWidget {



  @override
  
  _CikarilacakElemanListPage createState() => _CikarilacakElemanListPage();
}

class _CikarilacakElemanListPage extends State<CikarilacakElemanListPage> {
  final _controller = Get.put(Controller());
  var elemanList=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    elemanList=_controller.cikarilacakElemanList;
  }
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: Text("Tüm Alanlar",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.bold ),),),
      body: 
          Container(
              color: Colors.orangeAccent,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                
                child: Obx(()=> Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                      
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: _controller.cikarilacakElemanList.length,
                          itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){},
                            child: Container(
                                 // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  margin: EdgeInsets.all(10),
                                  
                              child: Material(
                                borderRadius: BorderRadius.circular(10),
                                elevation: 10,
                                child: Container(
                                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(10),
                                  height: MediaQuery.of(context).size.height/6,
                                  width: MediaQuery.of(context).size.width,
                                  
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        width: MediaQuery.of(context).size.width*2/6,
                                        
                                        
                                        child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          
                                          children: [
                                            Container(
                                               padding: EdgeInsets.only(left: 10),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                              _controller.cikarilacakElemanList[index].name,style:GoogleFonts.poppins(fontSize: 16,)),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 10),
                                              alignment: Alignment.centerLeft,
                                              
                                              
                                              child: Text(
                                                
                                              "Adet : "+_controller.cikarilacakElemanList[index].adet.toString(),style:GoogleFonts.poppins(fontSize: 13,),),
                                            ),
                                          ],
                                        ),
                                      ),



                                      //Sağ taraf
                                      Material(
                                        borderRadius: BorderRadius.circular(10),
                                        elevation: 5,
                                        child: Container(
                                           width: MediaQuery.of(context).size.width*2/6,
                                           padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.orange.withOpacity(0.5),
                                      
                                          ),
                                          
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("Uzunluk : "+_controller.cikarilacakElemanList[index].uzunluk.toString(),style:GoogleFonts.poppins(fontSize: 14,),),
                                              Text("h : "+_controller.cikarilacakElemanList[index].yukseklik.toString(),style:GoogleFonts.poppins(fontSize: 14,),),
                                              Text("I.G.Katsayısı : "+_controller.cikarilacakElemanList[index].isiGecisKatsayisi.toString(),style:GoogleFonts.poppins(fontSize: 14,),),
                                      
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        
                                        width: MediaQuery.of(context).size.width/10,
                                       
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(onPressed: (){
                                              _controller.cikarilacakElemanList.removeAt(index);
                                            }, icon: Icon(Icons.delete,color: Colors.orange,)),
                                            IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.orange,))

                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      
                        
                        
                    ],
                  ),
                ),
              ),
            ),
           
        
    );
  }
 
 
}
