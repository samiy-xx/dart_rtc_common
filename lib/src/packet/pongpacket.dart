part of rtc_common;

class PongPacket  extends Packet{
  PongPacket();

  String packetType = PACKET_TYPE_PONG;
  String id;

  Map toJson() {
    return {
      'packetType': packetType
    };
  }

  static PongPacket fromMap(Map m) {
      return new PongPacket();
  }
}
