class Band {
  String id;
  String name;
  int? vote;

  Band({required this.id, required this.name, this.vote});
  factory Band.fromMap(Map<String, dynamic> obj) => Band(
        id: obj['id'],
        name: obj['name'],
        vote: obj['vote'],
      );
}
