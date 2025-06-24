import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_data.dart';
import '../entity/dimension.dart';
import '../entity/estructura.dart';
import '../entity/item.dart';
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
    final completados = context.read<AppData>().nombresObjetivosCompletados;
    visibleItems = widget.dimension.items
        .where((item) => !completados.contains(item.name))
        .toList();
    visibleEstructuras = widget.dimension.estructuras
        .where((estructura) => !completados.contains(estructura.name))
        .toList();
  }

  void completarObjetivo(String name) {
    context.read<AppData>().marcarObjetivoComoCompletado(name);
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
                      completarObjetivo(item.name);
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
              children: visibleEstructuras.asMap().entries.map((entry) {
                final index = entry.key;
                final estructura = entry.value;
                return buildObjectiveCard(
                  icon: estructura.icon,
                  name: estructura.name,
                  description: estructura.description,
                  onCompleted: () {
                    setState(() {
                      completarObjetivo(estructura.name);
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
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
