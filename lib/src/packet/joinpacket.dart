part of rtc_common;

class JoinPacket extends Packet {
  JoinPacket();
  JoinPacket.With(this.channelId, this.id);

  String packetType = PACKET_TYPE_JOIN;
  String channelId = "";
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'channelId': channelId,
      'id': id
    };
  }

  static JoinPacket fromMap(Map m) {
    return new JoinPacket.With(m['channelId'], m['id']);
  }
}