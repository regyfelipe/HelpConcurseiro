import 'package:mongo_dart/mongo_dart.dart';
import '../models/user_model.dart'; // Importando o User model

class MongoDBService {
  static final Db db = Db(
      'mongodb://felipesynq:Vy20WxYUo0pqhZQc@cluster0-shard-00-00.jgmrd.mongodb.net:27017,'
      'cluster0-shard-00-01.jgmrd.mongodb.net:27017,'
      'cluster0-shard-00-02.jgmrd.mongodb.net:27017/concurseiro?ssl=true&replicaSet=atlas-97kmu1-shard-0'
      '&authSource=admin&retryWrites=true&w=majority');

  static late DbCollection usersCollection;

  // Conecta ao banco de dados
  static Future<void> connect() async {
    try {
      await db.open();
      usersCollection = db.collection('users');
      print('Conectado ao MongoDB!');
    } catch (e) {
      print('Erro ao conectar ao MongoDB: $e');
    }
  }

  // Insere um novo usuário no banco
  static Future<void> insertUser(Map<String, dynamic> user) async {
    try {
      await usersCollection.insert(user);
      print('Usuário inserido com sucesso!');
    } catch (e) {
      print('Erro ao inserir usuário: $e');
    }
  }

  // Verifica se o usuário já existe (email ou telefone duplicado)
  static Future<bool> userExists(String email, String phoneNumber) async {
    try {
      final user = await usersCollection.findOne({
        '\$or': [
          {'email': email},
          {'phoneNumber': phoneNumber},
        ]
      });
      return user != null;
    } catch (e) {
      print('Erro ao verificar se o usuário existe: $e');
      return false;
    }
  }

  // Autentica o usuário e retorna o objeto User se a autenticação for bem-sucedida
  static Future<User?> authenticateUser(String email, String password) async {
    try {
      final userDoc = await usersCollection.findOne(
        where.eq('email', email).eq('password', password),
      );

      if (userDoc != null) {
        return User(
          avatar: userDoc['avatar'] ?? '',
          fullName: userDoc['fullName'] ?? '',
          preferredName: userDoc['preferredName'] ?? '',
          email: userDoc['email'] ?? '',
          phoneNumber: userDoc['phoneNumber'] ?? '',
          password: userDoc['password'] ?? '',
        );
      }
    } catch (e) {
      print('Erro ao autenticar usuário: $e');
    }
    return null;
  }
}
