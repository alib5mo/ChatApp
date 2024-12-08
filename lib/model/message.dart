class Message{
  final String id;
  final String message;
  Message(this.message, this.id);
  factory Message.fromJson(json)
  {
    return Message(json['message'],json['id']);
  }

}