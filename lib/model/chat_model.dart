class Chat {
  final String body;
  final int userId;
  late DateTime? createdAt;
  Chat({
    required this.body,
    required this.userId,
    this.createdAt,
  });
}
