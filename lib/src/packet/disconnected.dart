part of rtc_common;

class Disconnected extends Packet {
  Disconnected();
  Disconnected.With(this.id);

  String packetType = PACKET_TYPE_DISCONNECTED;
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'id': id
    };
  }

  static Disconnected fromMap(Map m) {
    return new Disconnected.With(m['id']);
  }
}
