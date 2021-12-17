import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/FirstPage/model/odalarModel.dart';
import 'package:untitled/FirstPage/model/sehirlerModel.dart';
import 'package:untitled/ThirdPage/model/c%C4%B1karilacakAlanModel.dart';


class Controller extends GetxController{
  //First Page genel bilgiler

  var _sehir=Sehir("Antalya",10).obs;
  var _hesabiYapilacakOda=Odalar("Salon",22).obs;

  get sehir => _sehir.value;
  set sehir(value) =>  _sehir.value = value;
   //Getter ve Setter tanımlaman şundan dolayı güzel herseferinde .value unutuyorsun
  //yada kod fazlalığı
  get hesabiYapilacakOdaGet => _hesabiYapilacakOda.value;
  set HesabiYapilacakOdaSet(value) =>  _hesabiYapilacakOda.value = value;
   
  void levelAta(index)
          {
          //index ==1 ? kibarlikseviyesi++ : kibarlikseviyesi--;
            //direk eşitleme yaptığında set çalışıyor
          sehir = index;
          print("Şehir bilgisi : "+ sehir);
          }

  void odaAta(index)
          {
          //index ==1 ? kibarlikseviyesi++ : kibarlikseviyesi--;
            //direk eşitleme yaptığında set çalışıyor
          HesabiYapilacakOdaSet = index;
          print("Oda bilgisi : "+ hesabiYapilacakOdaGet);
          }




  //Dış duvar bilgileri
var _totalDisDuvarUzunluk=0.toDouble().obs;
var _disDuvarYukseklik=0.toDouble().obs;
var _disDuvarKatsayisi=0.toDouble().obs;

get totalDisDuvarUzunlukGet=>_totalDisDuvarUzunluk.value;
set totalDisDuvarUzunlukSet(value)=>_totalDisDuvarUzunluk.value=value;

get disDuvarYukseklikGet=>_disDuvarYukseklik.value;
set disDuvarYukseklikSet(value)=>_disDuvarYukseklik.value=value;

get disDuvarKatsayisiGet=>_disDuvarKatsayisi.value;
set disDuvarKatsayisiSet(value)=>_disDuvarKatsayisi.value=value;

//Çıkarılacak alan bilgileri

var cikarilacakElemanList = [].obs;

//Tavan ve taban bilgileri
var _tabanTavanGenislik=0.toDouble().obs;
var _tabanTavanUzunluk=0.toDouble().obs;
var _tavanKatsayi=0.toDouble().obs;
var _tavanElemanTuru="Çimento".obs;
var _tabanKatsayi=0.toDouble().obs;
var _tabanElemanTuru="Çimento".obs;

get tabanTavanGenislikGet=>_tabanTavanGenislik.value;
set tabanTavanUzunlukSet(value)=>_tabanTavanUzunluk.value=value;

get tabanTavanUzunlukGet=>_tabanTavanUzunluk.value;
set tabanTavanGenislikSet(value)=>_tabanTavanGenislik.value=value;

get tavanKatsayiGet=>_tavanKatsayi.value;
set tavanKatsayiSet(value)=>_tavanKatsayi.value=value;

get tavanElemanTuruGet=>_tavanElemanTuru.value;
set tavanElemanTuruSet(value)=>_tavanElemanTuru.value=value;

get tabanKatsayiGet=>_tabanKatsayi.value;
set tabanKatsayiSet(value)=>_tabanKatsayi.value=value;

get tabanElemanTuruGet=>_tabanElemanTuru.value;
set tabanElemanTuruSet(value)=>_tabanElemanTuru.value=value;


  
 //İç duvar bilgileri
 var icDuvarElemanList =[].obs;

 

  

 


}
