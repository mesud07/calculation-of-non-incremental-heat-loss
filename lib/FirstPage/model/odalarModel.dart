class Odalar {
  String roomName;
  int value;
  Odalar(this.roomName,this.value);

   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Odalar && runtimeType == other.runtimeType && roomName == other.roomName;

  @override
  int get hashCode => roomName.hashCode;
}