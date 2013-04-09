part of rtc_common_tests;

class PacketHandlerTests {
  PacketHandler p;

  run() {
    group('PacketHandlerTests', () {

      setUp(() {
        p = new PacketHandler();
      });

      tearDown(() {
        p = null;
      });

      test("PacketHandler, When created, is not null", () {
        expect(p, isNotNull);
      });

      test("PacketHandler, handlers, can register", () {
        expect(p.getHandlers(PACKET_TYPE_JOIN), equals(null));
        p.registerHandler(PACKET_TYPE_JOIN, (Packet p) => p = null);
        expect(p.getHandlers(PACKET_TYPE_JOIN).length, equals(1));
      });

      test("PacketHandler, handlers, can clear given type", () {
        expect(p.getHandlers(PACKET_TYPE_JOIN), equals(null));
        p.registerHandler(PACKET_TYPE_JOIN, (Packet p) => p = null);
        expect(p.getHandlers(PACKET_TYPE_JOIN).length, equals(1));
        p.clearHandlers(PACKET_TYPE_JOIN);
        expect(p.getHandlers(PACKET_TYPE_JOIN), equals(null));
      });

      test("PacketHandler, handlers, execute", () {

        String packetId = "123";
        bool packetWasHandled = false;

        p.registerHandler(PACKET_TYPE_BYE, (Packet p)  {
          expect(p.id, equals(packetId));
          expect(p.packetType, equals(PACKET_TYPE_BYE));
          packetWasHandled = true;
        });

        p.executeHandler(new ByePacket.With(packetId));

        expect(packetWasHandled, equals(true));
      });
    });
  }
}

