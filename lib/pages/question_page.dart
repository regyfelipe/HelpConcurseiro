import 'package:flutter/material.dart';

import '../widgets/questao/optionTile.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int? _selectedOptionIndex;

  final List<String> _options = [
    'Ato Acidental ou Acidente de Trabalho Típico.',
    'Doenças profissionais.',
    'Doenças do trabalho.',
    'Acidentes de trajeto.',
    'Acidentes atípicos.',
  ];

  @override
  void initState() {
    super.initState();
    _options.sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const  Color(0xFF789DBC),
        title: const Text(
          'Questão { }',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  '03',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF789DBC),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'de 1983276',
                  style: TextStyle(fontSize: 16,color: Colors.white,),
                ),
                Spacer(),
                Icon(Icons.school, color: Color(0xFF789DBC)),
                SizedBox(width: 10),
                Icon(Icons.chat_bubble_outline, color: Color(0xFF789DBC)),
                SizedBox(width: 10),
                Icon(Icons.bookmark_border, color: Color(0xFF789DBC)),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Ano: 2024   Banca: CPCON',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white,),
            ),
            const Text(
              'Órgão: Prefeitura Municipal de Lagoa Seca',
              style: TextStyle(fontSize: 16,color: Colors.white,),
            ),
            const SizedBox(height: 10),
            const Text(
              'Homem, 55 anos, funcionário da construção civil, caiu de um andaime durante seu expediente de trabalho e fraturou o fêmur direito. Como se caracteriza esse acidente de trabalho?',
              style: TextStyle(fontSize: 16,color: Colors.white,),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  return OptionTile(
                    optionText: _options[index],
                    optionLetter: String.fromCharCode(65 + index),
                    isSelected: _selectedOptionIndex == index,
                    onTap: () {
                      setState(() {
                        if (_selectedOptionIndex == index) {
                          _selectedOptionIndex = null;
                        } else {
                          _selectedOptionIndex = index;
                        }
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _selectedOptionIndex == null
                    ? null
                    : () {
                        print(
                            "Selected option: ${_options[_selectedOptionIndex!]}");
                        String selectedLetter =
                            String.fromCharCode(65 + _selectedOptionIndex!);

                        print("Selected letter: $selectedLetter");
                      },
                style: ElevatedButton.styleFrom(
                  padding:const  EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor:const  Color(0xFF789DBC),
                  side: const BorderSide(color: Color(0xFF789DBC), width: 2),
                ),
                child: const Text(
                  'Resolver',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                  },
                  child: const Text(
                    'Anterior',
                    style: TextStyle(color: Color(0xFF789DBC)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                  },
                  child: const Text(
                    'Ir para questão',
                    style: TextStyle(color: Color(0xFF789DBC)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                  },
                  child:const  Text(
                    'Próximo',
                    style: TextStyle(color: Color(0xFF789DBC)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
