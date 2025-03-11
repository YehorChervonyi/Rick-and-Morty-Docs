import 'package:flutter/material.dart';
import 'package:rick_and_morty_docs/models/character_model.dart';
import 'package:rick_and_morty_docs/services/character_service.dart';

class CharacterController {
  CharacterModel? characters;

  Future<CharacterModel> fetchCharacters() async {
    try {
      characters = await CharacterService().fetchCharacters();
      return characters!;
    } catch (e) {
      throw Exception("Error fetching characters: $e");
    }
  }
}