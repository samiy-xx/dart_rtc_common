part of rtc_common_tests;

class PacketFactoryTests {
  
  
  run() {
    group('PacketFactoryTests', () {
      
      setUp(() {
        
      });
      
      tearDown(() {
        
      });
      
      test("PacketFactory, given map, can create packet", () {
        Map p = new ByePacket.With("id").toJson();
        expect(PacketFactory.getPacketFromMap(p), isNotNull);
      });
      
      
    });
  }
}

