import 'package:Starwars/pages/starwars_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      bottom: true,
          child: Scaffold(
            backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Starwars Characters',
            style: TextStyle(
              color: Colors.yellow,
              fontFamily: 'Starjedi'
            ),
            ),
        ),
        body: StarwarsPage(),
        
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          shape: CircleBorder(),
          tooltip: 'Next Page',
          child: Icon(
          Icons.navigate_next,
          color: Colors.yellow,
          ),
        ),
        ),
    ),
  ));
}

