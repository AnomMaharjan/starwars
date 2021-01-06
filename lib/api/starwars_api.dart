import 'dart:convert';
import 'package:Starwars/model/starwars_model.dart';
import 'package:http/http.dart' as http;

class StarwarsAPI {
  Future<Characters> getCharactersList() async {
    String url = "https://swapi.dev/api/people/";
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(url);
      if (response.statusCode == 200) {
        return Characters.mapJson(utf8.decode(response.bodyBytes));
      }
    } catch (e) {
      print("Characters list => $e");
    }
  }
}
