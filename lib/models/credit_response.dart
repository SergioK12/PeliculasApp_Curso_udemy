// To parse this JSON data, do
//
//     final creditResponse = creditResponseFromMap(jsonString);

import 'dart:convert';

class CreditResponse {
    CreditResponse({
        this.id,
        required this.cast,
        this.crew,
    });

    int? id;
    List<Cast> cast;
    List<Cast?>? crew;

    factory CreditResponse.fromJson(String str) => CreditResponse.fromMap(json.decode(str));

    factory CreditResponse.fromMap(Map<String, dynamic> json) => CreditResponse(
        id: json["id"],
        cast: json["cast"] == null ? [] : List<Cast>.from(json["cast"]!.map((x) => Cast.fromMap(x))),
        crew: json["crew"] == null ? [] : List<Cast?>.from(json["crew"]!.map((x) => Cast.fromMap(x))),
  );

}

class Cast {
    Cast({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        this.profilePath,
        required this.castId,
        this.character,
        required this.creditId,
         this.order,
         this.department,
        this.job,
    });

    bool adult;
    int gender;
    int id;
    String knownForDepartment;
    String name;
    String originalName;
    double popularity;
    String? profilePath;
    int? castId;
    String? character;
    String creditId;
    int? order;
    String? department;
    String? job;

    get fullProfilePath {
    if(profilePath != null) return "https://image.tmdb.org/t/p/w500$profilePath";
    
    return  "https://i.stack.imgur.com/GNhxO.png";
  }

    factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment:json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
    };
}

