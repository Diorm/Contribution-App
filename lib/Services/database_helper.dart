import 'package:datas_collection/Classes/group.dart';
import 'package:datas_collection/Classes/individu.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('individus.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE individu (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nom TEXT NOT NULL,
        prenom TEXT NOT NULL,
        adresse TEXT NOT NULL,
        telephone TEXT NOT NULL
      )
    ''');
    await db.execute('''
    CREATE TABLE Groupe (
  id INT,
  code VARCHAR(255),
  nom VARCHAR(255),
  nombreDeMembres INT,
  nombreDeMembresFemmes INT,
  numeroDuCycle INT,
  tauxDePresence FLOAT,
  tauxDabandon FLOAT,
  tauxDeCroissanceDeLadhesion FLOAT,
  valeurDesEconomiesDeCeCycle INT,
  epargneMoyenneAnnualiseeParMembre FLOAT,
  valeurDesPretsEnCours INT,
  tailleMoyenneDesPretsEnCoursParMembre FLOAT,
  pourcentageDeMembresAyantDesPretsEnCours FLOAT,
  tauxDutilisationDesFonds FLOAT,
  tauxDePassationEnPerte FLOAT,
  dividendesVerses FLOAT,
  retourSurLesEconomies FLOAT,
  soldeBancaire FLOAT,
  soldeDuFondsSocial FLOAT,
  dettesExterieures FLOAT,
  ageDuGroupeEnMois INT,
  village VARCHAR(255),
  membreAyantEnChargeDesEnfants INT,
  membresParentsDEnfantsRC INT,
  membresQuiMenentDesActivitesGeneratricesDeRevenus INT,
  membresEnceintes INT,
  membresAllaitantes INT,
  membresDeMoinsDe12Ans INT,
  membresDe12AMoinsDe18Ans INT,
  membresDe18AMoinsDe35Ans INT,
  enfants0A18AnsPrisEnCharge INT,
  enfantsRCPrisEnCharge INT,
  enfants0A5AnsPrisEnCharge INT,
  enfants5A14AnsPrisEnCharge INT,
  groupeEnConnectionAvecImf INT,
  membresBeneficiantDeLimf INT,
  commune VARCHAR(255),
  departement VARCHAR(255),
  nomDuPresident VARCHAR(255),
  genreDuPresident VARCHAR(255),
  numeroTelDuPresident VARCHAR(255)
)
  ''');
    await db.execute('''
    CREATE TABLE groupe_membres (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      groupe_id INTEGER,
      individu_id INTEGER,
      FOREIGN KEY (groupe_id) REFERENCES groupe (id),
      FOREIGN KEY (individu_id) REFERENCES individu (id)
    )
  ''');
    await db.execute('''
   CREATE TABLE cotisation (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  groupe_id INTEGER,
  montant REAL NOT NULL,
  mois TEXT NOT NULL,
  FOREIGN KEY (groupe_id) REFERENCES groupe (id)
);
  ''');
  }

  Future<int> InserIndividu(IndividuJson individu) async {
    final db = await database;
    return await db.insert('individu', individu.toMap());
  }

  Future<List<IndividuJson>> getAllIndividu() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('individu');
    return List.generate(maps.length, (i) {
      return IndividuJson.fromMap(maps[i]);
    });
  }

  Future<int> updateIndividu(IndividuJson individu) async {
    final db = await database;
    return await db.update(
      'individu',
      individu.toMap(),
      where: 'id = ?',
      whereArgs: [individu.id],
    );
  }

  Future<int> deleteIndividu(int id) async {
    final db = await database;
    return await db.delete(
      'individu',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//recuperer les cotisations
  Future<List<Map<String, dynamic>>> getCotisationsByGroupe(
      int groupeId) async {
    final db = await database;
    final cotisations = await db.query(
      'cotisation',
      where: 'groupe_id = ?',
      whereArgs: [groupeId],
    );
    print(
        "Cotisations pour le groupe $groupeId: $cotisations"); // Ajoutez cette ligne
    return cotisations;
  }

  Future<int> insertGroupe(Groupe groupe) async {
    final db = await database;
    // Insérer le groupe
    var res = await db.insert('groupe', groupe.toMap());

    // Vous pourriez avoir besoin de gérer les membres ici
    if (groupe.membres.isNotEmpty) {
      for (var membre in groupe.membres) {
        await db.insert('groupe_membres', {
          'groupe_id': res, // ID du groupe inséré
          'individu_id': membre.id, // ID de l'individu
        });
      }
    }

    return res;
  }

  Future<List<Groupe>> getAllGroupes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('groupe');
    return List.generate(maps.length, (i) {
      return Groupe.fromMap(maps[i]);
    });
  }

  Future<int> deleteGroupe(int id) async {
    final db = await database;
    return await db.delete(
      'groupe',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Somme des cotisation
  Future<Map<String, dynamic>> getCotisationSummary(int groupeId) async {
    final cotisations = await getCotisationsByGroupe(groupeId);
    double totalCotisations = 0;
    double? derniereCotisation;
    String? dernierMois;

    if (cotisations.isNotEmpty) {
      for (var cotisation in cotisations) {
        totalCotisations += cotisation['montant'];
        derniereCotisation = cotisation['montant'];
        dernierMois = cotisation['mois']; // Ceci est probablement un nombre
      }
    }

    // Convertir le mois en un format lisible
    String? formattedMonth;
    if (dernierMois != null) {
      int month = int.tryParse(dernierMois) ?? 0;
      formattedMonth = _formatMonth(month);
    }

    return {
      'total': totalCotisations,
      'derniere': derniereCotisation,
      'dernierMois': formattedMonth,
    };
  }

// Fonction pour formater le mois
  String _formatMonth(int month) {
    const months = [
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
    return month > 0 && month <= 12 ? months[month - 1] : "Inconnu";
  }

  //Inserere une cotisation
  Future<int> insertCotisation(
      int groupeId, double montant, String mois) async {
    final db = await database;
    return await db.insert('cotisation', {
      'groupe_id': groupeId,
      'montant': montant,
      'mois': mois,
    });
  }

  Future<int> getTotalCotisations() async {
    final db = await database;
    final result =
        await db.rawQuery("SELECT SUM(montant) AS total FROM cotisation");
    return result.isNotEmpty ? (result.first['total'] as num).toInt() : 0;
  }

  Future<int> getGroupeCount() async {
    final db = await database;
    final result = await db.rawQuery("SELECT COUNT(*) AS count FROM groupe");
    return result.isNotEmpty ? (result.first['count'] as int?) ?? 0 : 0;
  }

  Future<int> getIndividuCount() async {
    final db = await database;
    final result = await db.rawQuery("SELECT COUNT(*) AS count FROM individu");
    return result.isNotEmpty ? (result.first['count'] as int?) ?? 0 : 0;
  }
}
