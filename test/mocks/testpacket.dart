part of rtc_common_tests;

class TestPacket extends Packet {
  TestPacket();
  TestPacket.With(this.id);

  String packetType = PACKET_TYPE_BYE;
  String id = "";

  Map toJson() {
    return {
      'packetType': packetType.toString(),
      'id': id
    };
  }

  static TestPacket fromMap(Map m) {
      return new TestPacket.With(m['id']);
  }
}

