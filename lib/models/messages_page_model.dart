class Messages {
  Messages({
    required this.toid,
    required this.sendtime,
    required this.message,
    required this.fromid,
    required this.username,
    required this.status,
  });

  late final String toid;
  late final String sendtime;
  late final String message;
  late final String fromid;
  late final String username;
  late final bool status;

  Messages.fromJson(Map<String, dynamic> json) {
    toid = json['toid'];
    sendtime = json['sendtime'];
    message = json['message'];
    fromid = json['fromid'];
    username = json['username'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['toid'] = toid;
    _data['sendtime'] = sendtime;
    _data['message'] = message;
    _data['fromid'] = fromid;
    _data['username'] = username;
    _data['status'] = status;
    return _data;
  }
}
