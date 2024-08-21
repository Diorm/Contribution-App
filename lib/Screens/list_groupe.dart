import 'package:datas_collection/Screens/nouveau_groupe.dart';
import 'package:datas_collection/Widgets/drawer.dart';
import 'package:datas_collection/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:datas_collection/Classes/group.dart';
import 'package:datas_collection/Services/database_helper.dart';

class GroupesScreen extends StatefulWidget {
  const GroupesScreen({Key? key}) : super(key: key);

  @override
  _GroupesScreenState createState() => _GroupesScreenState();
}

class _GroupesScreenState extends State<GroupesScreen> {
  late DatabaseHelper handler;
  List<Groupe> groupes = [];

  @override
  void initState() {
    super.initState();
    handler = DatabaseHelper.instance;
    _loadGroupes();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadGroupes() async {
    final groupesData = await handler.getAllGroupes();
    setState(() {
      groupes = groupesData; // Met à jour l'état avec la liste des groupes
    });
  }

  Future<void> _onRefresh() async {
    await _loadGroupes(); // Recharge la liste des groupes lors du rafraîchissement
  }

  Future<void> deleteGroupe(int id) async {
    await handler.deleteGroupe(id);
    _loadGroupes(); // Recharge la liste après suppression
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: myblueColor,
        title: const Text(
          'Liste des groupes',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myredColor,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NouveauGroupe()),
          );

          if (result == true) {
            setState(() {
              _loadGroupes();
            }); // Rafraîchit l'état après l'ajout du groupe
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: MyDrawer(),
      body: RefreshIndicator(
        onRefresh: _loadGroupes, // Utilisation de la méthode _onRefresh
        child: groupes.isEmpty
            ? Center(child: Text("Aucun Groupe Trouvé !!!"))
            : ListView.builder(
                itemCount: groupes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(groupes[index].nom.toString(),
                          style: TextStyle(
                              color: myredColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      subtitle: Text(groupes[index].village.toString()),
                      trailing: IconButton(
                        onPressed: () async {
                          await deleteGroupe(groupes[index].id!);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: myredColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
