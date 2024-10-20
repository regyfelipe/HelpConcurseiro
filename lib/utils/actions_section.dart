import 'package:flutter/material.dart';

Widget buildActionsSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Excluir questões',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
      TextButton(
        onPressed: () {
          // Lógica para limpar os filtros
        },
        child: const Text(
          'Limpar filtros',
          style: TextStyle(
            color: Color(0xFF789DBC),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
