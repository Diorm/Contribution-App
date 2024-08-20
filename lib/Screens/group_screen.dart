import 'package:datas_collection/Classes/group.dart';
import 'package:datas_collection/Classes/individu.dart';
import 'package:datas_collection/Services/database_helper.dart';
import 'package:datas_collection/Widgets/drawer.dart';
import 'package:datas_collection/theme/colors.dart';
import 'package:flutter/material.dart';

class GroupesScreen extends StatefulWidget {
  const GroupesScreen({super.key});

  @override
  _GroupesScreenState createState() => _GroupesScreenState();
}

class _GroupesScreenState extends State<GroupesScreen> {
  late DatabaseHelper handler;
  late Future<List<Groupe>> groupes;

  final nomGroupeController = TextEditingController();
  final codeController = TextEditingController();
  final nombreDeMembresController = TextEditingController();
  final nombreDeMembresFemmesController = TextEditingController();
  final numeroDuCycleController = TextEditingController();
  final tauxDePresenceController = TextEditingController();
  final tauxDabandonController = TextEditingController();
  final tauxDeCroissanceDeLadhesionController = TextEditingController();
  final valeurDesEconomiesDeCeCycleController = TextEditingController();
  final epargneMoyenneAnnualiseeParMembreController = TextEditingController();
  final valeurDesPretsEnCoursController = TextEditingController();
  final tailleMoyenneDesPretsEnCoursParMembreController =
      TextEditingController();
  final pourcentageDeMembresAyantDesPretsEnCoursController =
      TextEditingController();
  final tauxDutilisationDesFondsController = TextEditingController();
  final tauxDePassationEnPerteController = TextEditingController();
  final dividendesVersesController = TextEditingController();
  final retourSurLesEconomiesController = TextEditingController();
  final soldeBancaireController = TextEditingController();
  final soldeDuFondsSocialController = TextEditingController();
  final dettesExterieuresController = TextEditingController();
  final ageDuGroupeEnMoisController = TextEditingController();
  final villageController = TextEditingController();
  final membreAyantEnChargeDesEnfantsController = TextEditingController();
  final membresParentsDEnfantsRCController = TextEditingController();
  final membresQuiMenentDesActivitesGeneratricesDeRevenusController =
      TextEditingController();
  final membresEnceintesController = TextEditingController();
  final membresAllaitantesController = TextEditingController();
  final membresDeMoinsDe12AnsController = TextEditingController();
  final membresDe12AMoinsDe18AnsController = TextEditingController();
  final membresDe18AMoinsDe35AnsController = TextEditingController();
  final enfants0A18AnsPrisEnChargeController = TextEditingController();
  final enfantsRCPrisEnChargeController = TextEditingController();
  final enfants0A5AnsPrisEnChargeController = TextEditingController();
  final enfants5A14AnsPrisEnChargeController = TextEditingController();
  final groupeEnConnectionAvecImfController = TextEditingController();
  final membresBeneficiantDeLimfController = TextEditingController();
  final communeController = TextEditingController();
  final departementController = TextEditingController();
  final nomDuPresidentController = TextEditingController();
  final genreDuPresidentController = TextEditingController();
  final numeroTelDuPresidentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<IndividuJson> selectedIndividus = [];

  @override
  void initState() {
    super.initState();
    handler = DatabaseHelper.instance;
    groupes = handler.getAllGroupes();
  }

  Future<void> _onRefresh() async {
    setState(() {
      groupes = handler.getAllGroupes();
    });
  }

  void addGroupe(List<IndividuJson> selectedIndividus) async {
    var res = await handler.insertGroupe(Groupe(
      code: codeController.text,
      nom: nomGroupeController.text,
      nombreDeMembres: int.parse(nombreDeMembresController.text),
      nombreDeMembresFemmes: int.parse(nombreDeMembresFemmesController.text),
      numeroDuCycle: int.parse(numeroDuCycleController.text),
      tauxDePresence: double.parse(tauxDePresenceController.text),
      tauxDabandon: double.parse(tauxDabandonController.text),
      tauxDeCroissanceDeLadhesion:
          double.parse(tauxDeCroissanceDeLadhesionController.text),
      valeurDesEconomiesDeCeCycle:
          int.parse(valeurDesEconomiesDeCeCycleController.text),
      epargneMoyenneAnnualiseeParMembre:
          double.parse(epargneMoyenneAnnualiseeParMembreController.text),
      valeurDesPretsEnCours: int.parse(valeurDesPretsEnCoursController.text),
      tailleMoyenneDesPretsEnCoursParMembre:
          double.parse(tailleMoyenneDesPretsEnCoursParMembreController.text),
      pourcentageDeMembresAyantDesPretsEnCours:
          double.parse(pourcentageDeMembresAyantDesPretsEnCoursController.text),
      tauxDutilisationDesFonds:
          double.parse(tauxDutilisationDesFondsController.text),
      tauxDePassationEnPerte:
          double.parse(tauxDePassationEnPerteController.text),
      dividendesVerses: double.parse(dividendesVersesController.text),
      retourSurLesEconomies: double.parse(retourSurLesEconomiesController.text),
      soldeBancaire: double.parse(soldeBancaireController.text),
      soldeDuFondsSocial: double.parse(soldeDuFondsSocialController.text),
      dettesExterieures: double.parse(dettesExterieuresController.text),
      ageDuGroupeEnMois: int.parse(ageDuGroupeEnMoisController.text),
      village: villageController.text,
      membreAyantEnChargeDesEnfants:
          int.parse(membreAyantEnChargeDesEnfantsController.text),
      membresParentsDEnfantsRC:
          int.parse(membresParentsDEnfantsRCController.text),
      membresQuiMenentDesActivitesGeneratricesDeRevenus: int.parse(
          membresQuiMenentDesActivitesGeneratricesDeRevenusController.text),
      membresEnceintes: int.parse(membresEnceintesController.text),
      membresAllaitantes: int.parse(membresAllaitantesController.text),
      membresDeMoinsDe12Ans: int.parse(membresDeMoinsDe12AnsController.text),
      membresDe12AMoinsDe18Ans:
          int.parse(membresDe12AMoinsDe18AnsController.text),
      membresDe18AMoinsDe35Ans:
          int.parse(membresDe18AMoinsDe35AnsController.text),
      enfants0A18AnsPrisEnCharge:
          int.parse(enfants0A18AnsPrisEnChargeController.text),
      enfantsRCPrisEnCharge: int.parse(enfantsRCPrisEnChargeController.text),
      enfants0A5AnsPrisEnCharge:
          int.parse(enfants0A5AnsPrisEnChargeController.text),
      enfants5A14AnsPrisEnCharge:
          int.parse(enfants5A14AnsPrisEnChargeController.text),
      groupeEnConnectionAvecImf:
          int.parse(groupeEnConnectionAvecImfController.text),
      membresBeneficiantDeLimf:
          int.parse(membresBeneficiantDeLimfController.text),
      commune: communeController.text,
      departement: departementController.text,
      nomDuPresident: nomDuPresidentController.text,
      genreDuPresident: genreDuPresidentController.text,
      numeroTelDuPresident: numeroTelDuPresidentController.text,
      membres: selectedIndividus,
    ));
    if (res > 0) {
      setState(() {
        _onRefresh();
      });
    }
  }

  void showAddGroupeDialog(BuildContext context) {
    selectedIndividus = [];
    handler.getAllIndividu().then((individusList) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Ajouter un Groupe"),
            content: SizedBox(
              width: 400,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: nomGroupeController,
                        decoration:
                            const InputDecoration(labelText: "Nom du Groupe"),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Le nom du groupe est obligatoire";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: codeController,
                        decoration:
                            const InputDecoration(labelText: "Code du Groupe"),
                      ),
                      TextFormField(
                        controller: nombreDeMembresController,
                        decoration: const InputDecoration(
                            labelText: "Nombre de Membres"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: nombreDeMembresFemmesController,
                        decoration: const InputDecoration(
                            labelText: "Nombre de Membres Femmes"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: numeroDuCycleController,
                        decoration:
                            const InputDecoration(labelText: "Numéro du Cycle"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: tauxDePresenceController,
                        decoration: const InputDecoration(
                            labelText: "Taux de Présence"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: tauxDabandonController,
                        decoration:
                            const InputDecoration(labelText: "Taux d'Abandon"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: tauxDeCroissanceDeLadhesionController,
                        decoration: const InputDecoration(
                            labelText: "Taux de Croissance de l'Adhésion"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: valeurDesEconomiesDeCeCycleController,
                        decoration: const InputDecoration(
                            labelText: "Valeur des Économies de ce Cycle"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: epargneMoyenneAnnualiseeParMembreController,
                        decoration: const InputDecoration(
                            labelText: "Épargne Moyenne Annualisée par Membre"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: valeurDesPretsEnCoursController,
                        decoration: const InputDecoration(
                            labelText: "Valeur des Prêts en Cours"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller:
                            tailleMoyenneDesPretsEnCoursParMembreController,
                        decoration: const InputDecoration(
                            labelText:
                                "Taille Moyenne des Prêts en Cours par Membre"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller:
                            pourcentageDeMembresAyantDesPretsEnCoursController,
                        decoration: const InputDecoration(
                            labelText:
                                "Pourcentage de Membres ayant des Prêts en Cours"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: tauxDutilisationDesFondsController,
                        decoration: const InputDecoration(
                            labelText: "Taux d'Utilisation des Fonds"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: tauxDePassationEnPerteController,
                        decoration: const InputDecoration(
                            labelText: "Taux de Passation en Perte"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: dividendesVersesController,
                        decoration: const InputDecoration(
                            labelText: "Dividendes Versés"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: retourSurLesEconomiesController,
                        decoration: const InputDecoration(
                            labelText: "Retour sur les Économies"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: soldeBancaireController,
                        decoration:
                            const InputDecoration(labelText: "Solde Bancaire"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: soldeDuFondsSocialController,
                        decoration: const InputDecoration(
                            labelText: "Solde du Fonds Social"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: dettesExterieuresController,
                        decoration: const InputDecoration(
                            labelText: "Dettes Extérieures"),
                        keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                      ),
                      TextFormField(
                        controller: ageDuGroupeEnMoisController,
                        decoration: const InputDecoration(
                            labelText: "Âge du Groupe (en mois)"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: villageController,
                        decoration: const InputDecoration(labelText: "Village"),
                      ),
                      TextFormField(
                        controller: membreAyantEnChargeDesEnfantsController,
                        decoration: const InputDecoration(
                            labelText: "Membre ayant en charge des enfants"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: membresParentsDEnfantsRCController,
                        decoration: const InputDecoration(
                            labelText: "Membres Parents d'Enfants RC"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller:
                            membresQuiMenentDesActivitesGeneratricesDeRevenusController,
                        decoration: const InputDecoration(
                            labelText:
                                "Membres menant des activités génératrices de revenus"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: membresEnceintesController,
                        decoration: const InputDecoration(
                            labelText: "Membres Enceintes"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: membresAllaitantesController,
                        decoration: const InputDecoration(
                            labelText: "Membres Allaitantes"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: membresDeMoinsDe12AnsController,
                        decoration: const InputDecoration(
                            labelText: "Membres de moins de 12 ans"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: membresDe12AMoinsDe18AnsController,
                        decoration: const InputDecoration(
                            labelText: "Membres de 12 à moins de 18 ans"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: membresDe18AMoinsDe35AnsController,
                        decoration: const InputDecoration(
                            labelText: "Membres de 18 à moins de 35 ans"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: enfants0A18AnsPrisEnChargeController,
                        decoration: const InputDecoration(
                            labelText: "Enfants de 0 à 18 ans pris en charge"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: enfantsRCPrisEnChargeController,
                        decoration: const InputDecoration(
                            labelText: "Enfants RC pris en charge"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: enfants0A5AnsPrisEnChargeController,
                        decoration: const InputDecoration(
                            labelText: "Enfants de 0 à 5 ans pris en charge"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: enfants5A14AnsPrisEnChargeController,
                        decoration: const InputDecoration(
                            labelText: "Enfants de 5 à 14 ans pris en charge"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: groupeEnConnectionAvecImfController,
                        decoration: const InputDecoration(
                            labelText: "Groupe en connexion avec IMF"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: membresBeneficiantDeLimfController,
                        decoration: const InputDecoration(
                            labelText: "Membres bénéficiant de l'IMF"),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        controller: communeController,
                        decoration: const InputDecoration(labelText: "Commune"),
                      ),
                      TextFormField(
                        controller: departementController,
                        decoration:
                            const InputDecoration(labelText: "Département"),
                      ),
                      TextFormField(
                        controller: nomDuPresidentController,
                        decoration: const InputDecoration(
                            labelText: "Nom du Président"),
                      ),
                      TextFormField(
                        controller: genreDuPresidentController,
                        decoration: const InputDecoration(
                            labelText: "Genre du Président"),
                      ),
                      TextFormField(
                        controller: numeroTelDuPresidentController,
                        decoration: const InputDecoration(
                            labelText: "Numéro de Téléphone du Président"),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        "Sélectionner au moins un individu",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: individusList.length,
                            itemBuilder: (context, index) {
                              return CheckboxListTile(
                                title: Text(
                                  '${individusList[index].prenom} ${individusList[index].nom}',
                                ),
                                value: selectedIndividus
                                    .contains(individusList[index]),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      selectedIndividus
                                          .add(individusList[index]);
                                    } else {
                                      selectedIndividus
                                          .remove(individusList[index]);
                                    }
                                  });
                                },
                              );
                            },
                          );
                        },
                      ),
                      if (selectedIndividus.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Au moins un individu doit être sélectionné",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      selectedIndividus.isNotEmpty) {
                    addGroupe(selectedIndividus);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Ajouter"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Annuler"),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: myblueColor,
        title: const Text(
          "Groupes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myblueColor,
        onPressed: () {
          showAddGroupeDialog(context);
          nomGroupeController.clear();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder<List<Groupe>>(
        future: groupes,
        builder: (BuildContext context, AsyncSnapshot<List<Groupe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text("Aucun Groupe Trouvé !!!"));
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur: ${snapshot.error.toString()}"));
          } else {
            final items = snapshot.data ?? <Groupe>[];
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 10.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: FutureBuilder<Map<String, dynamic>>(
                    future: getCotisationSummary(items[index].id!),
                    builder: (context, cotisationSnapshot) {
                      if (cotisationSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          title: Text(
                            items[index].nom,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                          subtitle: const Text("Chargement des cotisations..."),
                        );
                      } else if (cotisationSnapshot.hasError) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          title: Text(
                            items[index].nom,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                          subtitle: Text(
                            "Erreur: ${cotisationSnapshot.error}",
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      } else {
                        final cotisationData = cotisationSnapshot.data!;
                        return ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                items[index].nom,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Text(
                                  'Individus: ${items[index].membres.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8.0),
                              Text(
                                "Total cotisations: ${cotisationData['total']}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "Dernière cotisation: ${cotisationData['derniere'] ?? 0}",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              deleteGroupe(items[index].id);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> deleteGroupe(int? id) async {
    await handler.deleteGroupe(id!);
    _onRefresh();
  }

  Future<Map<String, dynamic>> getCotisationSummary(int groupeId) async {
    var res = await handler.getCotisationSummary(groupeId);
    return res;
  }

  @override
  void dispose() {
    nomGroupeController.dispose();
    super.dispose();
  }
}
