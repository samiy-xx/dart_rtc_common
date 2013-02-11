part of rtc_common;


class PacketType {
  /**
   * HELO Packet is sent to server when creating the connection
   */
  static const PacketType HELO = const PacketType("helo");
  
  /**
   * DESC packet contains the sdp info
   */
  static const PacketType DESC = const PacketType("desc");
  
  /**
   * Ice packets contain the information on peers will connect trough different routers and nats
   */
  static const PacketType ICE = const PacketType("ice");
  static const PacketType USER = const PacketType("user");
  static const PacketType BYE = const PacketType("bye");
  
  /**
   * JOIN Packet informs users on channel about new user joining
   */
  static const PacketType JOIN = const PacketType("join");
  
  /**
   * ID Packet informs the user joining a channel about existing users
   */
  static const PacketType ID = const PacketType("id");
  static const PacketType ACK = const PacketType("ack");
  
  /**
   * Keepalive controls, Server send PING packet and expects the client to respond with PONG
   */
  static const PacketType PING = const PacketType("ping");
  
  /**
   * Keepalive controls, Client must respond with PONG to a PING packet from server
   */
  static const PacketType PONG = const PacketType("pong");
  static const PacketType CONNECTED = const PacketType("connected");
  static const PacketType RANDOM = const PacketType("random");
  static const PacketType DISCONNECTED = const PacketType("disconnected");
  static const PacketType QUEUE = const PacketType("queue");
  static const PacketType CHANNEL = const PacketType("channel");
  static const PacketType FILE = const PacketType("file");
  
  /**
   * NEXT packet requests a new user from queue
   */
  static const PacketType NEXT = const PacketType("next");
  
  /**
   * REMOVEUSER packet requests that a user is removed from channel
   */
  static const PacketType REMOVEUSER = const PacketType("removeuser");
  static const PacketType USERMESSAGE = const PacketType("usermessage");
  
  /**
   * CHANNELMESSAGE packet sends a message to everyone in channel
   */
  static const PacketType CHANNELMESSAGE = const PacketType("channelmessage");
  static const PacketType PEERCREATED = const PacketType("peercreated");
  static const PacketType SETCHANNELVARS = const PacketType("setchannelvars");
  final String type;
  const PacketType(this.type);
  String toString() => type;
}
