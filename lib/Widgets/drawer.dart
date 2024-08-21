import 'dart:io';

import 'package:datas_collection/Screens/cotisation_screen.dart';
import 'package:datas_collection/Screens/list_groupe.dart';
import 'package:datas_collection/theme/colors.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  /* Utilisateur? utilisateur;
  File? _image;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    utilisateur = await DatabaseHelper.instance.getUser();
    if (utilisateur != null) {
      setState(() {
        _image = File(utilisateur!.image_path);
      });
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          /*  UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [myblueColor, myredColor],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: _image == null
                  ? const AssetImage("assets/images/profil.png")
                  : FileImage(_image!) as ImageProvider,
              radius: 40,
            ),
            accountName: Text(
              utilisateur == null
                  ? 'Utilisateur'
                  : '${utilisateur!.prenom} ${utilisateur!.nom}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              utilisateur == null ? '' : utilisateur!.email,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ), */
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: myblueColor),
            accountName: const Text(
              "Prenom:",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            accountEmail: const Text(
              "oscarsierra839@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            currentAccountPicture: const Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/person.jpg",
                ),
                radius: 500,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(
                  icon: Icons.home,
                  text: 'Accueil',
                  onTap: () {
                    /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    ); */
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.groups_2,
                  text: 'Groupes',
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GroupesScreen()),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.attach_money,
                  text: 'Cotisations',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CotisationsScreen()),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.exit_to_app,
                  text: 'Quitter',
                  onTap: () {
                    exit(0);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: myblueColor),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }
}
