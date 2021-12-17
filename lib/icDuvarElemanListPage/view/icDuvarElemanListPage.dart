import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/FirstPage/model/odalarModel.dart';
import 'package:untitled/datahelper/style.dart';
import 'package:untitled/utils/controller.dart';
class IcDuvarElemanListPage extends StatefulWidget {



  @override
  
  _IcDuvarElemanListPage createState() => _IcDuvarElemanListPage();
}

class _IcDuvarElemanListPage extends State<IcDuvarElemanListPage> {
  final _controller = Get.put(Controller());
  var elemanList=[];
   Odalar roomOfIndex= Odalar("",1);

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    elemanList=_controller.icDuvarElemanList;
  }
  @override
  Widget build(BuildContext context) {
  

    
   

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: Text("Bitişik Olan Odalar",style: GoogleFonts.poppins(fontSize:20,fontWeight: FontWeight.bold ),),),
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
                          shrinkWrap: true,
                          itemCount: _controller.icDuvarElemanList.length,
                          itemBuilder: (context,index){
                            roomOfIndex=elemanList[index].bitisikOlduguOda;
                            print("qewe"+roomOfIndex.toString());
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
                                             roomOfIndex.roomName,style:GoogleFonts.poppins(fontSize: 16,)),
                                            ),
                                             Container(
                                               padding: EdgeInsets.only(left: 10),
                                              alignment: Alignment.centerLeft,
                                              child: Text("Sıcaklık Farkı : "+
                                             _controller.icDuvarElemanList[index].sicaklikFarki.toString(),style:GoogleFonts.poppins(fontSize: 16,)),
                                            ),
                                             Container(
                                               padding: EdgeInsets.only(left: 10),
                                              alignment: Alignment.centerLeft,
                                              child: Text("Sıcaklık Farkı : "+
                                             _controller.icDuvarElemanList[index].sicaklikFarki.toString(),style:GoogleFonts.poppins(fontSize: 16,)),
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
                                              Text("Uzunluk : "+_controller.icDuvarElemanList[index].uzunluk.toString(),style:GoogleFonts.poppins(fontSize: 14,),),
                                              Text("h : "+_controller.icDuvarElemanList[index].yukseklik.toString(),style:GoogleFonts.poppins(fontSize: 14,),),
                                              Text("I.G.Katsayısı : "+_controller.icDuvarElemanList[index].katsayi.toString(),style:GoogleFonts.poppins(fontSize: 14,),),
                                      
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
                                              _controller.icDuvarElemanList.removeAt(index);
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
