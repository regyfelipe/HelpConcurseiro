// lib/screens/register/register_form.dart

import 'package:flutter/material.dart';
import '../../validators/input_validators.dart';
import 'avatar_picker.dart';
import '../../widgets/custom_inputs.dart';
import 'register_controller.dart'; 

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final RegisterController controller = RegisterController(); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            AvatarPicker(
              avatarImage: controller.avatarImage,
              onImagePicked: (source) {
                controller.pickImage(source);
              },
            ),
            SizedBox(height: 20),
            CustomInputField(
              label: 'Nome Completo',
              controller: controller.fullNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o nome completo';
                }
                return null;
              },
            ),
            CustomInputField(
              label: 'Como gostaria de ser chamado',
              controller: controller.preferredNameController,
            ),
            CustomInputField(
              label: 'Email',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              validator: InputValidators.validateEmail,
            ),
            CustomInputField(
              label: 'Número de Telefone',
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              validator: InputValidators.validatePhoneNumber,
            ),
            CustomInputField(
              label: 'Senha',
              controller: controller.passwordController,
              obscureText: _obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              validator: InputValidators.validatePassword,
            ),
            CustomInputField(
              label: 'Confirmação de Senha',
              controller: controller.confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              validator: (value) {
                if (value != controller.passwordController.text) {
                  return 'As senhas não coincidem';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.registerUser(context); 
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: Text('Cadastrar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
