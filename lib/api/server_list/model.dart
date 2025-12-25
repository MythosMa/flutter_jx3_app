class ServerItem {
  int id;
  String serverName;

  ServerItem({
    required this.id,
    required this.serverName,
  });

  factory ServerItem.fromJson(Map<String, dynamic> json) {
    return ServerItem(
      id: json['id'],
      serverName: json['server_name'],
    );
  }
}
