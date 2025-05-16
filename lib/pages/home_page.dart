import 'package:flutter/material.dart';
import 'objectives_page.dart';
import 'profile_page.dart';
import '../entity/customCards.dart';
import '../data/objective_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(197, 183, 155, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(144, 238, 144, 1),
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromRGBO(42, 110, 42, 0.945)),
              child: Text('MineTracker', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Inicio'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(title: 'Menu')),
                );
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(title: 'Perfil de Usuario')),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildWorldCard(
            imagePath: 'assets/icons/mcOverworld.png',
            title: 'Overworld',
            subtitle: 'Minerales, Stronghold',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ObjectivesPage(dimension: overworld)),
              );
            },
          ),
          buildWorldCard(
            imagePath: 'assets/icons/mcNether.png',
            title: 'Nether',
            subtitle: 'Varas de Blaze, Fortalezas del Nether y Bastiones',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ObjectivesPage(dimension: nether)),
              );
            },
          ),
          buildWorldCard(
            imagePath: 'assets/icons/mcEnd.png',
            title: 'End',
            subtitle: 'Dragón del End, Endcities y Elytras',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ObjectivesPage(dimension: end)),
              );
            },
          ),
        ],
      ),
    );
  }
}
