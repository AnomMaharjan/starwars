import 'package:Starwars/pages/starwars_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Starwars Characters',
          ),
      ),
      body: StarwarsPage(),
      ),
  ));
}

