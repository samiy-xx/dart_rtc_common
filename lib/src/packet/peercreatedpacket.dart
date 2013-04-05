part of rtc_common;

class PeerCreatedPacket extends Packet {
  PeerCreatedPacket();
  PeerCreatedPacket.With(this.id);

  String packetType = PACKET_TYPE_PEERCREATED;
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'id': id
    };
  }

  static PeerCreatedPacket fromMap(Map m) {
      return new PeerCreatedPacket.With(m['userId']);
  }
}
