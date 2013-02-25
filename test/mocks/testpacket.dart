part of rtc_common_tests;

class TestPacket extends Packet {
  TestPacket();
  TestPacket.With(this.id);

  PacketType packetType = const PacketType("test");
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

