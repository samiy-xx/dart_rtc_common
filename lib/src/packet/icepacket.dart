part of rtc_common;

class IcePacket extends Packet{
  IcePacket() : super();
  IcePacket.With(this.candidate, this.sdpMid, this.sdpMLineIndex, this.id) : super();

  String candidate;
  String sdpMid;
  int sdpMLineIndex;
  String id;
  String packetType = PACKET_TYPE_ICE;

  Map toJson() {
    return {
      'candidate':candidate,
      'sdpMid':sdpMid,
      'sdpMLineIndex':sdpMLineIndex,
      'packetType':packetType,
      'id':id
    };
  }

  static IcePacket fromMap(Map m) {
    return new IcePacket.With(m['candidate'], m['sdpMid'], m['sdpMLineIndex'], m['id']);
  }
}
