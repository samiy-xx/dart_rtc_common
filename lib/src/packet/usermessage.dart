part of rtc_common;

class UserMessage extends Packet {
  UserMessage();
  UserMessage.With(this.id, this.message);

  String packetType = PACKET_TYPE_USERMESSAGE;
  String id = "";

  String message = "";

  Map toJson() {
    return {
      'packetType': packetType,
      'id': id,

      'message': message
    };
  }

  static UserMessage fromMap(Map m) {
      return new UserMessage.With(m['id'], m['message']);
  }
}
