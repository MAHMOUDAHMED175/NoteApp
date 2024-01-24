/// name : "Earth (C-137)"
/// url : "https://rickandmortyapi.com/api/location/1"

class Origin {
  Origin({
    this.name,
    this.url,
  });

  Origin.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;
  Origin copyWith({
    String? name,
    String? url,
  }) =>
      Origin(
        name: name ?? this.name,
        url: url ?? this.url,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}
