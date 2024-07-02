import 'dart:io';

class Message {
  late final String userName;
  final String? messageContent;
  late final DateTime time;
  late final bool sender;
  final File? img;

  Message({
    required this.userName,
    this.messageContent,
    required this.time,
    required this.sender,
    this.img,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_name'] = userName;
    map['content'] = messageContent;
    map['time'] = time.toString();
    map['messageType'] = sender;
    map['img'] = img;
    return map;
  }
}
