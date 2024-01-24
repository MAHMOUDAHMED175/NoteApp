class TaskModel {
  String id;
  String title;
  String description;
  bool state;
  int date;
  int idColor;
  int startDate;
  int endDate;
  String userId;

  TaskModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.state,
    required this.date,
    required this.idColor,
    required this.endDate,
    required this.startDate,
    required this.userId,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          description: json["description"],
          state: json["state"],
          date: json["date"],
          idColor: json["idColor"],
          userId: json["userId"],
          startDate: json["startDate"],
          endDate: json["endDate"],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "state": state,
      "date": date,
      "idColor": idColor,
      "userId": userId,
      "startDate": startDate,
      "endDate": endDate,
    };
  }
}
