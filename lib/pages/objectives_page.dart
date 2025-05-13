import 'package:flutter/material.dart';
import '../data/objective_data.dart';
import '../classes/ObjectiveCard.dart';

class ObjectivesPage extends StatefulWidget {
  const ObjectivesPage({super.key, required this.world});

  final String world;

  @override
  State<ObjectivesPage> createState() => _ObjectivesPageState();
}

class _ObjectivesPageState extends State<ObjectivesPage> {
  late List<Map<String, dynamic>> likedItems;
  late List<Map<String, dynamic>> likedStructures;

  @override
  void initState() {
    super.initState();

    switch (widget.world) {
      case 'Overworld':
        likedItems = overworldItems;
        likedStructures = overworldStructures;
        break;
      case 'Nether':
        likedItems = netherItems;
        likedStructures = netherStructures;
        break;
      case 'End':
        likedItems = endItems;
        likedStructures = endStructures;
        break;
      default:
        likedItems = [];
        likedStructures = [];
    }
  }

  void showItemDetails(Map<String, dynamic> item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(item['icon'], size: 48),
                  const SizedBox(height: 12),
                  Text(
                    item['name'],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['description'],
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


  Widget buildCardList(List<Map<String, dynamic>> dataList) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final item = dataList[index];
        return ObjectiveCard(
          icon: item['icon'],
          name: item['name'],
          description: item['description'],
          onDetails: () => showItemDetails(item),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.world),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.build), text: "Objetos"),
              Tab(icon: Icon(Icons.location_city), text: "Estructuras"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildCardList(likedItems),
            buildCardList(likedStructures),
          ],
        ),
      ),
    );
  }
}
