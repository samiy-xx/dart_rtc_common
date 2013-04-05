part of rtc_common;

class HeloPacket extends Packet {
  HeloPacket();
  HeloPacket.With(this.channelId, this.id);

  String packetType = PACKET_TYPE_HELO;
  String channelId = "";
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'channelId': channelId,
      'id': id
    };
  }

  static HeloPacket fromMap(Map m) {
    return new HeloPacket.With(m['channelId'], m['id']);
  }
}