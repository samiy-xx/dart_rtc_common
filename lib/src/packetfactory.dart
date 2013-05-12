part of rtc_common;

/**
 * PacketFactory
 * Static methods to create Packet from Map or JSON String
 *
 * TODO: Use mirrors?
 */
class PacketFactory {
  static final _logger = new Logger("dart_rtc_common.PacketFactory");
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
      String pt = m['packetType'];
      Packet p;
      switch (pt) {
        case "helo":
          p = HeloPacket.fromMap(m);
          break;
        case "desc":
          p = DescriptionPacket.fromMap(m);
          break;
        case "ice":
          p = IcePacket.fromMap(m);
          break;
        case "connected":
          p = ConnectionSuccessPacket.fromMap(m);
          break;
        case "id":
          p = IdPacket.fromMap(m);
          break;
        case "join":
          p = JoinPacket.fromMap(m);
          break;
        case "pong":
          p = PongPacket.fromMap(m);
          break;
        case "ping":
          p = PingPacket.fromMap(m);
          break;
        case "bye":
          p = ByePacket.fromMap(m);
          break;
        case "queue":
          p = QueuePacket.fromMap(m);
          break;
        case "next":
          p = NextPacket.fromMap(m);
          break;
        case "usermessage":
          p = UserMessage.fromMap(m);
          break;
        case "channelmessage":
          p = ChannelMessage.fromMap(m);
          break;
        case "disconnected":
          p = Disconnected.fromMap(m);
          break;
        case "random":
          p = RandomUserPacket.fromMap(m);
          break;
        case "file":
          p = FilePacket.fromMap(m);
          break;
        case "channel":
          p = ChannelPacket.fromMap(m);
          break;
        case "removeuser":
          p = RemoveUserCommand.fromMap(m);
          break;
        case "setchannelvars":
          p = SetChannelVarsCommand.fromMap(m);
          break;
        case "channeljoin":
          p = ChannelJoinCommand.fromMap(m);
          break;
        case "changenick":
          p = ChangeNickCommand.fromMap(m);
          break;
        default:
          _logger.warning("(packetfactory.dart) Unkown packet ($pt)");
          p = null;
          break;
      }
      return p;
    } catch(e) {
      _logger.severe(m.toString());
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