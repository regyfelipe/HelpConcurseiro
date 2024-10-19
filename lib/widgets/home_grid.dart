import 'package:flutter/material.dart';
import 'grid_item_card.dart';
import '../screens/filter_questions_screen.dart';

class HomeGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Buscar Questões',
      'icon': Icons.search,
      'color': Color(0xFF1E1E1E),
      'onTap': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FilterQuestionsScreen()),
        );
      },
    },
    {
      'title': 'Simulados',
      'icon': Icons.quiz,
      'color': Color(0xFF1E1E1E),
    },
    {
      'title': 'PDF',
      'icon': Icons.picture_as_pdf,
      'color': Color(0xFF1E1E1E),
    },
    {
      'title': 'Desempenho',
      'icon': Icons.bar_chart,
      'color': Color(0xFF1E1E1E),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GridItemCard(item: item);
      },
    );
  }
}
