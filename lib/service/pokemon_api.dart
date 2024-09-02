import 'dart:convert';
import 'dart:io';
import 'package:pokodex/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonApi {
  static const String _url =
      "https://raw.githubusercontent.com/Purukitto/pokemon-data.json/master/pokedex.json";

  // Future<List<PokemonModel>> tipi ile düzeltildi
  static Future<List<PokemonModel>> getPokeData() async {
    var response = await http.get(Uri.parse(_url));
    if (response.statusCode == HttpStatus.ok) {
      final jsonData = jsonDecode(response.body) as List;
      return jsonData.map((json) => PokemonModel.fromJson(json)).toList();
    } else {
      return Future.error('Failed to load data');
    }
  }
}
