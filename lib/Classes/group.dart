class Groupe {
  int? id;
  String? code;
  String? nom;
  int? nombreDeMembres;
  int? nombreDeMembresFemmes;
  int? numeroDuCycle;
  double? tauxDePresence;
  double? tauxDabandon;
  double? tauxDeCroissanceDeLadhesion;
  int? valeurDesEconomiesDeCeCycle;
  double? epargneMoyenneAnnualiseeParMembre;
  int? valeurDesPretsEnCours;
  double? tailleMoyenneDesPretsEnCoursParMembre;
  double? pourcentageDeMembresAyantDesPretsEnCours;
  double? tauxDutilisationDesFonds;
  double? tauxDePassationEnPerte;
  double? dividendesVerses;
  double? retourSurLesEconomies;
  double? soldeBancaire;
  double? soldeDuFondsSocial;
  double? dettesExterieures;
  int? ageDuGroupeEnMois;
  String? village;
  int? membreAyantEnChargeDesEnfants;
  int? membresParentsDEnfantsRC;
  int? membresQuiMenentDesActivitesGeneratricesDeRevenus;
  int? membresEnceintes;
  int? membresAllaitantes;
  int? membresDeMoinsDe12Ans;
  int? membresDe12AMoinsDe18Ans;
  int? membresDe18AMoinsDe35Ans;
  int? enfants0A18AnsPrisEnCharge;
  int? enfantsRCPrisEnCharge;
  int? enfants0A5AnsPrisEnCharge;
  int? enfants5A14AnsPrisEnCharge;
  int? groupeEnConnectionAvecImf;
  int? membresBeneficiantDeLimf;
  String? commune;
  String? departement;
  String? nomDuPresident;
  String? genreDuPresident;
  String? numeroTelDuPresident;

  // Constructeur
  Groupe({
    this.id,
    this.code,
    this.nom,
    this.nombreDeMembres,
    this.nombreDeMembresFemmes,
    this.numeroDuCycle,
    this.tauxDePresence,
    this.tauxDabandon,
    this.tauxDeCroissanceDeLadhesion,
    this.valeurDesEconomiesDeCeCycle,
    this.epargneMoyenneAnnualiseeParMembre,
    this.valeurDesPretsEnCours,
    this.tailleMoyenneDesPretsEnCoursParMembre,
    this.pourcentageDeMembresAyantDesPretsEnCours,
    this.tauxDutilisationDesFonds,
    this.tauxDePassationEnPerte,
    this.dividendesVerses,
    this.retourSurLesEconomies,
    this.soldeBancaire,
    this.soldeDuFondsSocial,
    this.dettesExterieures,
    this.ageDuGroupeEnMois,
    this.village,
    this.membreAyantEnChargeDesEnfants,
    this.membresParentsDEnfantsRC,
    this.membresQuiMenentDesActivitesGeneratricesDeRevenus,
    this.membresEnceintes,
    this.membresAllaitantes,
    this.membresDeMoinsDe12Ans,
    this.membresDe12AMoinsDe18Ans,
    this.membresDe18AMoinsDe35Ans,
    this.enfants0A18AnsPrisEnCharge,
    this.enfantsRCPrisEnCharge,
    this.enfants0A5AnsPrisEnCharge,
    this.enfants5A14AnsPrisEnCharge,
    this.groupeEnConnectionAvecImf,
    this.membresBeneficiantDeLimf,
    this.commune,
    this.departement,
    this.nomDuPresident,
    this.genreDuPresident,
    this.numeroTelDuPresident,
  });

  // Convertir un objet Groupe en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'nom': nom,
      'nombreDeMembres': nombreDeMembres,
      'nombreDeMembresFemmes': nombreDeMembresFemmes,
      'numeroDuCycle': numeroDuCycle,
      'tauxDePresence': tauxDePresence,
      'tauxDabandon': tauxDabandon,
      'tauxDeCroissanceDeLadhesion': tauxDeCroissanceDeLadhesion,
      'valeurDesEconomiesDeCeCycle': valeurDesEconomiesDeCeCycle,
      'epargneMoyenneAnnualiseeParMembre': epargneMoyenneAnnualiseeParMembre,
      'valeurDesPretsEnCours': valeurDesPretsEnCours,
      'tailleMoyenneDesPretsEnCoursParMembre':
          tailleMoyenneDesPretsEnCoursParMembre,
      'pourcentageDeMembresAyantDesPretsEnCours':
          pourcentageDeMembresAyantDesPretsEnCours,
      'tauxDutilisationDesFonds': tauxDutilisationDesFonds,
      'tauxDePassationEnPerte': tauxDePassationEnPerte,
      'dividendesVerses': dividendesVerses,
      'retourSurLesEconomies': retourSurLesEconomies,
      'soldeBancaire': soldeBancaire,
      'soldeDuFondsSocial': soldeDuFondsSocial,
      'dettesExterieures': dettesExterieures,
      'ageDuGroupeEnMois': ageDuGroupeEnMois,
      'village': village,
      'membreAyantEnChargeDesEnfants': membreAyantEnChargeDesEnfants,
      'membresParentsDEnfantsRC': membresParentsDEnfantsRC,
      'membresQuiMenentDesActivitesGeneratricesDeRevenus':
          membresQuiMenentDesActivitesGeneratricesDeRevenus,
      'membresEnceintes': membresEnceintes,
      'membresAllaitantes': membresAllaitantes,
      'membresDeMoinsDe12Ans': membresDeMoinsDe12Ans,
      'membresDe12AMoinsDe18Ans': membresDe12AMoinsDe18Ans,
      'membresDe18AMoinsDe35Ans': membresDe18AMoinsDe35Ans,
      'enfants0A18AnsPrisEnCharge': enfants0A18AnsPrisEnCharge,
      'enfantsRCPrisEnCharge': enfantsRCPrisEnCharge,
      'enfants0A5AnsPrisEnCharge': enfants0A5AnsPrisEnCharge,
      'enfants5A14AnsPrisEnCharge': enfants5A14AnsPrisEnCharge,
      'groupeEnConnectionAvecImf': groupeEnConnectionAvecImf,
      'membresBeneficiantDeLimf': membresBeneficiantDeLimf,
      'commune': commune,
      'departement': departement,
      'nomDuPresident': nomDuPresident,
      'genreDuPresident': genreDuPresident,
      'numeroTelDuPresident': numeroTelDuPresident,
    };
  }

  // Créer un objet Groupe à partir d'un Map
  factory Groupe.fromMap(Map<String, dynamic> map) {
    return Groupe(
      id: map['id'],
      code: map['code'],
      nom: map['nom'],
      nombreDeMembres: map['nombreDeMembres'],
      nombreDeMembresFemmes: map['nombreDeMembresFemmes'],
      numeroDuCycle: map['numeroDuCycle'],
      tauxDePresence: map['tauxDePresence'],
      tauxDabandon: map['tauxDabandon'],
      tauxDeCroissanceDeLadhesion: map['tauxDeCroissanceDeLadhesion'],
      valeurDesEconomiesDeCeCycle: map['valeurDesEconomiesDeCeCycle'],
      epargneMoyenneAnnualiseeParMembre:
          map['epargneMoyenneAnnualiseeParMembre'],
      valeurDesPretsEnCours: map['valeurDesPretsEnCours'],
      tailleMoyenneDesPretsEnCoursParMembre:
          map['tailleMoyenneDesPretsEnCoursParMembre'],
      pourcentageDeMembresAyantDesPretsEnCours:
          map['pourcentageDeMembresAyantDesPretsEnCours'],
      tauxDutilisationDesFonds: map['tauxDutilisationDesFonds'],
      tauxDePassationEnPerte: map['tauxDePassationEnPerte'],
      dividendesVerses: map['dividendesVerses'],
      retourSurLesEconomies: map['retourSurLesEconomies'],
      soldeBancaire: map['soldeBancaire'],
      soldeDuFondsSocial: map['soldeDuFondsSocial'],
      dettesExterieures: map['dettesExterieures'],
      ageDuGroupeEnMois: map['ageDuGroupeEnMois'],
      village: map['village'],
      membreAyantEnChargeDesEnfants: map['membreAyantEnChargeDesEnfants'],
      membresParentsDEnfantsRC: map['membresParentsDEnfantsRC'],
      membresQuiMenentDesActivitesGeneratricesDeRevenus:
          map['membresQuiMenentDesActivitesGeneratricesDeRevenus'],
      membresEnceintes: map['membresEnceintes'],
      membresAllaitantes: map['membresAllaitantes'],
      membresDeMoinsDe12Ans: map['membresDeMoinsDe12Ans'],
      membresDe12AMoinsDe18Ans: map['membresDe12AMoinsDe18Ans'],
      membresDe18AMoinsDe35Ans: map['membresDe18AMoinsDe35Ans'],
      enfants0A18AnsPrisEnCharge: map['enfants0A18AnsPrisEnCharge'],
      enfantsRCPrisEnCharge: map['enfantsRCPrisEnCharge'],
      enfants0A5AnsPrisEnCharge: map['enfants0A5AnsPrisEnCharge'],
      enfants5A14AnsPrisEnCharge: map['enfants5A14AnsPrisEnCharge'],
      groupeEnConnectionAvecImf: map['groupeEnConnectionAvecImf'],
      membresBeneficiantDeLimf: map['membresBeneficiantDeLimf'],
      commune: map['commune'],
      departement: map['departement'],
      nomDuPresident: map['nomDuPresident'],
      genreDuPresident: map['genreDuPresident'],
      numeroTelDuPresident: map['numeroTelDuPresident'],
    );
  }
}
