import 'package:datas_collection/Classes/group.dart';
import 'package:datas_collection/Services/database_helper.dart';
import 'package:datas_collection/theme/colors.dart';
import 'package:flutter/material.dart';

class NouveauGroupe extends StatefulWidget {
  const NouveauGroupe({
    super.key,
  });

  @override
  _NouveauGroupeState createState() => _NouveauGroupeState();
}

class _NouveauGroupeState extends State<NouveauGroupe> {
  late DatabaseHelper handler;
  Future<List<Groupe>> _loadGroupes() async {
    final groupesData = await handler.getAllGroupes();
    return groupesData; // Retourne la liste des groupes
  }

  @override
  void initState() {
    super.initState();
    handler = DatabaseHelper.instance;
    _loadGroupes();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _loadGroupes();
    });
  }

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  // Contrôleurs pour les champs de texte
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _nombreDeMembresController =
      TextEditingController();
  final TextEditingController _nombreDeMembresFemmesController =
      TextEditingController();
  final TextEditingController _numeroDuCycleController =
      TextEditingController();
  final TextEditingController _tauxDePresenceController =
      TextEditingController();
  final TextEditingController _tauxDabandonController = TextEditingController();
  final TextEditingController _tauxDeCroissanceDeLadhesionController =
      TextEditingController();
  final TextEditingController _valeurDesEconomiesDeCeCycleController =
      TextEditingController();
  final TextEditingController _epargneMoyenneAnnualiseeParMembreController =
      TextEditingController();
  final TextEditingController _valeurDesPretsEnCoursController =
      TextEditingController();
  final TextEditingController _tailleMoyenneDesPretsEnCoursParMembreController =
      TextEditingController();
  final TextEditingController
      _pourcentageDeMembresAyantDesPretsEnCoursController =
      TextEditingController();
  final TextEditingController _tauxDutilisationDesFondsController =
      TextEditingController();
  final TextEditingController _tauxDePassationEnPerteController =
      TextEditingController();
  final TextEditingController _dividendesVersesController =
      TextEditingController();
  final TextEditingController _retourSurLesEconomiesController =
      TextEditingController();
  final TextEditingController _soldeBancaireController =
      TextEditingController();
  final TextEditingController _soldeDuFondsSocialController =
      TextEditingController();
  final TextEditingController _dettesExterieuresController =
      TextEditingController();
  final TextEditingController _ageDuGroupeEnMoisController =
      TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _membreAyantEnChargeDesEnfantsController =
      TextEditingController();
  final TextEditingController _membresParentsDEnfantsRCController =
      TextEditingController();
  final TextEditingController
      _membresQuiMenentDesActivitesGeneratricesDeRevenusController =
      TextEditingController();
  final TextEditingController _membresEnceintesController =
      TextEditingController();
  final TextEditingController _membresAllaitantesController =
      TextEditingController();
  final TextEditingController _membresDeMoinsDe12AnsController =
      TextEditingController();
  final TextEditingController _membresDe12AMoinsDe18AnsController =
      TextEditingController();
  final TextEditingController _membresDe18AMoinsDe35AnsController =
      TextEditingController();
  final TextEditingController _enfants0A18AnsPrisEnChargeController =
      TextEditingController();
  final TextEditingController _enfantsRCPrisEnChargeController =
      TextEditingController();
  final TextEditingController _enfants0A5AnsPrisEnChargeController =
      TextEditingController();
  final TextEditingController _enfants5A14AnsPrisEnChargeController =
      TextEditingController();
  final TextEditingController _groupeEnConnectionAvecImfController =
      TextEditingController();
  final TextEditingController _membresBeneficiantDeLimfController =
      TextEditingController();
  final TextEditingController _communeController = TextEditingController();
  final TextEditingController _departementController = TextEditingController();
  final TextEditingController _nomDuPresidentController =
      TextEditingController();
  final TextEditingController _genreDuPresidentController =
      TextEditingController();
  final TextEditingController _numeroTelDuPresidentController =
      TextEditingController();
  final TextEditingController _femmeAyantBeneficieDuProgrammeRCController =
      TextEditingController();
  final TextEditingController _membresDecedesController =
      TextEditingController();
  final TextEditingController _presidentDuGroupeController =
      TextEditingController();
  final TextEditingController _membresAyantRecuLaFormationController =
      TextEditingController();
  final TextEditingController _nombreDeCyclesController =
      TextEditingController();
  final TextEditingController _autresCaracteristiquesController =
      TextEditingController();

  void _saveGroupe() async {
    try {
      if (_formkey.currentState!.validate()) {
        // showDialog(
        //   barrierDismissible: false,
        //   context: context,
        //   builder: (BuildContext context) {
        //     return const AlertDialog(
        //       content: CircularProgressIndicator(
        //         backgroundColor: Colors.red,
        //       ),
        //       title: Text("Enregistrement en cours..."),
        //     );
        //   },
        // );
        final groupe = Groupe(
          code: _codeController.text,
          nom: _nomController.text,
          nombreDeMembres: int.tryParse(_nombreDeMembresController.text),
          nombreDeMembresFemmes:
              int.tryParse(_nombreDeMembresFemmesController.text),
          numeroDuCycle: int.tryParse(_numeroDuCycleController.text),
          tauxDePresence: double.tryParse(_tauxDePresenceController.text),
          tauxDabandon: double.tryParse(_tauxDabandonController.text),
          tauxDeCroissanceDeLadhesion:
              double.tryParse(_tauxDeCroissanceDeLadhesionController.text),
          valeurDesEconomiesDeCeCycle:
              int.tryParse(_valeurDesEconomiesDeCeCycleController.text),
          epargneMoyenneAnnualiseeParMembre: double.tryParse(
              _epargneMoyenneAnnualiseeParMembreController.text),
          valeurDesPretsEnCours:
              int.tryParse(_valeurDesPretsEnCoursController.text),
          tailleMoyenneDesPretsEnCoursParMembre: double.tryParse(
              _tailleMoyenneDesPretsEnCoursParMembreController.text),
          pourcentageDeMembresAyantDesPretsEnCours: double.tryParse(
              _pourcentageDeMembresAyantDesPretsEnCoursController.text),
          tauxDutilisationDesFonds:
              double.tryParse(_tauxDutilisationDesFondsController.text),
          tauxDePassationEnPerte:
              double.tryParse(_tauxDePassationEnPerteController.text),
          dividendesVerses: double.tryParse(_dividendesVersesController.text),
          retourSurLesEconomies:
              double.tryParse(_retourSurLesEconomiesController.text),
          soldeBancaire: double.tryParse(_soldeBancaireController.text),
          soldeDuFondsSocial:
              double.tryParse(_soldeDuFondsSocialController.text),
          dettesExterieures: double.tryParse(_dettesExterieuresController.text),
          ageDuGroupeEnMois: int.tryParse(_ageDuGroupeEnMoisController.text),
          village: _villageController.text,
          membreAyantEnChargeDesEnfants:
              int.tryParse(_membreAyantEnChargeDesEnfantsController.text),
          membresParentsDEnfantsRC:
              int.tryParse(_membresParentsDEnfantsRCController.text),
          membresQuiMenentDesActivitesGeneratricesDeRevenus: int.tryParse(
              _membresQuiMenentDesActivitesGeneratricesDeRevenusController
                  .text),
          membresEnceintes: int.tryParse(_membresEnceintesController.text),
          membresAllaitantes: int.tryParse(_membresAllaitantesController.text),
          membresDeMoinsDe12Ans:
              int.tryParse(_membresDeMoinsDe12AnsController.text),
          membresDe12AMoinsDe18Ans:
              int.tryParse(_membresDe12AMoinsDe18AnsController.text),
          membresDe18AMoinsDe35Ans:
              int.tryParse(_membresDe18AMoinsDe35AnsController.text),
          enfants0A18AnsPrisEnCharge:
              int.tryParse(_enfants0A18AnsPrisEnChargeController.text),
          enfantsRCPrisEnCharge:
              int.tryParse(_enfantsRCPrisEnChargeController.text),
          enfants0A5AnsPrisEnCharge:
              int.tryParse(_enfants0A5AnsPrisEnChargeController.text),
          enfants5A14AnsPrisEnCharge:
              int.tryParse(_enfants5A14AnsPrisEnChargeController.text),
          groupeEnConnectionAvecImf:
              int.tryParse(_groupeEnConnectionAvecImfController.text),
          membresBeneficiantDeLimf:
              int.tryParse(_membresBeneficiantDeLimfController.text),
          commune: _communeController.text,
          departement: _departementController.text,
          nomDuPresident: _nomDuPresidentController.text,
          genreDuPresident: _genreDuPresidentController.text,
          numeroTelDuPresident: _numeroTelDuPresidentController.text,
        );

        await _databaseHelper.insertGroupe(groupe);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Groupe ajouté avec succès')),
        );

        await _loadGroupes();
        Navigator.pop(context, true);
      }
    } catch (e) {
      print("Erreur lors de l'ajout du groupe: $e");
      Navigator.pop(context); // Fermer le dialogue en cas d'erreur
      _showErrorMessage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: myblueColor,
        title: const Text(
          "Ajouter un Groupe",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        _buildTextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Le Code du groupe est obligatoire";
                            }
                            return null;
                          },
                          controller: _codeController,
                          labelText: 'Code',
                          icon: Icons.code,
                        ),
                        _buildTextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Le Nom du groupe est obligatoire";
                            }
                            return null;
                          },
                          controller: _nomController,
                          labelText: 'Nom',
                          icon: Icons.person,
                        ),
                        _buildTextFormField(
                          controller: _nombreDeMembresController,
                          labelText: 'Nombre de Membres',
                          icon: Icons.group,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _nombreDeMembresFemmesController,
                          labelText: 'Nombre de Membres Femmes',
                          icon: Icons.female,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _numeroDuCycleController,
                          labelText: 'Numéro du Cycle',
                          icon: Icons.repeat,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _tauxDePresenceController,
                          labelText: 'Taux de Présence',
                          icon: Icons.percent,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _tauxDabandonController,
                          labelText: 'Taux d\'Abandon',
                          icon: Icons.trending_down,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _tauxDeCroissanceDeLadhesionController,
                          labelText: 'Taux de Croissance de l\'Adhésion',
                          icon: Icons.trending_up,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _valeurDesEconomiesDeCeCycleController,
                          labelText: 'Valeur des Économies de ce Cycle',
                          icon: Icons.savings,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller:
                              _epargneMoyenneAnnualiseeParMembreController,
                          labelText: 'Épargne Moyenne Annualisée par Membre',
                          icon: Icons.money,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _valeurDesPretsEnCoursController,
                          labelText: 'Valeur des Prêts en Cours',
                          icon: Icons.attach_money,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller:
                              _tailleMoyenneDesPretsEnCoursParMembreController,
                          labelText:
                              'Taille Moyenne des Prêts en Cours par Membre',
                          icon: Icons.equalizer,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller:
                              _pourcentageDeMembresAyantDesPretsEnCoursController,
                          labelText:
                              'Pourcentage de Membres Ayant des Prêts en Cours',
                          icon: Icons.pie_chart,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _tauxDutilisationDesFondsController,
                          labelText: 'Taux d\'Utilisation des Fonds',
                          icon: Icons.bar_chart,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _tauxDePassationEnPerteController,
                          labelText: 'Taux de Passation en Perte',
                          icon: Icons.trending_flat,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _dividendesVersesController,
                          labelText: 'Dividendes Versés',
                          icon: Icons.payments,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _retourSurLesEconomiesController,
                          labelText: 'Retour sur les Économies',
                          icon: Icons.show_chart,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _soldeBancaireController,
                          labelText: 'Solde Bancaire',
                          icon: Icons.account_balance,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _soldeDuFondsSocialController,
                          labelText: 'Solde du Fonds Social',
                          icon: Icons.account_balance_wallet,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _dettesExterieuresController,
                          labelText: 'Dettes Extérieures',
                          icon: Icons.account_balance_outlined,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        _buildTextFormField(
                          controller: _ageDuGroupeEnMoisController,
                          labelText: 'Âge du Groupe en Mois',
                          icon: Icons.calendar_today,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Le Nom du Village  du groupe est obligatoire";
                            }
                            return null;
                          },
                          controller: _villageController,
                          labelText: 'Village',
                          icon: Icons.location_city,
                        ),
                        _buildTextFormField(
                          controller: _membreAyantEnChargeDesEnfantsController,
                          labelText: 'Membre Ayant en Charge des Enfants',
                          icon: Icons.child_care,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _membresParentsDEnfantsRCController,
                          labelText: 'Membres Parents d\'Enfants RC',
                          icon: Icons.family_restroom,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller:
                              _membresQuiMenentDesActivitesGeneratricesDeRevenusController,
                          labelText:
                              'Membres Menant des Activités Génératrices de Revenus',
                          icon: Icons.business,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _membresEnceintesController,
                          labelText: 'Membres Enceintes',
                          icon: Icons.pregnant_woman,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _membresAllaitantesController,
                          labelText: 'Membres Allaitantes',
                          icon: Icons.baby_changing_station,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _membresDeMoinsDe12AnsController,
                          labelText: 'Membres de Moins de 12 Ans',
                          icon: Icons.child_friendly,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _membresDe12AMoinsDe18AnsController,
                          labelText: 'Membres de 12 à Moins de 18 Ans',
                          icon: Icons.people,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _membresDe18AMoinsDe35AnsController,
                          labelText: 'Membres de 18 à Moins de 35 Ans',
                          icon: Icons.people_alt,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _enfants0A18AnsPrisEnChargeController,
                          labelText: 'Enfants de 0 à 18 Ans Pris en Charge',
                          icon: Icons.child_care,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _enfantsRCPrisEnChargeController,
                          labelText: 'Enfants RC Pris en Charge',
                          icon: Icons.child_friendly,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _enfants0A5AnsPrisEnChargeController,
                          labelText: 'Enfants de 0 à 5 Ans Pris en Charge',
                          icon: Icons.baby_changing_station,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _enfants5A14AnsPrisEnChargeController,
                          labelText: 'Enfants de 5 à 14 Ans Pris en Charge',
                          icon: Icons.child_care,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _groupeEnConnectionAvecImfController,
                          labelText: 'Groupe en Connection avec IMF',
                          icon: Icons.connect_without_contact,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _membresBeneficiantDeLimfController,
                          labelText: 'Membres Bénéficiant de l\'IMF',
                          icon: Icons.receipt_long,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller:
                              _femmeAyantBeneficieDuProgrammeRCController,
                          labelText: 'Femme Ayant Bénéficié du Programme RC',
                          icon: Icons.support,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _membresDecedesController,
                          labelText: 'Membres Décédés',
                          icon: Icons.person_remove,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _presidentDuGroupeController,
                          labelText: 'Président du Groupe',
                          icon: Icons.person_pin,
                        ),
                        _buildTextFormField(
                          controller: _membresAyantRecuLaFormationController,
                          labelText: 'Membres Ayant Reçu la Formation',
                          icon: Icons.school,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _nombreDeCyclesController,
                          labelText: 'Nombre de Cycles',
                          icon: Icons.sync,
                          keyboardType: TextInputType.number,
                        ),
                        _buildTextFormField(
                          controller: _autresCaracteristiquesController,
                          labelText: 'Autres Caractéristiques',
                          icon: Icons.list_alt,
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveGroupe,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  'Ajouter',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to build TextFormFields with icons and styles
Widget _buildTextFormField({
  required TextEditingController controller,
  required String labelText,
  IconData? icon,
  String? Function(String?)? validator,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

void _showErrorMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text(
            "Une erreur s'est produite lors de l'enregistrement de l'étudiant."),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
