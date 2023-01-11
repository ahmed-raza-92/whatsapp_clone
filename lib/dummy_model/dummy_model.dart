class DummyMessage {
  String message;
  DateTime dateTime;
  bool sent;
  bool? read;

  DummyMessage(
      {required this.message,
      required this.sent,
        required this.dateTime,
      this.read,});
}
