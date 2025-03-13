class CharacterModel {
  InfoModel info;
  List<ResultsModel> results;

  CharacterModel({required this.info, required this.results});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      info: InfoModel.fromJson(json['info']),
      results: (json['results'] as List).map((v) => ResultsModel.fromJson(v)).toList(),
    );
  }
}

class InfoModel {
  int count;
  int pages;
  String? next;
  String? prev;

  InfoModel({required this.count, required this.pages, this.next, this.prev});

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      count: json['count'] ?? "",
      pages: json['pages'] ?? "",
      next: json['next'] ?? "",
      prev: json['prev'] ?? "",
    );
  }
}

class ResultsModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  OriginModel origin;
  OriginModel location;
  String image;
  List<String> episode;
  String url;
  String created;

  ResultsModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "", // Provide a fallback empty string if null
      status: json['status'] ?? "",
      species: json['species'] ?? "",
      type: json['type'] ?? "",
      gender: json['gender'] ?? "",
      origin: OriginModel.fromJson(json['origin']),
      location: OriginModel.fromJson(json['location']),
      image: json['image'] ?? "", // Provide a fallback empty string if null
      episode: List<String>.from(json['episode'] ?? []), // Handle null for episode list
      url: json['url'] ?? "",
      created: json['created'] ?? "", // Provide a fallback empty string if null
    );
  }
}

class OriginModel {
  String name;
  String url;

  OriginModel({required this.name, required this.url});

  factory OriginModel.fromJson(Map<String, dynamic> json) {
    return OriginModel(
      name: json['name'] ?? "", // Provide a fallback empty string if null
      url: json['url'] ?? "",   // Provide a fallback empty string if null
    );
  }
}
