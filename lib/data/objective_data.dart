  import 'package:flutter/material.dart';
  import '../entity/item.dart';
  import '../entity/estructura.dart';
  import '../entity/dimension.dart';

  final Dimension overworld = Dimension(
    name: 'Overworld',
    description: 'Mundo principal donde empiezas.',
    items: [
      Item(
        name: 'Pico de Diamante',
        difficulty: 'Media',
        description:
            'El mejor pico que puedes conseguir en el Overworld. Esencial para poder picar obsidiana y crear la mesa de encantamientos, y más importante, el Portal al Nether. '
            'Se puede mejorar a un pico de Netherita con la mesa de herrería.',
        craftingImages: ['assets/icons/pico_diamante.png'],
        icon: Icons.handyman,
      ),
      Item(
        name: 'Mesa de encantamientos',
        difficulty: 'Fácil',
        description:
            'La forma más sencilla de encantar tus objetos en Minecraft. Utilizando lápizlázuli puedes encantar tus armas y armaduras. '
            'Por sí sola, los encantamientos serán de nivel bajo. Requerirás de colocar 15 librerías alrededor de la mesa para alcanzar '
            'el nivel máximo de encantamientos que se pueden aplicar a tus objetos.',
        craftingImages: ['assets/icons/mesa_encantamientos.png'],
        icon: Icons.auto_stories,
      ),
    ],
    estructuras: [
      Estructura(
        name: 'Stronghold',
        rarity: 'Rara',
        description:
            'Estructura subterránea que contiene el portal al End. Para hallarla, tienes que usar ojos de Ender, estos comenzarán a flotar en el aire en dirección al Stronghold más cercano. '
            'Una vez lo encuentres, busca el portal al End en las recámaras. En cuanto halles la que tiene el portal, necesitarás 12 ojos de Ender para activarlo. '
            'Procura tener más de esta cantidad para poder localizar el portal sin que te falten después.',
        icon: Icons.vpn_lock,
      ),
      Estructura(
        name: 'Trial Chamber',
        rarity: 'Épica',
        description:
            'Cámaras de cobre subterráneas en las que te enfrentas a enemigos en pruebas de valor. Puedes encontrarlas usando un mapa que te lleve a una, '
            'intercambiándolo con cartógrafos en aldeas a cambio de esmeraldas.\n\n'
            'Objetos importantes que puedes encontrar:\n'
            ' - Manzanas doradas\n'
            ' - Armas y Armaduras de diamante\n'
            ' - Maza (Arma especial)',
        icon: Icons.security,
      ),
    ],
  );

  final Dimension nether = Dimension(
    name: 'Nether',
    description: 'Dimensión infernal con materiales raros.',
    items: [
      Item(
        name: 'Vara de Blaze',
        difficulty: 'Media',
        description:
            'Objeto con la posibilidad de ser obtenido al matar un Blaze. Es indispensable para la creación de ojos de Ender.',
        craftingImages: ['assets/icons/vara_blaze.png'],
        icon: Icons.local_fire_department,
      ),
      Item(
        name: 'Ojos de Ender',
        difficulty: 'Difícil',
        description:
            'Obtenido de la combinación de varas de Blaze y Perlas de Ender. Con este objeto se puede buscar y acceder al End colocándolos en las ranuras del portal. '
            'Recuerda tener 12 de estas si quieres viajar a la dimensión del End.',
        craftingImages: ['assets/icons/ojo_ender.png'],
        icon: Icons.remove_red_eye,
      ),
    ],
    estructuras: [
      Estructura(
        name: 'Fortaleza del Nether',
        rarity: 'Rara',
        description:
            'Estructura hostil donde habitan los Blazes.',
        icon: Icons.castle,
      ),
      Estructura(
        name: 'Bastión',
        rarity: 'Común/Rara',
        description:
            'Fortalezas resguardadas por Piglins, grandes y verticales. Contienen cofres con buen botín, bloques de oro, y si tienes suerte, la Mejora de Netherita.\n'
            'Existen diferentes variantes de los bastiones, y una sola (la más grande, difícil y rara), contiene los mejores objetos.',
        icon: Icons.fort,
      )
    ],
  );

  final Dimension end = Dimension(
    name: 'End',
    description: 'Dimensión del Dragón y Elytras.',
    items: [
      Item(
        name: 'Elytra',
        difficulty: 'Alta',
        description:
            'Alas que te permiten planear por el mundo. Son la forma más rápida y eficiente de transporte como jugador. Se recomienda crear fuegos artificales para poder impulsarte en el aire.',
        craftingImages: ['assets/icons/elytra.png'],
        icon: Icons.flight,
      ),
      Item(
        name: 'Shulker Box',
        difficulty: 'Alta',
        description:
            'Cofres con la capacidad de ser trasladables a cualquier sitio. Se consiguen combinando caparazones de shulkers con un cofre normal. Los shulkers se encuentra en las End Cities, y matándolos soltarán sus caparazones.',
        craftingImages: ['assets/icons/elytra.png'],
        icon: Icons.move_to_inbox,
      )
    ],
    estructuras: [
      Estructura(
        name: 'End City',
        rarity: 'Épica',
        description:
            'Estructura del End donde puedes encontrar las Elytras. Son bastante altas y peligrosas debido a que las defienden Shulkers, '
            'monstruos que lanzan proyectiles que te hacen levitar, sufriendo daño de caída si no eres precavido.',
        icon: Icons.apartment,
      ),
      Estructura(
        name: 'Arena del Dragón',
        rarity: 'Rara',
        description:
            'En esta zona se lleva a cabo el enfrentamiento con la Dragona, el jefe final de Minecraft. Este lugar es sencillo de hallar, está junto a la zona de aparación al cruzar el Portal del End.',
        icon: Icons.sports_mma,
      )
    ],
  );
