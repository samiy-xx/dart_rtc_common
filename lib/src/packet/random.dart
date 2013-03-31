part of rtc_common;

class RandomUserPacket extends Packet {
  RandomUserPacket();
  RandomUserPacket.With(this.id);

  String packetType = PACKET_TYPE_RANDOM;
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'id': id
    };
  }

  static RandomUserPacket fromMap(Map m) {
      return new RandomUserPacket.With(m['id']);
  }
}
