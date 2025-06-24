import 'package:flutter/material.dart';
import 'objectives_page.dart';
import 'profile_page.dart';
import '../entity/customCards.dart';
import '../provider/app_data.dart';
import 'package:provider/provider.dart';
import '../pages/preferences_page.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(title: 'Perfil de Usuario')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreferencesPage(title: 'Perfil de Usuario')),
              );
            },
          )
        ],
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
                MaterialPageRoute(builder: (context) => ObjectivesPage(dimension: context.read<AppData>().overworld)),
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
                MaterialPageRoute(builder: (context) => ObjectivesPage(dimension: context.read<AppData>().nether)),
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
                MaterialPageRoute(builder: (context) => ObjectivesPage(dimension: context.read<AppData>().end)),
              );
            },
          ),
        ],
      ),
    );
  }
}
