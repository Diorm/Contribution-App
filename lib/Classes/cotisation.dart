class Cotisation {
  final int id;
  final int groupeId;
  final double montant;
  final String mois;

  Cotisation({
    required this.id,
    required this.groupeId,
    required this.montant,
    required this.mois,
  });

  // Convertir une instance en un Map pour insérer dans la base de données
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'groupe_id': groupeId,
      'montant': montant,
      'mois': mois,
    };
  }

  // Convertir un Map en une instance de Cotisation
  factory Cotisation.fromMap(Map<String, dynamic> map) {
    return Cotisation(
      id: map['id'],
      groupeId: map['groupe_id'],
      montant: map['montant'],
      mois: map['mois'],
    );
  }
}
