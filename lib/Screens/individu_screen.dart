import 'dart:async';
import 'package:datas_collection/Classes/individu.dart';
import 'package:datas_collection/Services/database_helper.dart';
import 'package:datas_collection/Widgets/drawer.dart';
import 'package:datas_collection/theme/colors.dart';
import 'package:flutter/material.dart';

class IndividusScreen extends StatefulWidget {
  const IndividusScreen({super.key});

  @override
  _IndividusScreenState createState() => _IndividusScreenState();
}

class _IndividusScreenState extends State<IndividusScreen> {
  late DatabaseHelper handler;
  late Future<List<IndividuJson>> individus;
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final adresseController = TextEditingController();
  final telephoneControlleur = TextEditingController();
  @override
  void initState() {
    super.initState();
    handler = DatabaseHelper.instance;
    individus = handler.getAllIndividu();
  }

  Future<void> _onRefresh() async {
    setState(() {
      individus = handler.getAllIndividu();
    });
  }

  void addIndividu() async {
    var res = await handler.InserIndividu(IndividuJson(
      prenom: prenomController.text,
      nom: nomController.text,
      telephone: telephoneControlleur.text,
      adresse: adresseController.text,
    ));

    if (res > 0) {
      setState(() {
        _onRefresh();
      });
    }
  }

  void deleteIndividu(int id) async {
    var res = await handler.deleteIndividu(id);
    if (res > 0) {
      setState(() {
        _onRefresh();
      });
    }
  }

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Ajouter un Individu"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: prenomController,
                  decoration: const InputDecoration(labelText: "Prénom"),
                ),
                TextField(
                  controller: nomController,
                  decoration: const InputDecoration(labelText: "Nom"),
                ),
                TextField(
                  controller: adresseController,
                  decoration: const InputDecoration(labelText: "Adresse"),
                ),
                TextField(
                  controller: telephoneControlleur,
                  decoration: const InputDecoration(labelText: "telephone"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                addIndividu();
                Navigator.of(context).pop();
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
          "Individus",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myblueColor,
        onPressed: () {
          showAddDialog(context);
          nomController.clear();
          prenomController.clear();
          adresseController.clear();
          telephoneControlleur.clear();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: individus,
              builder: (BuildContext context,
                  AsyncSnapshot<List<IndividuJson>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return const Center(child: Text("Aucun Individu Trouvé !!!"));
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  final items = snapshot.data ?? <IndividuJson>[];
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: myredColor,
                          child: Text(
                            items[index].prenom[0],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title:
                            Text('${items[index].prenom} ${items[index].nom}'),
                        subtitle: Text(items[index].adresse),
                        trailing: IconButton(
                          onPressed: () {
                            deleteIndividu(items[index].id!);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                        // Ajoute un onTap pour la mise à jour si nécessaire
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
