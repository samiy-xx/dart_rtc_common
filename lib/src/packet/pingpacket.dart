part of rtc_common;

class PingPacket extends Packet {
  PingPacket();
  PingPacket.With(this.id);

  String packetType = PACKET_TYPE_PING;
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'id': id
    };
  }

  static PingPacket fromMap(Map m) {
      return new PingPacket.With(m['id']);
  }
}
