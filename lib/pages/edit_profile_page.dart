import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_data.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final appData = context.read<AppData>();
    _nameController = TextEditingController(text: appData.userName);
    _emailController = TextEditingController(text: appData.userEmail);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      print("Iniciando guardado");
      await context.read<AppData>().saveUserProfile(
        _nameController.text.trim(),
        _emailController.text.trim(),
        null,
      );
      print("Finalizó guardado, volviendo");
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Nombre"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa un nombre";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Correo"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingresa un correo";
                  }
                  if (!value.contains('@')) {
                    return "Correo no válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text("Guardar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
