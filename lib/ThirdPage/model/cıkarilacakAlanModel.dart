class CikarilacakEleman{

  String name;
   double yukseklik=0;
   double uzunluk=0;
   double isiGecisKatsayisi=0;
   int adet=0;
    CikarilacakEleman(this.name,this.yukseklik,this.uzunluk,this.isiGecisKatsayisi,this.adet);
    

    

   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CikarilacakEleman && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}