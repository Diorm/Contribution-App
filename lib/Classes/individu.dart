import 'dart:convert';

IndividuJson IndividuJsonFromMap(String str) =>
    IndividuJson.fromMap(json.decode(str));

String IndividuJsonToMap(IndividuJson data) => json.encode(data.toMap());

class IndividuJson {
  final int? id;
  final String prenom;
  final String nom;
  final String telephone;
  final String adresse;

  IndividuJson({
    this.id,
    required this.prenom,
    required this.nom,
    required this.telephone,
    required this.adresse,
  });

  factory IndividuJson.fromMap(Map<String, dynamic> json) => IndividuJson(
        id: json["id"],
        prenom: json["prenom"],
        nom: json["nom"],
        telephone: json["telephone"],
        adresse: json["adresse"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "prenom": prenom,
        "nom": nom,
        "telephone": telephone,
        "adresse": adresse,
      };
}
