import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_data.dart';
import '../pages/edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final appData = context.watch<AppData>();
    final completados = appData.nombresObjetivosCompletados;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(144, 238, 144, 1),
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green[300],
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
           Center(
            child: Text(appData.userName.isNotEmpty ? appData.userName : "Nombre no configurado")
          ),
          Center(
            child: Text(appData.userEmail.isNotEmpty ? appData.userEmail : "Correo no configurado")
          ),
          const SizedBox(height:   20),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Objetivos completados: ${completados.length}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EditProfilePage()),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text("Editar perfil"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Historial de Objetivos Cumplidos",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          if (completados.isEmpty)
            const Text("Aún no has completado ningún objetivo.")
          else
            ...completados.map((nombre) => Card(
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: Text(nombre),
              ),
            )),
          const SizedBox(height: 32),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text("Cerrar sesión", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
