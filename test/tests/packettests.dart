part of rtc_common_tests;

class PacketTests {
  run() {
    group('PacketTests', () {
      final String id = "aaa";
      final String channelId = "bbb";

      TestPacket testPacket;

      setUp(() {
        testPacket = new TestPacket.With(id);
      });

      tearDown(() {

      });

      test("Packet, When created, is not null", () {
        expect(testPacket, isNotNull);
      });

      test("Packet, When created, has properties", () {
        expect(testPacket.id, equals(id));
        expect(testPacket.packetType.toString(), equals("test"));
        expect(testPacket.toString() is String, equals(true));
        expect(testPacket.toJson() is Map, equals(true));
        expect(testPacket.toJson(), contains('packetType'));
        expect(testPacket.toJson(), contains('id'));
      });

      test("Packet, calling toString, returns correct data", () {
        String data = testPacket.toString();
        Map m = json.parse(data);
        expect(m.containsKey("id"), equals(true));
      });
    });
  }
}



