part of rtc_common;

class QueuePacket extends Packet {
  QueuePacket() : super();
  QueuePacket.With(this.id, this.channelId, this.position);

  PacketType packetType = PacketType.QUEUE;
  String id;
  String channelId;
  String position;

  Map toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'position': position,
      'packetType': packetType.toString()
    };
  }

  static QueuePacket fromMap(Map m) {
    return new QueuePacket.With(m['id'], m['channelId'], m['position']);
  }
}

class NextPacket extends Packet {
  NextPacket();
  NextPacket.With(this.id, this.channelId);

  PacketType packetType = PacketType.NEXT;
  String id;
  String channelId;

  Map toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'packetType': packetType.toString()
    };
  }

  static NextPacket fromMap(Map m) {
    return new NextPacket.With(m['id'], m['channelId']);
  }
}


