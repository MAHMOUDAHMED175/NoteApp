// class Results {
//   final int id;
//   final String name;
//   final String status;
//   final String species;
//   final String type;
//   final String gender;
//   final String image;
//   final List<String> episode;
//   final String url;
//   Results(
//       {required this.id,
//       required this.name,
//       required this.status,
//       required this.species,
//       required this.gender,
//       required this.image,
//       required this.episode,
//       required this.type,
//       required this.url});
//
//   factory Results.fromJson(Map<String, dynamic> json) => Results(
//         id: json['id'],
//         name: json['name'],
//         status: json['status'],
//         species: json['species'],
//         type: json['type'],
//         gender: json['gender'],
//         image: json['image'],
//         episode: json['episode'],
//         url: json['url'],
//       );
// }
//
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     data['status'] = this.status;
// //     data['species'] = this.species;
// //     data['type'] = this.type;
// //     data['gender'] = this.gender;
// //     // if (this.origin != null) {data['origin'] = this.origin!.toJson();}
// //     //  if (this.location != null) {data['location'] = this.location!.toJson();}
// //     data['image'] = this.image;
// //     data['episode'] = this.episode;
// //     data['url'] = this.url;
// //     data['created'] = this.created;
// //     return data;
// //   }
// // }
//
// // class Origin {
// //   String? name;
// //   String? url;
// //
// //   Origin({this.name, this.url});
// //
// //   Origin.fromJson(Map<String, dynamic> json) {
// //     name = json['name'];
// //     url = json['url'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['name'] = this.name;
// //     data['url'] = this.url;
// //     return data;
// //   }
//
// /*
// part 'models.g.dart';
//
// @JsonSerializable()
// class Results {
//   int? id;
//   String? name;
//   String? status;
//   String? species;
//   String? type;
//   String? gender;
//   Origin? origin;
//   Origin? location;
//   String? image;
//   List<Map<String, dynamic>>? episode;
//   String? url;
//   String? created;
//
//   Results(
//       {this.id,
//       this.name,
//       this.status,
//       this.species,
//       this.type,
//       this.gender,
//       this.origin,
//       this.location,
//       this.image,
//       this.episode,
//       this.url,
//       this.created});
//
//   // Connect the generated [_$PersonFromJson] function to the `fromJson`
//   /// factory.
//   factory Results.fromJson(Map<String, dynamic> json) =>
//       _$ResultsFromJson(json);
//
//   /// Connect the generated [_$PersonToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$ResultsToJson(this);
// }
//
// class Origin {
//   String? name;
//   String? url;
//
//   Origin({this.name, this.url});
//
//   Origin.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     url = json['url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['url'] = this.url;
//     return data;
//   }
// }
//
// /*
// class GuidConverter implements JsonConverter<GuidConverter?, String?> {
//   const GuidConverter();
//
//   @override
//   GuidConverter? fromJson(String? json) {
//     if (json == null) {
//       return null;
//     }
//     return GuidConverter();
//   }
//
//   @override
//   String? toJson(GuidConverter? object) {
//     if (object == null) {
//       return null;
//     }
//     return object.toString();
//   }
// }*/
// */
