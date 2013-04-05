part of rtc_common;

const String PACKET_TYPE_HELO = "helo";
const String PACKET_TYPE_DESC = "desc";
const String PACKET_TYPE_ICE =  "ice";
const String PACKET_TYPE_USER = "user";
const String PACKET_TYPE_BYE =  "bye";
const String PACKET_TYPE_JOIN = "join";
const String PACKET_TYPE_ID = "id";
const String PACKET_TYPE_ACK = "ack";
const String PACKET_TYPE_PING = "ping";
const String PACKET_TYPE_PONG = "pong";
const String PACKET_TYPE_CONNECTED = "connected";
const String PACKET_TYPE_RANDOM = "random";
const String PACKET_TYPE_DISCONNECTED = "disconnected";
const String PACKET_TYPE_QUEUE = "queue";
const String PACKET_TYPE_FILE = "file";
const String PACKET_TYPE_NEXT = "next";
const String PACKET_TYPE_REMOVEUSER = "removeuser";
const String PACKET_TYPE_USERMESSAGE = "usermessage";
const String PACKET_TYPE_CHANNELMESSAGE = "channelmessage";
const String PACKET_TYPE_CHANNEL = "channel";
const String PACKET_TYPE_CHANNELJOIN = "channeljoin";
const String PACKET_TYPE_CHANGENICK = "changenick";
const String PACKET_TYPE_PEERCREATED = "peercreated";
const String PACKET_TYPE_SETCHANNELVARS = "setchannelvars";

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
  static const PacketType CHANNEL = const PacketType("channel");
  static const PacketType CHANNELJOIN = const PacketType("channeljoin");
  static const PacketType CHANGENICK = const PacketType("changenick");
  static const PacketType PEERCREATED = const PacketType("peercreated");
  static const PacketType SETCHANNELVARS = const PacketType("setchannelvars");
  final String type;
  const PacketType(this.type);
  String toString() => type;

  operator ==(Object other) {
    if (!(other is PacketType))
      return false;

    PacketType o = other as PacketType;
    if (type != o.type)
      return false;

    return true;
  }
}
