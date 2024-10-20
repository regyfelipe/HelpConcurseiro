import 'package:flutter/material.dart';

void showFilterModal(BuildContext context, String filterName) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF121212),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  filterName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                  },
                  child: const Text(
                    'Limpar filtro',
                    style: TextStyle(
                      color: Color(0xFF789DBC),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Busque por assunto',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Color(0xFF1E1E1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildCheckboxListTile('Língua Portuguesa (Português)'),
                  _buildCheckboxListTile('Matemática'),
                  _buildCheckboxListTile('Raciocínio Lógico'),
                  _buildCheckboxListTile('Informática'),
                  _buildCheckboxListTile('Direito Constitucional'),
                  _buildCheckboxListTile('Direito Administrativo'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Color(0xFF789DBC),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF789DBC),
                  ),
                  child: const Text(
                    'Selecionar filtro',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildCheckboxListTile(String title) {
  return CheckboxListTile(
    value: false,
    onChanged: (value) {
    },
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: const Color(0xFF789DBC),
    checkColor: Colors.white,
  );
}
