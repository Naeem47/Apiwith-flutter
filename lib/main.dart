import 'package:apifucntional/views/homeview.dart';
import 'package:apifucntional/views/splash_view.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      

      
      ),
      home: const Splashview(),
    );
  }
}