import 'package:flutter/material.dart';
import 'package:newapp/pages/home_page.dart';
import 'package:provider/provider.dart';
import '../provider/app_data.dart';
import '../service/dbhelper.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>( 
          create: (context) => AppData(), 
          child: MaterialApp( 
          title: 'My App', 
          theme: ThemeData(
          fontFamily: 'Minecraft',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ), 
        home: MyHomePage(title: 'Homepage')
      ), 
    ); 
  }
}


