part of rtc_common;

/**
 * ByePacket.
 * Signal the server that client is disconnecting.
 */
class ByePacket extends Packet {
  ByePacket();
  ByePacket.With(this.id);

  String packetType = PACKET_TYPE_BYE;

  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'id': id
    };
  }

  static ByePacket fromMap(Map m) {
    return new ByePacket.With(m['id']);
  }
}
