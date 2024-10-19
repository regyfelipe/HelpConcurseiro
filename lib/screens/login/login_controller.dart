import 'package:flutter/material.dart';
import '../../services/mongodb_service.dart';
import '../../models/user_model.dart';
import '../home_screen.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos!')),
      );
      return;
    }

    // Tentar autenticar o usuário e obter o objeto User
    User? user = await MongoDBService.authenticateUser(email, password);

    if (user != null) {
      // Navegar para a HomeScreen passando o objeto User
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(user: user),
      ));
    } else {
      // Exibir mensagem de erro se a autenticação falhar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email ou senha incorretos!')),
      );
    }
  }
}
