import 'package:flutter/material.dart';
import 'package:riot_sync/screen/juegos-screen/juegos_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.newspaper),
      label: 'Noticias',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.games),
      label: 'Juegos',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Mi Perfil',
    ),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildNewsCard(
                'El deseo de un príncipe | Cinemática Deleite Lunar 2024',
                'League of Legends',
                'assets/deseo.png',
                '7 Feb 2024'),
            const SizedBox(height: 10),
            _buildArticle('ASÍ LO JUEGO: Pro tips para jugar el Outlaw',
                'assets/asi_lo_juego_outlaw.png'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.black,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JuegosScreen()),
            );
          } else if (index == 2) {
            // Navegar a la pantalla de mi perfil
          }
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Noticias',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.tune,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildNewsCard(
      String title, String subtitle, String imageAsset, String date) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[850],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageAsset,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticle(String title, String imageAsset) {
    return Row(
      children: [
        Image.asset(
          imageAsset,
          width: 64,
          height: 64,
          fit: BoxFit.cover,
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'ASÍ LO JUEGO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
