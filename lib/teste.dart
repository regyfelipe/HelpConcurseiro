import 'package:flutter/material.dart';

class HomePageTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF789DBC),
        elevation: 0,
        title: Text('Questões', style: TextStyle(fontSize: 20)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.local_fire_department, size: 28),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text('1',
                        style: TextStyle(
                          color: Color(0xFF789DBC),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(), // Menu lateral
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Saudação e título
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFF789DBC),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Olá, Felipe',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 8),
                  Text(
                    'Vamos estudar!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Card "Resolver Questões"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.book,
                      size: 32,
                      color: Color(0xFF789DBC),
                    ),
                  ),
                  title: Text('Resolver questões',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Crie seu filtro e procure por questões'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ),
            ),
            // Segmento Selecionado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Segmento selecionado: Concurso Público'),
                  TextButton(
                    onPressed: () {},
                    child: Text('trocar',
                        style: TextStyle(
                          color: Color(0xFF789DBC),
                        )),
                  ),
                ],
              ),
            ),
            // Último filtro acessado
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text('Último filtro acessado'),
                  subtitle: Text('Filtro não salvo\nVocê parou na questão 3'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ),
            ),
            // Criar metas de estudo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.flag,
                      size: 32,
                      color: Color(0xFF789DBC),
                    ),
                  ),
                  title: Text('Criar metas de estudo',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    children: [
                      Text('Novo!',
                          style: TextStyle(
                            color: Color(0xFF789DBC),
                          )),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ),
            ),
            // Recompensa diária
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recompensa diária'),
                  TextButton(
                    onPressed: () {},
                    child: Text('ver todas',
                        style: TextStyle(
                          color: Color(0xFF789DBC),
                        )),
                  ),
                ],
              ),
            ),
            // Dias de estudo contínuo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Dias de estudo contínuo'),
                          Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Color(0xFF789DBC),
                              ),
                              SizedBox(width: 4),
                              Text('1',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Resgatadas'),
                          Text('0/1',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Bloqueadas'),
                          Text('13',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Color(0xFF789DBC),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Questões',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Desempenho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            label: 'Filtros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill),
            label: 'Cursos',
          ),
        ],
      ),
    );
  }
}
