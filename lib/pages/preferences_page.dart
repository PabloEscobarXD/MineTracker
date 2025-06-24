import 'package:flutter/material.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key, required this.title});

  final String title;

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool _isDarkMode = false;
  bool _noSpoilersMode = false;

  void _changeColorPalette() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Funcionalidad no disponible")),
    );
  }

  void _resetData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Datos reiniciados (placeholder)")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(144, 238, 144, 1),
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Opciones de apariencia',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Cambiar paleta de color'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.palette),
                    onPressed: _changeColorPalette,
                  ),
                  IconButton(
                    icon: const Icon(Icons.color_lens),
                    onPressed: _changeColorPalette,
                  ),
                  IconButton(
                    icon: const Icon(Icons.gradient),
                    onPressed: _changeColorPalette,
                  ),
                ],
              )
            ],
          ),
          const Divider(height: 30),

          const Text(
            'Preferencias del usuario',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: _isDarkMode,
            onChanged: (value) {
              setState(() {
                _isDarkMode = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Modo sin spoilers'),
            value: _noSpoilersMode,
            onChanged: (value) {
              setState(() {
                _noSpoilersMode = value;
              });
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: _resetData,
            icon: const Icon(Icons.restore),
            label: const Text('Reiniciar información'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          )
        ],
      ),
    );
  }
}
