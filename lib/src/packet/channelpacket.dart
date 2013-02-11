part of rtc_common;

class ChannelPacket implements Packet {
  ChannelPacket() : super();
  ChannelPacket.With(this.id, this.channelId, this.owner, this.users, this.limit);
  
  PacketType packetType = PacketType.CHANNEL;
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
      'packetType': packetType.toString()
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

class RemoveUserCommand implements Command {
  RemoveUserCommand();
  RemoveUserCommand.With(this.id, this.channelId);
  
  PacketType packetType = PacketType.REMOVEUSER;
  String id;
  String channelId;
  
  Map toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'packetType': packetType.toString()
    };
  }
  
  static RemoveUserCommand fromMap(Map m) {
    return new RemoveUserCommand.With(m['id'], m['channelId']);
  }
}

class SetChannelVarsCommand implements Command {
  SetChannelVarsCommand();
  SetChannelVarsCommand.With(this.id, this.channelId, this.limit);
  
  PacketType packetType = PacketType.SETCHANNELVARS;
  String id;
  String channelId;
  int limit;
  
  Map toJson() {
    return {
      'id': id,
      'channelId': channelId,
      'limit': limit,
      'packetType': packetType.toString()
    };
  }
  
  static SetChannelVarsCommand fromMap(Map m) {
    return new SetChannelVarsCommand.With(m['id'], m['channelId'], m['limit']);
  }
}

