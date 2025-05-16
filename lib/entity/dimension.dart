import 'item.dart';
import 'estructura.dart';

class Dimension {
  final String name;
  final String description;
  final List<Item> items;
  final List<Estructura> estructuras;

  Dimension({
    required this.name,
    required this.description,
    required this.items,
    required this.estructuras,
  });
}