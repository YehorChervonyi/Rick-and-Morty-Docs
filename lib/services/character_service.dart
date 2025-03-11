import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_docs/core/network/api_endpoints.dart';
import 'package:rick_and_morty_docs/models/character_model.dart';

class CharacterService{
  Future<CharacterModel> fetchCharacters() async{
    // var response = await http.get(Uri.parse(ApiService.baseUrl + ApiEndpoints.character));
    var response = await http.get(Uri.parse(ApiEndpoints.character));

    var jsonData = json.decode(response.body);
    // if (response.)
    // print(response.body);
    // print(jsonData);
    // var test = jsonData.map((json) => CharacterModel.fromJson(json)).toList();
    // print(test);
    return CharacterModel.fromJson(jsonData);
  }
}