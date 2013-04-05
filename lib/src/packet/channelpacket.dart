part of rtc_common;

class ChannelPacket extends Packet {
  ChannelPacket() : super();
  ChannelPacket.With(this.id, this.channelId, this.owner, this.users, this.limit);

  String packetType = PACKET_TYPE_CHANNEL;
  String id;
  String channelId;
  bool owner;
  int users;
  int limit;

  Map toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'owner': owner,
      'users': users,
      'limit': limit,
      'packetType': packetType
    };
  }

  static ChannelPacket fromMap(Map m) {
    return new ChannelPacket.With(
        m['id'],
        m['channelId'],
        m['owner'],
        m['users'],
        m['limit']
    );
  }
}

abstract class Command extends Packet {

}

class RemoveUserCommand extends Command {
  RemoveUserCommand();
  RemoveUserCommand.With(this.id, this.channelId);

  String packetType = PACKET_TYPE_REMOVEUSER;
  String id;
  String channelId;

  Map toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'packetType': packetType
    };
  }

  static RemoveUserCommand fromMap(Map m) {
    return new RemoveUserCommand.With(m['id'], m['channelId']);
  }
}

class ChannelJoinCommand extends Command {
  ChannelJoinCommand();
  ChannelJoinCommand.With(this.id, this.channelId);

  String id;
  String channelId;
  String packetType = PACKET_TYPE_CHANNELJOIN;

  Map toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'packetType': packetType.toString()
    };
  }

  static ChannelJoinCommand fromMap(Map m) {
    return new ChannelJoinCommand.With(m['id'], m['channelId']);
  }
}

class ChangeNickCommand extends Command {
  ChangeNickCommand();
  ChangeNickCommand.With(this.id, this.newId);

  String id;
  String newId;
  String packetType = PACKET_TYPE_CHANGENICK;

  Map toJson() {
    return {
      'id': id,
      'newId': newId,
      'packetType': packetType.toString()
    };
  }

  static ChangeNickCommand fromMap(Map m) {
    return new ChangeNickCommand.With(m['id'], m['newId']);
  }
}

class SetChannelVarsCommand extends Command {
  SetChannelVarsCommand();
  SetChannelVarsCommand.With(this.id, this.channelId, this.limit);

  String packetType = PACKET_TYPE_SETCHANNELVARS;
  String id;
  String channelId;
  int limit;

  Map toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'limit': limit,
      'packetType': packetType
    };
  }

  static SetChannelVarsCommand fromMap(Map m) {
    return new SetChannelVarsCommand.With(m['id'], m['channelId'], m['limit']);
  }
}

