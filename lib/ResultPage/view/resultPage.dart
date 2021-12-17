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

  var elemanSayisi=5;
  var tabloUzunluk =5;

  double toplamCikacakAlan =0;
//Uzunluk x yükseklik= ToplamAlan
//çıkarılacak alan listesinde ki elemanların alan hesabı toplanır. 
//ToplamAlan dan çıkartılır.
//kalanAlan=ToplamAlan-cikarilacakAlanlar
//kalanAlanxkatsayi
//çıkarılacak alanlar kendi içinde katsayıları alanları ve adetleri çarpılacak şekilde bulunur.
//Tavan ve taban alanları hesaplanır. katsayıları ile çarpılır.


  
  @override
  Widget build(BuildContext context) {
  var toplamAlan=_controller.totalDisDuvarUzunlukGet*_controller.disDuvarYukseklikGet;
  var cikacakElemanList = _controller.cikarilacakElemanList;
  var icDuvarElemanList = _controller.icDuvarElemanList;
  print("ToplamAlan = "+toplamAlan.toString());
  _controller.cikarilacakElemanList.forEach((element) {
    var alan=element.yukseklik*element.uzunluk*element.adet;
    toplamCikacakAlan=toplamCikacakAlan+alan;
    var isikaybi=element.yukseklik*element.uzunluk*element.isiGecisKatsayisi*element.adet;
    print(element.name+"'ın alan hesabı"+alan.toString());
    print(element.name+"'ın ısı kaybı"+isikaybi.toString());
    
    }
    
    );
    double cikarilmisAlan=toplamAlan-toplamCikacakAlan;
    print("Çıkarılmış kalan alan"+cikarilmisAlan.toString());

        print("Toplam çıkarılacak alan"+toplamCikacakAlan.toString());

        double cikarilmisAlanIsiKaybi=cikarilmisAlan*_controller.disDuvarKatsayisiGet;
        print("Dış duvar sadece duvar ısı kaybı : "+cikarilmisAlanIsiKaybi.toString());


        cikacakElemanList.forEach((element,) {var i=0;print("cikacak eleman $i"+element.name);i++;});
        

  //debugPrint(weightData[1].name);
  
//sehirListDropDown.forEach((element) {print(element.value.toString());});
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
                              child: Center(child: Text("6753 kcal",style: resultStyle,))),
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
                                for(var i=0;i<cikacakElemanList.length;i++)
                                    TableRow(
                                      children: [
                                        for(var j=0;j<elemanSayisi;j++)
                                      Container(
                                        child: Center(
                                          child: Text(j==0?eleman.name:j==1?(eleman.yukseklik*eleman.uzunluk).toString():j==2?eleman.isiGecisKatsayisi.toString():j==3?"10":"200",
                                          style: tableTitle,
                                          )),),
                                    ]),



                                    //ic duvar elemanlarını yerleştir.
                                    for(var i=0;i<icDuvarElemanList.length;i++)
                                    TableRow(
                                      children: [
                                        for(var j=0;j<elemanSayisi;j++)
                                      Container(
                                        child: Center(
                                          child: Text(j==0?eleman.name:j==1?(eleman.yukseklik*eleman.uzunluk).toString():j==2?eleman.isiGecisKatsayisi.toString():j==3?"10":"200",
                                          style: tableTitle,
                                          )),),
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
 


  
}
