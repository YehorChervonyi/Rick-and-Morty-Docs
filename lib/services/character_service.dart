import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_docs/core/network/api_endpoints.dart';
import 'package:rick_and_morty_docs/models/character_model.dart';

class CharacterService{
  Future<CharacterModel> fetchCharacters(int page) async{
    var response = await http.get(Uri.parse(ApiEndpoints.character+"/?page=${page}"));
    var jsonData = json.decode(response.body);
    return CharacterModel.fromJson(jsonData);
  }
  Future<CharacterModel> fetchCharactersByName(String name, int page) async{
    var response = await http.get(Uri.parse(ApiEndpoints.character+"/?name=${name}&page=${page}"));
    var jsonData = json.decode(response.body);
    return CharacterModel.fromJson(jsonData);
  }
}