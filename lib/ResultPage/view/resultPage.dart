import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/ThirdPage/model/c%C4%B1karilacakAlanModel.dart';

import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
import 'package:untitled/utils/controller.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({ Key? key }) : super(key: key);




  @override
  
  _ResultPageState createState() => _ResultPageState();
}
class _ResultPageState extends State<ResultPage> {
  final _controller = Get.put(Controller());
  List basliklar=["Elemanlar","H.G.A","I.G.K","S.F","A.I.K"];
  
 CikarilacakEleman eleman =CikarilacakEleman("D.H",10,11,2,3);
  
  double toplamCikacakAlan =0;
  double cikarilacakElemanlarToplamIsiKaybi =0;
  double icDuvarElemanToplamIsiKaybi=0;
  double cikarilmisAlan=0;
  var sicaklikFarki;
  var cikacakElemanList;
  var icDuvarElemanList;
  var toplamIsiKaybi;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cikacakElemanList = _controller.cikarilacakElemanList;
    icDuvarElemanList = _controller.icDuvarElemanList;
   toplamIsiKaybi= toplamIsiKaybiHesapla();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sonuç Sayfası"),centerTitle: true,),
      body: 
          
               Container(
                 padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color:Colors.orangeAccent,
                  child: SingleChildScrollView(
                    
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    
                    child: Column(
                      children: [
                        Container(
                          child: Text("Toplam Arttırımsız Isı Kaybı",style: style1,),
                        ),
              
                        Container(
                          margin:EdgeInsets.all(10),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1000),
                            elevation: 30,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.red
                                ),
                              child: Center(child: Text(toplamIsiKaybi.toString(),style: resultStyle,))),
                          ),
                        ),
              
                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                              height: MediaQuery.of(context).size.height*0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                 Text("H.G.A = Hesaba Girilen Alan",style: resultPageDefined,),
                                 Text("I.G.K = Isı Geçiş Katsayısı",style: resultPageDefined,),
                                 Text("S.F = Sıcaklık Farklı",style: resultPageDefined,),
                                 Text("A.J.K = Arttırımsız Isı Kaybı",style: resultPageDefined,),
                                    
                                ],
                              ),
                            ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                          child: Table(
                            textDirection: TextDirection.ltr,
                            border: TableBorder.all(width: 2.0,color: Colors.grey),
                            defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                            children: [
                               
                                TableRow(children: [
                                  
                               for(var i =0;i<basliklar.length;i++)

                                 Container(
                                   child: Center(
                                     child: Text(basliklar[i],
                                     style: tableTitle,
                                     )),),
                                ],
                                ),

                                  //toplam alandan cıkarılmış alanları yerleştir.
                              
                          
                            //Dış duvardan çıkacak olan elemanlar
                              for(var i=0;i<cikacakElemanList.length;i++)
                                  
                                    
                                    TableRow(
                                      children: [
                                        for(var j=0;j<5;j++)
                                     
                                      Container(
                                        child: Center(
                                          child: Text(j==0?cikacakElemanList[i].name:j==1?(cikacakElemanList[i].yukseklik*cikacakElemanList[i].uzunluk).toString():j==2?cikacakElemanList[i].isiGecisKatsayisi.toString():j==3?(_controller.sehir.value-_controller.hesabiYapilacakOdaGet.value).toString():
                                         (cikacakElemanList[i].yukseklik*cikacakElemanList[i].uzunluk*cikacakElemanList[i].isiGecisKatsayisi).toString(),
                                          style: tableTitle,
                                          )
                                          
                                          ),),
                                    ]),



                                    //İç duvar elemanları
                                    for(var i=0;i<icDuvarElemanList.length;i++)
                                  
                                    
                                    TableRow(
                                      children: [
                                        for(var j=0;j<5;j++)
                                        
                                      Container(
                                        child: Center(
                                          child: Text(j==0?icDuvarElemanList[i].bitisikOlduguOda.roomName:j==1?(icDuvarElemanList[i].yukseklik*icDuvarElemanList[i].uzunluk).toString():j==2?icDuvarElemanList[i].katsayi.toString():j==3?(_controller.hesabiYapilacakOdaGet.value-icDuvarElemanList[i].bitisikOlduguOda.value).toString():
                                         (icDuvarElemanList[i].yukseklik*icDuvarElemanList[i].uzunluk*icDuvarElemanList[i].katsayi).toString(),
                                          style: tableTitle,
                                          )
                                          
                                          ),),
                                    ]),


                                   TableRow(
                                      children: [
                                        for(var j=0;j<5;j++)
                                     
                                      Container(
                                        child: Center(
                                          child: Text(
                                          j==0? "Taban":
                                          j==1?(_controller.tabanTavanGenislikGet*_controller.tabanTavanUzunlukGet).toString():
                                          j==2?_controller.tabanKatsayiGet.toString():
                                          j==3?(_controller.hesabiYapilacakOdaGet.value-_controller.tabanSicaklikGet).toString():
                                          (_controller.tabanTavanUzunlukGet*_controller.tabanTavanGenislikGet*_controller.tabanKatsayiGet).toString(),
                                          style: tableTitle,
                                          )
                                          
                                          ),),
                                    ]),
                               
                                TableRow(
                                      children: [
                                        for(var j=0;j<5;j++)
                                     
                                      Container(
                                        child: Center(
                                          child: Text(
                                          j==0? "Tavan":
                                          j==1?(_controller.tabanTavanGenislikGet*_controller.tabanTavanUzunlukGet).toString():
                                          j==2?_controller.tavanKatsayiGet.toString():
                                          j==3?(_controller.hesabiYapilacakOdaGet.value-_controller.tavanSicaklikGet).toString():
                                          (_controller.tabanTavanUzunlukGet*_controller.tabanTavanGenislikGet*_controller.tavanKatsayiGet).toString(),
                                          style: tableTitle,
                                          )
                                          
                                          ),),
                                    ]),
                              
                                
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
  }

  double disDuvarKalanIsiKaybiHesapla(){
  var toplamAlan=_controller.totalDisDuvarUzunlukGet*_controller.disDuvarYukseklikGet;
  //33
        toplamCikacakAlan= cikarilacakElemanlarAlanTopla();

        cikarilmisAlan=toplamAlan-toplamCikacakAlan;  

        double cikarilmisAlaninIsiKaybi=cikarilmisAlan*_controller.disDuvarKatsayisiGet*(_controller.hesabiYapilacakOdaGet.value-_controller.sehir.value);
        print("Dış duvar sadece duvar ısı kaybı : "+cikarilmisAlaninIsiKaybi.toString());


  return cikarilmisAlaninIsiKaybi;
  }




  double cikarilacakElemanlarAlanTopla(){
 _controller.cikarilacakElemanList.forEach((element) {
    double alan=element.yukseklik*element.uzunluk*element.adet;
    toplamCikacakAlan+=alan;
    print("Çıkarılacak Elemanların Toplam alan hesabı : "+alan.toString());
    });
    return toplamCikacakAlan;
  }



double cikarilacakElemanIsiKaybiTopla(){
  _controller.cikarilacakElemanList.forEach((element) {
    double isikaybi=element.yukseklik*element.uzunluk*element.isiGecisKatsayisi*element.adet;
    cikarilacakElemanlarToplamIsiKaybi+=isikaybi;
    
    print(element.name+"'ın ısı kaybı"+isikaybi.toString());
  });
  return cikarilacakElemanlarToplamIsiKaybi;
}



double icDuvarElemanlarIsiKaybiTopla(){
  _controller.icDuvarElemanList.forEach((element) {
    icDuvarElemanToplamIsiKaybi+=element.yukseklik*element.uzunluk*element.katsayi*element.sicaklikFarki;

  });
  print("Toplam İç duvar ısı kaybı : "+icDuvarElemanToplamIsiKaybi.toString());

  return icDuvarElemanToplamIsiKaybi;
}

double toplamIsiKaybiHesapla(){
 double d_DuvarIsiKaybi=disDuvarKalanIsiKaybiHesapla();
 double c_ElemanlarIsiKaybi=cikarilacakElemanIsiKaybiTopla();
 double icDuvarElemanIsiKaybi = icDuvarElemanlarIsiKaybiTopla();
 double tavanIsiKaybi = _controller.tabanTavanGenislikGet*_controller.tabanTavanUzunlukGet*_controller.tavanKatsayiGet*_controller.tavanSicaklikGet;
 double tabanIsiKaybi = _controller.tabanTavanGenislikGet*_controller.tabanTavanUzunlukGet*_controller.tabanKatsayiGet*_controller.tabanSicaklikGet;

return d_DuvarIsiKaybi+c_ElemanlarIsiKaybi+icDuvarElemanIsiKaybi+tavanIsiKaybi+tabanIsiKaybi;
}
   
}
