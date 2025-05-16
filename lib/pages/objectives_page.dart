import 'package:flutter/material.dart';
import 'package:newapp/data/globals.dart';
import 'package:newapp/entity/dimension.dart';
import 'package:newapp/entity/estructura.dart';
import 'package:newapp/entity/item.dart';
import '../pages/objective_detail_page.dart';
import '../entity/customCards.dart';

class ObjectivesPage extends StatefulWidget {
  final Dimension dimension;
  const ObjectivesPage({super.key, required this.dimension});

  @override
  State<ObjectivesPage> createState() => _ObjectivesPageState();
}

class _ObjectivesPageState extends State<ObjectivesPage> {
  late List<Item> visibleItems;
  late List<Estructura> visibleEstructuras;

  @override
  void initState() {
    super.initState();
    visibleItems = widget.dimension.items
        .where((item) => !nombresObjetivosCompletados.contains(item.name))
        .toList();
    visibleEstructuras = widget.dimension.estructuras
        .where((estructura) => !nombresObjetivosCompletados.contains(estructura.name))
        .toList();
  }
  
  void completarObjetivo({required IconData icon,required String name, required String description}) {
    
    nombresObjetivosCompletados.add(name);
    historialObjetivos.add(
      buildObjectiveCard(
        icon: icon,
        name: name,
        description: description,
        onCompleted: () {},
        readOnly: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(197, 183, 155, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 100, 180, 100),
          title: Text(widget.dimension.name),
          bottom: const TabBar(
            indicatorColor: Color.fromRGBO(42, 110, 42, 1),
            labelColor: Colors.black,                    
            unselectedLabelColor: Colors.white70,  
            tabs: [
              Tab(icon: Icon(Icons.build), text: "Objetos"),
              Tab(icon: Icon(Icons.location_city), text: "Estructuras"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
            children: visibleItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return buildObjectiveCard(
                icon: item.icon,
                name: item.name,
                description: item.description,
                onCompleted: () {
                  setState(() {
                    completarObjetivo(
                      icon: item.icon,
                      name: item.name,
                      description: item.description,
                    );
                    visibleItems.removeAt(index);
                  });
                },
                onTapDetail: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ObjectiveDetailPage(
                        icon: item.icon,
                        name: item.name,
                        description: item.description,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
            ListView(
              children: visibleEstructuras.asMap().entries.map<Widget>((entry) {
                final index = entry.key;
                final estructura = entry.value;
                return buildObjectiveCard(
                  icon: estructura.icon,
                  name: estructura.name,
                  description: estructura.description,
                  onCompleted: () {
                    setState(() {
                      completarObjetivo(
                        icon: estructura.icon,
                        name: estructura.name,
                        description: estructura.description,
                      );
                      visibleEstructuras.removeAt(index);
                    });
                  },
                  onTapDetail: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ObjectiveDetailPage(
                          icon: estructura.icon,
                          name: estructura.name,
                          description: estructura.description,
                        ),
                      ),
                    );
                  },
                );
              }).toList()
            ),
          ],
        ),
      ),
    );
  }
}

