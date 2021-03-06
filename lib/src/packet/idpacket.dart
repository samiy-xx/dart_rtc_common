part of rtc_common;

class IdPacket extends Packet {
  IdPacket();
  IdPacket.With(this.id, this.channelId);

  String packetType = PACKET_TYPE_ID;
  String channelId = "";
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'channelId': channelId,
      'id': id
    };
  }

  static IdPacket fromMap(Map m) {
    return new IdPacket.With(m['id'], m['channelId']);
  }
}
