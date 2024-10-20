import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/user_model.dart';
import '../../services/mongodb_service.dart';
import '../../validators/input_validators.dart';

class RegisterController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController preferredNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? avatarImage;

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      avatarImage = File(pickedFile.path);
    }
  }

  Future<String> convertImageToBase64(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    return base64Encode(bytes);
  }

  Future<void> registerUser(BuildContext context) async {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos!')),
      );
      return;
    }

    String? emailError = InputValidators.validateEmail(emailController.text);
    String? phoneError = InputValidators.validatePhoneNumber(phoneController.text);
    if (emailError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(emailError)),
      );
      return;
    }
    if (phoneError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(phoneError)),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('As senhas não coincidem!')),
      );
      return;
    }

    String? avatarBase64;
    if (avatarImage != null) {
      avatarBase64 = await convertImageToBase64(avatarImage!);
    }

    final user = User(
      avatar: avatarBase64 ?? '',
      fullName: fullNameController.text,
      preferredName: preferredNameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
      password: passwordController.text,
    );

    bool userExists = await MongoDBService.userExists(emailController.text, phoneController.text);
    if (userExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário já cadastrado!')),
      );
      return;
    }

    await MongoDBService.insertUser(user.toJson());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cadastro realizado com sucesso!')),
    );
  }
}
