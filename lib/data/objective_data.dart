// objectives_data.dart
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> overworldItems = [
  {
    'name': 'Pico de Diamante',
    'icon': Icons.construction,
    'description': 'El mejor pico que puedes conseguir en el Overworld. Esencial para poder picar obsidiana y crear la '
    'mesa de encantamientos, y más importante, el Portal al Nether. Se puede mejorar a un pico de Netherita con la mesa de herrería.',
  },
    {
    'name': 'Mesa de encantamientos',
    'icon': Icons.book,
    'description': 'La forma mas sencilla de encantar tus objetos en Minecraft. Utilizando lapizlásuli puedes encantar tus armas y armaduras. '
    'Por sí sola, los encantamientos serán de nivel bajo. Requerirás de colocar 15 librerías alrededor de la mesa para alcanzar'
    ' el nivel máximo de encantamientos que se pueden aplicar a tus objetos.'
  }
];

final List<Map<String, dynamic>> overworldStructures = [
  {
    'name': 'Stronghold',
    'icon': Icons.account_tree,
    'description': 'Estructura subterránea que contiene el portal al End. Para hallarla, tienes que usar ojos'
    ' de Ender, estos comenzarán a flotar en el aire en dirección al Stronghold mas cercano. Una vez lo encuentres,'
    ' busca el portal al End en las recámaras. En cuanto hayes la que tiene el portal, necesitarás 12 ojos de Ender para activarlo'
    '. Procura tener más de esta cantidad para poder localizar el portal sin que te falten después.',
  },
  {
    'name': 'Trial Chamber',
    'icon': Icons.account_tree,
    'description': 'Cámaras de cobre subterráneas en las que te enfrentas a enemigos'
     ' en pruebas de valor. Puedes encontrarlos usando un mapa que te lleve a una intercambiando'
     ' con cartógrafos en aldeas a cambio de esmeraldas.\n\n'
     'Objetos importantes que puedes encontrar:\n - Manzanas doradas\n- Armas y Armaduras de diamante\n - Maza (Arma especial)',
  },
];

final List<Map<String, dynamic>> netherItems = [
  {
    'name': 'Vara de Blaze',
    'icon': Icons.whatshot,
    'description': 'Objeto con la posibilidad de ser obtenido al matar un Blaze. Es indispensable para la creación de ojos de Ender.',
  },
  {
    'name': 'Ojos de Ender',
    'icon': Icons.panorama_fish_eye,
    'description': 'Obtenido de la combinación de varas de Blaze y Perlas de Ender. Con este objeto se puede buscar y acceder al End colocándolos en las ranuras del portal. '
    'Recuerda tener 12 de estas si quieres viajar a la dimensión del End.',
  }
];

final List<Map<String, dynamic>> netherStructures = [
  {
    'name': 'Fortaleza del Nether',
    'icon': Icons.fort,
    'description': 'Estructura hostil donde habitan los Blazes.',
  },
];

final List<Map<String, dynamic>> endItems = [
  {
    'name': 'Elytra',
    'icon': Icons.flight,
    'description': 'Alas que permiten planear, encontradas en End Cities.',
  },
];

final List<Map<String, dynamic>> endStructures = [
  {
    'name': 'End City',
    'icon': Icons.location_city,
    'description': 'Estructura del End donde puedes encontrar las Elytras. Son bastante altas y peligrosas debido a que las defienden Shulkers, monstruos que lanzan proyectiles que te hacen levitar, sufriendo daño de caída si no eres precavido.',
  },
];
