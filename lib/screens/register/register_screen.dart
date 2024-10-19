import 'package:flutter/material.dart';
import 'register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, 
        title: Text(
          '',
          style: TextStyle(color: Colors.black), 
        ),
        flexibleSpace: Container(
          color: Colors.white,
        ),
      ),
      body: RegisterForm(),
    );
  }
}
