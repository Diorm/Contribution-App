import 'package:datas_collection/Classes/individu.dart';

class Groupe {
  final int? id;
  final String code;
  final String nom;
  final int nombreDeMembres;
  final int nombreDeMembresFemmes;
  final int numeroDuCycle;
  final double tauxDePresence;
  final double tauxDabandon;
  final double tauxDeCroissanceDeLadhesion;
  final int valeurDesEconomiesDeCeCycle;
  final double epargneMoyenneAnnualiseeParMembre;
  final int valeurDesPretsEnCours;
  final double tailleMoyenneDesPretsEnCoursParMembre;
  final double pourcentageDeMembresAyantDesPretsEnCours;
  final double tauxDutilisationDesFonds;
  final double tauxDePassationEnPerte;
  final double dividendesVerses;
  final double retourSurLesEconomies;
  final double soldeBancaire;
  final double soldeDuFondsSocial;
  final double dettesExterieures;
  final int ageDuGroupeEnMois;
  final String village;
  final int membreAyantEnChargeDesEnfants;
  final int membresParentsDEnfantsRC;
  final int membresQuiMenentDesActivitesGeneratricesDeRevenus;
  final int membresEnceintes;
  final int membresAllaitantes;
  final int membresDeMoinsDe12Ans;
  final int membresDe12AMoinsDe18Ans;
  final int membresDe18AMoinsDe35Ans;
  final int enfants0A18AnsPrisEnCharge;
  final int enfantsRCPrisEnCharge;
  final int enfants0A5AnsPrisEnCharge;
  final int enfants5A14AnsPrisEnCharge;
  final int groupeEnConnectionAvecImf;
  final int membresBeneficiantDeLimf;
  final String commune;
  final String departement;
  final String nomDuPresident;
  final String genreDuPresident;
  final String numeroTelDuPresident;
  final List<IndividuJson> membres;

  Groupe({
    this.id,
    required this.code,
    required this.nom,
    required this.nombreDeMembres,
    required this.nombreDeMembresFemmes,
    required this.numeroDuCycle,
    required this.tauxDePresence,
    required this.tauxDabandon,
    required this.tauxDeCroissanceDeLadhesion,
    required this.valeurDesEconomiesDeCeCycle,
    required this.epargneMoyenneAnnualiseeParMembre,
    required this.valeurDesPretsEnCours,
    required this.tailleMoyenneDesPretsEnCoursParMembre,
    required this.pourcentageDeMembresAyantDesPretsEnCours,
    required this.tauxDutilisationDesFonds,
    required this.tauxDePassationEnPerte,
    required this.dividendesVerses,
    required this.retourSurLesEconomies,
    required this.soldeBancaire,
    required this.soldeDuFondsSocial,
    required this.dettesExterieures,
    required this.ageDuGroupeEnMois,
    required this.village,
    required this.membreAyantEnChargeDesEnfants,
    required this.membresParentsDEnfantsRC,
    required this.membresQuiMenentDesActivitesGeneratricesDeRevenus,
    required this.membresEnceintes,
    required this.membresAllaitantes,
    required this.membresDeMoinsDe12Ans,
    required this.membresDe12AMoinsDe18Ans,
    required this.membresDe18AMoinsDe35Ans,
    required this.enfants0A18AnsPrisEnCharge,
    required this.enfantsRCPrisEnCharge,
    required this.enfants0A5AnsPrisEnCharge,
    required this.enfants5A14AnsPrisEnCharge,
    required this.groupeEnConnectionAvecImf,
    required this.membresBeneficiantDeLimf,
    required this.commune,
    required this.departement,
    required this.nomDuPresident,
    required this.genreDuPresident,
    required this.numeroTelDuPresident,
    this.membres = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'code': code,
      "nom": nom,
      "nombreDeMembres": nombreDeMembres,
      "nombreDeMembresFemmes": nombreDeMembresFemmes,
      "numeroDuCycle": numeroDuCycle,
      "tauxDePresence": tauxDePresence,
      "tauxDabandon": tauxDabandon,
      "tauxDeCroissanceDeLadhesion": tauxDeCroissanceDeLadhesion,
      "valeurDesEconomiesDeCeCycle": valeurDesEconomiesDeCeCycle,
      "epargneMoyenneAnnualiseeParMembre": epargneMoyenneAnnualiseeParMembre,
      "valeurDesPretsEnCours": valeurDesPretsEnCours,
      "tailleMoyenneDesPretsEnCoursParMembre":
          tailleMoyenneDesPretsEnCoursParMembre,
      "pourcentageDeMembresAyantDesPretsEnCours":
          pourcentageDeMembresAyantDesPretsEnCours,
      "tauxDutilisationDesFonds": tauxDutilisationDesFonds,
      "tauxDePassationEnPerte": tauxDePassationEnPerte,
      "dividendesVerses": dividendesVerses,
      "retourSurLesEconomies": retourSurLesEconomies,
      "soldeBancaire": soldeBancaire,
      "soldeDuFondsSocial": soldeDuFondsSocial,
      "dettesExterieures": dettesExterieures,
      "ageDuGroupeEnMois": ageDuGroupeEnMois,
      "village": village,
      "membreAyantEnChargeDesEnfants": membreAyantEnChargeDesEnfants,
      "membresParentsDEnfantsRC": membresParentsDEnfantsRC,
      "membresQuiMenentDesActivitesGeneratricesDeRevenus":
          membresQuiMenentDesActivitesGeneratricesDeRevenus,
      "membresEnceintes": membresEnceintes,
      "membresAllaitantes": membresAllaitantes,
      "membresDeMoinsDe12Ans": membresDeMoinsDe12Ans,
      "membresDe12AMoinsDe18Ans": membresDe12AMoinsDe18Ans,
      "membresDe18AMoinsDe35Ans": membresDe18AMoinsDe35Ans,
      "enfants0A18AnsPrisEnCharge": enfants0A18AnsPrisEnCharge,
      "enfantsRCPrisEnCharge": enfantsRCPrisEnCharge,
      "enfants0A5AnsPrisEnCharge": enfants0A5AnsPrisEnCharge,
      "enfants5A14AnsPrisEnCharge": enfants5A14AnsPrisEnCharge,
      "groupeEnConnectionAvecImf": groupeEnConnectionAvecImf,
      "membresBeneficiantDeLimf": membresBeneficiantDeLimf,
      "commune": commune,
      "departement": departement,
      "nomDuPresident": nomDuPresident,
      "genreDuPresident": genreDuPresident,
      "numeroTelDuPresident": numeroTelDuPresident,
      "membres":
          membres.map((m) => m.id).toList(), // Stocker les IDs des membres
    };
  }

  factory Groupe.fromMap(Map<String, dynamic> map) {
    return Groupe(
      id: map["id"],
      code: map["code"],
      nom: map["nom"],
      nombreDeMembres: map["nombreDeMembres"],
      nombreDeMembresFemmes: map["nombreDeMembresFemmes"],
      numeroDuCycle: map["numeroDuCycle"],
      tauxDePresence: map["tauxDePresence"],
      tauxDabandon: map["tauxDabandon"],
      tauxDeCroissanceDeLadhesion: map["tauxDeCroissanceDeLadhesion"],
      valeurDesEconomiesDeCeCycle: map["valeurDesEconomiesDeCeCycle"],
      epargneMoyenneAnnualiseeParMembre:
          map["epargneMoyenneAnnualiseeParMembre"],
      valeurDesPretsEnCours: map["valeurDesPretsEnCours"],
      tailleMoyenneDesPretsEnCoursParMembre:
          map["tailleMoyenneDesPretsEnCoursParMembre"],
      pourcentageDeMembresAyantDesPretsEnCours:
          map["pourcentageDeMembresAyantDesPretsEnCours"],
      tauxDutilisationDesFonds: map["tauxDutilisationDesFonds"],
      tauxDePassationEnPerte: map["tauxDePassationEnPerte"],
      dividendesVerses: map["dividendesVerses"],
      retourSurLesEconomies: map["retourSurLesEconomies"],
      soldeBancaire: map["soldeBancaire"],
      soldeDuFondsSocial: map["soldeDuFondsSocial"],
      dettesExterieures: map["dettesExterieures"],
      ageDuGroupeEnMois: map["ageDuGroupeEnMois"],
      village: map["village"],
      membreAyantEnChargeDesEnfants: map["membreAyantEnChargeDesEnfants"],
      membresParentsDEnfantsRC: map["membresParentsDEnfantsRC"],
      membresQuiMenentDesActivitesGeneratricesDeRevenus:
          map["membresQuiMenentDesActivitesGeneratricesDeRevenus"],
      membresEnceintes: map["membresEnceintes"],
      membresAllaitantes: map["membresAllaitantes"],
      membresDeMoinsDe12Ans: map["membresDeMoinsDe12Ans"],
      membresDe12AMoinsDe18Ans: map["membresDe12AMoinsDe18Ans"],
      membresDe18AMoinsDe35Ans: map["membresDe18AMoinsDe35Ans"],
      enfants0A18AnsPrisEnCharge: map["enfants0A18AnsPrisEnCharge"],
      enfantsRCPrisEnCharge: map["enfantsRCPrisEnCharge"],
      enfants0A5AnsPrisEnCharge: map["enfants0A5AnsPrisEnCharge"],
      enfants5A14AnsPrisEnCharge: map["enfants5A14AnsPrisEnCharge"],
      groupeEnConnectionAvecImf: map["groupeEnConnectionAvecImf"],
      membresBeneficiantDeLimf: map["membresBeneficiantDeLimf"],
      commune: map["commune"],
      departement: map["departement"],
      nomDuPresident: map["nomDuPresident"],
      genreDuPresident: map["genreDuPresident"],
      numeroTelDuPresident: map["numeroTelDuPresident"],
      membres: List<IndividuJson>.from(map["membres"].map((id) => IndividuJson(
            id: id,
            nom: 'nom', // À ajuster selon votre logique
            prenom: 'prenom', // À ajuster selon votre logique
            telephone: 'telephone', // À ajuster selon votre logique
            adresse: 'adresse', // À ajuster selon votre logique
          ))), // Ajustez si nécessaire
    );
  }
}
