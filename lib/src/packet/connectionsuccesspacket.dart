part of rtc_common;

class ConnectionSuccessPacket extends Packet {
  ConnectionSuccessPacket();
  ConnectionSuccessPacket.With(this.id);

  String packetType = PACKET_TYPE_CONNECTED;
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'id': id
    };
  }

  static ConnectionSuccessPacket fromMap(Map m) {
      return new ConnectionSuccessPacket.With(m['id']);
  }
}