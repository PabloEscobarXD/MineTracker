import 'package:flutter/material.dart';
import 'dart:async';
import '../pages/home_page.dart';
import 'package:provider/provider.dart';
import '../provider/app_data.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _loadData();
  });
}


void _loadData() async {
  await Provider.of<AppData>(context, listen: false).loadUserProfile();

  // Luego de cargar el perfil, navega
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MyHomePage(title: 'MineTracker')),
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/icons/splashIcon.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
