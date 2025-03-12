import 'package:rick_and_morty_docs/models/character_model.dart';
import 'package:rick_and_morty_docs/services/character_service.dart';

class CharacterController {
  CharacterModel? characters;

  Future <CharacterModel>  fetchCharacters(int page) async {
    try {
      characters = await CharacterService().fetchCharacters(page);
      return characters!;
    } catch (e) {
      throw Exception("Error fetching characters: $e");
    }
  }

  Future<CharacterModel> fetchCharactersByName(String name, int page) async {
    try {
      characters = await CharacterService().fetchCharactersByName(name, page);
      return characters!;
    } catch (e) {
      throw Exception("Error fetching characters: $e");
    }
  }
}