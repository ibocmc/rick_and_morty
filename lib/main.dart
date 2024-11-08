import 'package:flutter/material.dart';
import 'package:rick_and_morty/select_page.dart';

void main() {
  runApp(RickMortyApp());
}

class RickMortyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectPage(),
    );
  }
}



