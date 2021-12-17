class Sehir {
  String name;
  int value;
  Sehir(this.name, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sehir && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}