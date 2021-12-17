import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/FiftPage/model/icDuvarModel.dart';
import 'package:untitled/FirstPage/model/odalarModel.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
import 'package:untitled/icDuvarElemanListPage/view/icDuvarElemanListPage.dart';
import 'package:untitled/utils/controller.dart';

class FiftPage extends StatefulWidget {
  @override
  _FiftPageState createState() => _FiftPageState();
}

class _FiftPageState extends State<FiftPage> {
  Odalar bitisikOlanOda = Odalar("Salon", 22);
  TextEditingController yukseklikController = TextEditingController();
  TextEditingController uzunlukController = TextEditingController();
  TextEditingController katsayiController = TextEditingController();
  TextEditingController bitisikOlduguOda = TextEditingController();
  final _controller = Get.put(Controller());

 static const Map<String,int>odalar={
      //Gerçek oda sıcaklık değerleri eklenecek
      "Salon":22,
      "Banyo": 11,
      "Mutfak": 12,
      "Oturma Odası": 13,
      "Hol" : 18,
      "Yatak Odası":20
      };

  List<DropdownMenuItem<Odalar>> odalarListDropDown = [];

  bool isSwitch = false;
  @override
  void initState() {
    List<Odalar> odalarList =
  odalar.entries.map( (entry) => Odalar(entry.key, entry.value)).toList();
    setOdalarItems(odalarList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.orangeAccent,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
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
                                margin: EdgeInsets.only(
                                  top: 30,
                                  left: 30,
                                  right: 30,
                                ),
                                height: 30,
                                width: double.infinity,
                                child: Text(
                                  "İç duvar mevcut mu?",
                                  style: style1,
                                )),
                            switchOfIcDuvar(),
                          ],
                        ),
                      ),
                      isSwitch == true
                          ? Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                      controller: yukseklikController,
                                      decoration: InputDecoration(
                                          hintText: "Yükseklik",
                                          border: OutlineInputBorder())),
                                ),

                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextField(
                                                                        keyboardType: TextInputType.number,

                                      controller: uzunlukController,
                                      decoration: InputDecoration(
                                          hintText:
                                              "Uzunluk",
                                          border: OutlineInputBorder())),
                                ),

                                Container(
                                  margin: EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TextField(
                                                                        keyboardType: TextInputType.number,

                                      controller: katsayiController,
                                      decoration: InputDecoration(
                                          hintText: "Katsayı",
                                          border: OutlineInputBorder())),
                                ),

                                //Bitişik olduğu oda türü
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 40),
                                    child: Text(
                                      "Bitişik olduğu oda türü",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20, color: Colors.black),
                                    )),

                                Container(
                                  width: 300,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.orangeAccent.shade100),
                                  child: Center(
                                    child: DropdownButton<Odalar>(
                                      
                                      value: bitisikOlanOda,
                                      //icon: const Icon(Icons.arrow_downward),
                                      elevation: 16,
                                      style: GoogleFonts.poppins(
                                          fontSize: 20, color: Colors.black),
                                      underline: Container(
                                        height: 0,
                                        color: Colors.transparent,
                                      ),
                                      
                                      onChanged: (newValue) {
                                        setState(() {
                                          bitisikOlanOda = newValue!;
                                          print("new value :" +
                                              newValue.value.toString());
                                        });
                                      },
                                      items: odalarListDropDown,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 30),

                                Container(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 40),
                                    child: Text(
                                      "Not : Boşlukları doldurduktan sonra ekle butonuna basınız",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20, color: Colors.white),
                                    )),
                              ],
                            )
                          : Container(
                              height: 335,
                            ),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Container(
                        margin: EdgeInsets.only(left:20,bottom: 20),
                        child: isSwitch == true
                            ? FloatingActionButton.extended(
                              heroTag: 1,
                                backgroundColor: Colors.black,
                                onPressed: () {
                                 Get.to(IcDuvarElemanListPage());
                                },
                                label: Row(
                                 
                                  children: [
                                    Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                    Text(
                                      "Liste",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ))
                            : null,
                      ),
                          Container(
                            margin: EdgeInsets.only(right: 20,bottom: 20),
                            child: isSwitch == true
                                ? FloatingActionButton.extended(
                                  heroTag: 2,
                                    backgroundColor: Colors.blueAccent,
                                    onPressed: () {
                                      //print(yukseklikController.text.toString());
                                      //print(uzunlukController.text.toString());
                                      //print(katsayiController.text.toString());
                                      int sicaklikFarki=_controller.hesabiYapilacakOdaGet.value-bitisikOlanOda.value;
                                      print("Sıcaklık Farkı"+sicaklikFarki.toString());
                                      _controller.icDuvarElemanList.add(IcDuvarEleman(double.parse(yukseklikController.text),double.parse(uzunlukController.text),double.parse(katsayiController.text),sicaklikFarki,bitisikOlanOda));
                                      print(_controller.icDuvarElemanList.length.toString());
                                      //print(_controller.icDuvarElemanList.first.yukseklik.toString());
                                      //print(bitisikOlanOda);
                                      //print(_controller.icDuvarElemanList.first.bitisikOlduguOda.toString());
                                      //print(_controller.icDuvarElemanList.first.bitisikOlanOda==null?"boş":"dolu");
                                    },
                                    label: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: 30,
                                        ),
                                        Text(
                                          "Ekle",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ))
                                : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  color: Colors.orangeAccent,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Back(context, 4), Continue(context, 6)],
                  ),
                )
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
            onTap: () {
              setState(() {
                isSwitch = true;
              });
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: isSwitch == true ? Colors.blueAccent : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Center(
                child: Text(
                  "Evet",
                  style: isSwitch == true ? isSwitchText : style1,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSwitch = false;
              });
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: isSwitch == false ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(
                child: Text(
                  "Hayır",
                  style: isSwitch == false ? isSwitchText : style1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setOdalarItems(List<Odalar> odaList) {
    for (Odalar oda in odaList) {
      setState(() {
        odalarListDropDown.add(DropdownMenuItem<Odalar>(
            value: oda,
            child: Text(
              oda.roomName,
            )));
      });
    }
  }
}
