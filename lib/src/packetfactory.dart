part of rtc_common;

/**
 * PacketFactory
 * Static methods to create Packet from Map or JSON String
 * 
 * TODO: Use mirrors?
 */
class PacketFactory {
  
  /**
   * Returns a packet from string input
   */
  static Packet getPacketFromString(String input) {
    try { 
      return getPacketFromMap(json.parse(input));
    } on InvalidPacketException catch(e) {
      throw e;
    }
  }
  
  /**
   * Returns a packet from map
   */
  static Packet getPacketFromMap(Map m) {
    try {
      PacketType type = new PacketType(m['packetType']);
      Packet p;
      switch (type) {
        case PacketType.HELO:
          p = HeloPacket.fromMap(m);
          break;
        case PacketType.DESC:
          p = DescriptionPacket.fromMap(m);
          break;
        case PacketType.ICE:
          p = IcePacket.fromMap(m);
          break;
        case PacketType.CONNECTED:
          p = ConnectionSuccessPacket.fromMap(m);
          break;
        case PacketType.ID:
          p = IdPacket.fromMap(m);
          break;
        case PacketType.JOIN:
          p = JoinPacket.fromMap(m);
          break;
        case PacketType.PONG:
          p = PongPacket.fromMap(m);
          break;
        case PacketType.PING:
          p = PingPacket.fromMap(m);
          break;
        case PacketType.BYE:
          p = ByePacket.fromMap(m);
          break;
        case PacketType.QUEUE:
          p = QueuePacket.fromMap(m);
          break;
        case PacketType.NEXT:
          p = NextPacket.fromMap(m);
          break;
        case PacketType.USERMESSAGE:
          p = UserMessage.fromMap(m);
          break;
        case PacketType.CHANNELMESSAGE:
          p = ChannelMessage.fromMap(m);
          break;
        case PacketType.DISCONNECTED:
          p = Disconnected.fromMap(m);
          break;
        case PacketType.RANDOM:
          p = RandomUserPacket.fromMap(m);
          break;
        case PacketType.FILE:
          p = FilePacket.fromMap(m);
          break;
        case PacketType.CHANNEL:
          p = ChannelPacket.fromMap(m);
          break;
        case PacketType.REMOVEUSER:
          p = RemoveUserCommand.fromMap(m);
          break;
        case PacketType.SETCHANNELVARS:
          p = SetChannelVarsCommand.fromMap(m);
          break;
        default:
          new Logger().Warning("(packetfactory.dart) Unkown packet (${m['packetType']})");
          p = null;
          break;
        
      }
      return p;
    } catch(e) {
      new Logger().Error(m.toString());
      throw new InvalidPacketException("Packet was malformed (${m.toString()})", e);
    }
  }
  
  /**
   * Returns a json stringified Packet for websocket send
   */
  static String get(Packet p) {
    //return p.toString();
    return json.stringify(p); 
  }
  
}