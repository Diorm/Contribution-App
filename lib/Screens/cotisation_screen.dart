import 'package:datas_collection/Widgets/drawer.dart';
import 'package:datas_collection/Widgets/my_card.dart';
import 'package:datas_collection/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:datas_collection/Classes/group.dart';
import 'package:datas_collection/Services/database_helper.dart';

class CotisationsScreen extends StatefulWidget {
  const CotisationsScreen({super.key});

  @override
  _CotisationsScreenState createState() => _CotisationsScreenState();
}

class _CotisationsScreenState extends State<CotisationsScreen> {
  int _totalCotisations = 0;
  int _groupeCount = 0;
  int _individuCount = 0;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHelper.instance;
    groupes = handler.getAllGroupes();

    // Récupérer les informations réelles
    _getTotalCotisations();
    _getGroupeCount();
    _getIndividuCount();
  }

  Future<void> _getGroupeCount() async {
    _groupeCount = await handler.getGroupeCount();
    setState(() {});
  }

  Future<void> _getIndividuCount() async {
    _individuCount = await handler.getIndividuCount();
    setState(() {});
  }

  final List<String> months = [
    "Janvier",
    "Février",
    "Mars",
    "Avril",
    "Mai",
    "Juin",
    "Juillet",
    "Août",
    "Septembre",
    "Octobre",
    "Novembre",
    "Décembre"
  ];
  late DatabaseHelper handler;
  late Future<List<Groupe>> groupes;
  final montantController = TextEditingController();
  final moisController = TextEditingController();

  Future<void> _onRefresh() async {
    setState(() {
      groupes = handler.getAllGroupes();
    });
  }

  Future<void> _getTotalCotisations() async {
    _totalCotisations = await handler.getTotalCotisations();
    setState(() {});
  }

  void addCotisation(int groupeId, String mois) async {
    double montant = double.tryParse(montantController.text) ?? 0;

    if (montant > 0 && mois.isNotEmpty) {
      await handler.insertCotisation(groupeId, montant, mois);
      montantController.clear();

      // Mettre à jour le total des cotisations
      await _getTotalCotisations(); // Ajoutez cette ligne pour mettre à jour le total
      _onRefresh(); // Rafraîchir la liste des groupes
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez entrer un montant valide.")),
      );
    }
  }

  void showAddCotisationDialog(int groupeId) {
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ajouter une Cotisation"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: montantController,
                decoration: const InputDecoration(labelText: "Montant"),
                keyboardType: TextInputType.number,
              ),
              GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setState(() {
                      selectedDate = date;
                      // Mettre à jour le champ de texte avec le mois et l'année
                      moisController.text = "${date.month}/${date.year}";
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: moisController,
                    decoration: InputDecoration(
                      labelText: "Mois",
                      hintText: selectedDate != null
                          ? "${selectedDate!.month}/${selectedDate!.year}"
                          : "Sélectionnez un mois",
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (selectedDate != null) {
                  addCotisation(
                      groupeId, "${selectedDate!.month}"); // Passer le mois
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: myblueColor,
        title: const Text(
          "Cotisations",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder<List<Groupe>>(
        future: groupes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Aucun groupe trouvé !!!"));
          } else {
            final items = snapshot.data!;
            return Column(
              children: [
                MyCard(
                    element: "Total Cotisations",
                    nbretype1: _groupeCount,
                    nombretype2: _individuCount,
                    color: myredColor,
                    totalele: _totalCotisations,
                    type1: "Groupes",
                    type2: "Individus"),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 6,
                        color:
                            Colors.blueGrey[50], // Couleur de fond plus subtile
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.group,
                                    color: Colors.indigo, // Icône de groupe
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    items[index].nom,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.indigo, // Texte coloré
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color:
                                    Colors.indigoAccent, // Ligne de séparation
                                height: 20.0,
                                thickness: 1.5,
                              ),
                              FutureBuilder<Map<String, dynamic>>(
                                future: handler
                                    .getCotisationSummary(items[index].id!),
                                builder: (context, cotisationSnapshot) {
                                  if (cotisationSnapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        "Chargement des cotisations...",
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  } else if (cotisationSnapshot.hasError) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        "Erreur: ${cotisationSnapshot.error}",
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  } else {
                                    final cotisationData =
                                        cotisationSnapshot.data!;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8.0),
                                        Text(
                                          "Total cotisé: ${cotisationData['total']}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          "Dernière cotisation: ${cotisationData['derniere'] ?? 0}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          "Date de la dernière cotisation: ${cotisationData['dernierMois'] ?? 'N/A'}",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 8.0),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.indigo, // Couleur du bouton
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                  label: const Text(
                                    "Ajouter cotisation",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () =>
                                      showAddCotisationDialog(items[index].id!),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
