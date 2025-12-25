class CalendarItem {
  String date;
  String week;
  String battle;
  String war;
  List<String> luck;

  CalendarItem({
    required this.date,
    required this.week,
    required this.battle,
    required this.war,
    required this.luck,
  });

  factory CalendarItem.fromJson(Map<String, dynamic> json) {
    print(json);
    return CalendarItem(
      week: json['week'],
      battle: json['battle'],
      date: json['date'],
      war: json['war'],
      luck: (json['luck'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}
