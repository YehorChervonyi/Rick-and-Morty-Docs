import 'package:flutter/material.dart';
import 'package:rick_and_morty_docs/controllers/character_controller.dart';
import 'package:rick_and_morty_docs/models/character_model.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final CharacterController _controller = CharacterController();

  @override
  void initState() {
    super.initState();
    // _controller.fetchCharacters();
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder<CharacterModel>(
      future: _controller.fetchCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.hasData) {
          final characters = snapshot.data!;
          if (characters.results.isNotEmpty) {
                        return ListView.builder(
              itemCount: characters.results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(characters.results[index].image),

                  title: Text(characters.results[index].name),
                );
              },
            );
          } else {
            return Center(child: Text('No characters found'));
          }
        }

        return Center(child: Text('No data available'));
      },
    ),
  );
}
}