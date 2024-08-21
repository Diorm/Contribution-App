import 'package:datas_collection/Widgets/drawer.dart';
import 'package:datas_collection/Widgets/my_card.dart';
import 'package:datas_collection/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:datas_collection/Classes/group.dart';
import 'package:datas_collection/Services/database_helper.dart';
import 'package:flutter/widgets.dart';

class CotisationsScreen extends StatefulWidget {
  @override
  _CotisationsScreenState createState() => _CotisationsScreenState();
}

class _CotisationsScreenState extends State<CotisationsScreen> {
  late DatabaseHelper handler;
  late Future<List<Groupe>> groupes;
  final montantController = TextEditingController();
  final moisController = TextEditingController();
  int _totalCotisations = 0;
  int _groupeCount = 0;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHelper.instance;
    groupes = handler.getAllGroupes();
    _getTotalCotisations();
    _getGroupeCount();
  }

  Future<void> _getTotalCotisations() async {
    _totalCotisations = await handler.getTotalCotisations();
    setState(() {});
  }

  Future<void> _getGroupeCount() async {
    _groupeCount = await handler.getGroupeCount();
    setState(() {});
  }

  void addCotisation(int groupeId, String mois) async {
    double montant = double.tryParse(montantController.text) ?? 0;

    if (montant > 0 && mois.isNotEmpty) {
      await handler.insertCotisation(groupeId, montant, mois);
      montantController.clear();
      moisController.clear();

      // Mettre à jour le total des cotisations
      await _getTotalCotisations();
      _onRefresh();
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez entrer un montant valide.")),
      );
    }
  }

  void deleteGroupe(int groupeId) async {
    // Récupérer le montant de cotisation avant la suppression
    double montantCotisation =
        (await handler.getCotisationsByGroupe(groupeId)) as double;

    // Supprimer le groupe
    await handler.deleteGroupe(groupeId);

    // Mettre à jour le total des cotisations
    _totalCotisations -= montantCotisation as int;

    // Rafraîchir l'affichage
    setState(() {});
  }

  Future<void> _onRefresh() async {
    setState(() {
      groupes = handler.getAllGroupes();
    });
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
          'Cotisations',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyCard(
                element: "Total Cotisations",
                nombretype2: _groupeCount,
                color: myredColor,
                totalele: _totalCotisations.toDouble(),
                type2: "Groupes"),
            FutureBuilder<List<Groupe>>(
              future: groupes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Erreur: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Aucun groupe trouvé"));
                } else {
                  final items = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap:
                        true, // Permet au ListView de s'adapter à la taille de son parent
                    physics:
                        NeverScrollableScrollPhysics(), // Désactive le défilement du ListView
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.amber[300],
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Row(
                              children: [
                                Text("Groupe :",
                                    style: TextStyle(fontSize: 13)),
                                Text(
                                  items[index].nom.toString(),
                                  style: TextStyle(
                                      color: myredColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            subtitle: FutureBuilder<Map<String, dynamic>>(
                              future: handler
                                  .getCotisationSummary(items[index].id!),
                              builder: (context, cotisationSnapshot) {
                                if (cotisationSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Text(
                                      "Chargement des cotisations...");
                                } else if (cotisationSnapshot.hasError) {
                                  return Text(
                                      "Erreur: ${cotisationSnapshot.error}");
                                } else {
                                  final cotisationData =
                                      cotisationSnapshot.data!;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Total Cotisé: "),
                                          Text(
                                            " ${cotisationData['total']}",
                                            style: TextStyle(
                                                color: myredColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Dernière Cotisation :"),
                                          Text(
                                            " ${cotisationData['derniere'] ?? 0}",
                                            style: TextStyle(
                                                color: myredColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Date  dernière cotisation:"),
                                          Text(
                                            " ${cotisationData['dernierMois'] ?? 'N/A'}",
                                            style: TextStyle(
                                                color: myblueColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.add, size: 25),
                              onPressed: () =>
                                  showAddCotisationDialog(items[index].id!),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
