import 'package:flutter/material.dart';

import '../widgets/filter/bottom_buttons.dart';
import '../widgets/filter/filter_card.dart';

class FilterQuestionsScreen extends StatelessWidget {
  final List<String> filters = [
    'Assunto',
    'Banca',
    'Cargo',
    'Ano',
    'Formação',
    'Órgão',
    'Área',
    'Dificuldade',
    'Escolaridade',
    'Região'
  ];

  FilterQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Questões',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'total de questões',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Combine filtros e comece a resolver questões ou crie um novo caderno.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: filters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3.5,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showFilterModal(context, filters[index]),
                    child: FilterCard(title: filters[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildActionsSection(),
            const Spacer(),
            const BottomButtons(),
          ],
        ),
      ),
    );
  }

  void _showFilterModal(BuildContext context, String filterName) {
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
                      // Logic to clear filter
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
              // Here you can add checkboxes or filter options
              Expanded(
                child: ListView(
                  children: [
                    _buildCheckboxListTile('Língua Portuguesa (Português)'),
                    _buildCheckboxListTile('Matemática'),
                    _buildCheckboxListTile('Raciocínio Lógico'),
                    _buildCheckboxListTile('Informática'),
                    _buildCheckboxListTile('Direito Constitucional'),
                    _buildCheckboxListTile('Direito Administrativo'),
                    // Add more options as needed
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
                      // Apply the selected filter logic
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
        // Handle checkbox state
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

  Widget _buildActionsSection() {
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
          onPressed: () {},
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
}
