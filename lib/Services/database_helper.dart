import 'package:datas_collection/Classes/cotisation.dart';
import 'package:datas_collection/Classes/group.dart';
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
    try {
      await db.execute('''
      CREATE TABLE Groupe (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
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
      CREATE TABLE cotisations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        groupe_id INTEGER,
        montant REAL NOT NULL,
        mois TEXT NOT NULL,
        FOREIGN KEY (groupe_id) REFERENCES Groupe (id)
      );
    ''');
    } catch (e) {
      print("Erreur lors de la création de la base de données: $e");
    }
  }

  // CRUD pour Groupe
  Future<int> insertGroupe(Groupe groupe) async {
    final db = await database;
    return await db.insert('Groupe', groupe.toMap());
  }

  Future<List<Groupe>> getAllGroupes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Groupe');
    return List.generate(maps.length, (i) {
      return Groupe.fromMap(maps[i]);
    });
  }

  Future<int> updateGroupe(Groupe groupe) async {
    final db = await database;
    return await db.update(
      'Groupe',
      groupe.toMap(),
      where: 'id = ?',
      whereArgs: [groupe.id],
    );
  }

  Future<int> deleteGroupe(int id) async {
    final db = await database;
    return await db.delete(
      'Groupe',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD pour Cotisation
  Future<int> insertCotisation(
      int groupeId, double montant, String mois) async {
    final db = await database;
    return await db.insert(
      'cotisations',
      {
        'groupe_id': groupeId,
        'montant': montant,
        'mois': mois,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Cotisation>> getCotisationsByGroupe(int groupeId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'cotisations',
      where: 'groupe_id = ?',
      whereArgs: [groupeId],
    );

    return List.generate(maps.length, (i) {
      return Cotisation.fromMap(maps[i]);
    });
  }

  Future<Map<String, dynamic>> getCotisationSummary(int groupeId) async {
    final cotisations = await getCotisationsByGroupe(groupeId);
    double totalCotisations = 0;
    double? derniereCotisation;
    String? dernierMois;

    if (cotisations.isNotEmpty) {
      for (var cotisation in cotisations) {
        totalCotisations += cotisation.montant;
        derniereCotisation = cotisation.montant;
        dernierMois = cotisation.mois;
      }
    }

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

  // Autres méthodes
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

  Future<int> getTotalCotisations() async {
    final db = await database;
    final result =
        await db.rawQuery("SELECT SUM(montant) AS total FROM cotisations");

    if (result.isNotEmpty && result.first['total'] != null) {
      return (result.first['total'] as num).toInt();
    } else {
      return 0;
    }
  }

  Future<int> getGroupeCount() async {
    final db = await database;
    final result = await db.rawQuery("SELECT COUNT(*) AS count FROM Groupe");
    return result.isNotEmpty ? (result.first['count'] as int?) ?? 0 : 0;
  }

  Future<void> insertGroupeAndCotisations(
      Groupe groupe, List<Cotisation> cotisations) async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.insert('Groupe', groupe.toMap());
      for (var cotisation in cotisations) {
        await txn.insert('cotisations', cotisation.toMap());
      }
    });
  }
}
