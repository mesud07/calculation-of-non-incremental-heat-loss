import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/FirstPage/model/sehirlerModel.dart';
import 'package:untitled/datahelper/datahelper.dart';
import 'package:untitled/datahelper/style.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({ Key? key }) : super(key: key);


  @override
  
  _FirstPageState createState() => _FirstPageState();
}



 





  


class _FirstPageState extends State<FirstPage> {

  Sehir secilenSehir=Sehir("Sehir giriniz",0);
   static const Map<String,int>sehirler={
      "Antalya":10,
      "İstanbul": 11,
      "Adana": 12,
      "Isparta": 13,
      "İzmir" : 14
      };

  List<DropdownMenuItem<Sehir>> sehirListDropDown = [];
  
 
  
    
   void initState() {
    super.initState();
   //map formati Sehir tipinde liste ekliyor.
 List<Sehir> sehirlerList =
  sehirler.entries.map( (entry) => Sehir(entry.key, entry.value)).toList();
  //dropdown elemanları oluşturuluyor
  setSehirItems(sehirlerList);
  }
  

  
  @override
  Widget build(BuildContext context) {
  
  //debugPrint(weightData[1].name);
  
sehirListDropDown.forEach((element) {print(element.value.toString());});
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
                            margin: EdgeInsets.all(30),
                            height: 150,
                            width: double.infinity,
                            child: Text(
                              "İlinizin ve hesabını yapacağınız odanın sıcaklık değerlerini bulmamız için seçim yapınız",style: style1,)),
                          
                          Container(
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.orangeAccent.shade100),
                            child: Center(
                            child :Text(""),

                            ),
                          ),

                        SizedBox(height: 30,),
                          //Oda Bilgisi 

                          Container(
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.orangeAccent.shade100),
                            child: Center(
                            child :DropdownButton<Sehir>(
                        value: secilenSehir,
                        //icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 0,
                          color: Colors.transparent,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            secilenSehir = newValue!;
                            print("new value :"+newValue.toString());
                          });
                        },
                        items: sehirListDropDown,
                      ),
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
                             Continue(context,2)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
           
        
    );
  }
 
  setSehirItems(List<Sehir> sehirList) {

    for (Sehir sehir in sehirList) {
      setState(() {
        sehirListDropDown.add(DropdownMenuItem<Sehir>(
            value: sehir,
            child: Text(
              sehir.name,
              style: TextStyle(fontSize: 20),
            )));
      });
    }
  }
}
