import 'package:flutter/material.dart';
import '../widgets/questao/custom_button.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Questão 1', style: TextStyle(color: Colors.white, fontSize: 20)),
        actions: [
          Icon(Icons.visibility, color: Colors.white),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Considerando o entendimento do STJ acerca do procedimento administrativo, da responsabilidade funcional dos servidores públicos e da improbidade administrativa, julgue o seguinte item.',
              style: TextStyle(fontSize: 16, color: Colors.white), // Match font size and color
            ),
            SizedBox(height: 20),
            Text(
              'É possível a instauração de procedimento administrativo disciplinar com base em denúncia anônima',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CustomButton(label: 'Certo'),
                SizedBox(width: 10),
                CustomButton(label: 'Errado'),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                '1 de 995970',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {},
                child: Text('Responder', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
