part of rtc_common;

class ChannelMessage extends Packet {
  ChannelMessage();
  ChannelMessage.With(this.id, this.channelId, this.message);

  String packetType = PACKET_TYPE_CHANNELMESSAGE;
  String id = "";
  String channelId = "";
  String message = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'id': id,
      'channelId': channelId,
      'message': message
    };
  }

  static ChannelMessage fromMap(Map m) {
      return new ChannelMessage.With(m['id'], m['channelId'], m['message']);
  }
}

