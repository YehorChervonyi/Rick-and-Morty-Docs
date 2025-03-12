import 'package:flutter/material.dart';
import 'package:rick_and_morty_docs/controllers/character_controller.dart';
import 'package:rick_and_morty_docs/widgets/character_card_widget.dart';
import 'package:rick_and_morty_docs/models/character_model.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final CharacterController _controller = CharacterController();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String _searchQuery = "";
  int _currentPage = 1;
  int _maxPages = 1;
  int _count =1;
  bool _isLoading = false;

  List<ResultsModel> _characters = [];

  @override
  void initState() {
    super.initState();
    _fetchCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100 &&
          !_isLoading &&
          _currentPage < _maxPages) {
        _fetchCharacters();
      }
    });
  }

  Future<void> _fetchCharacters({bool isSearch = false}) async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    try {
      CharacterModel response = _searchQuery.isEmpty
          ? await _controller.fetchCharacters(_currentPage)
          : await _controller.fetchCharactersByName(_searchQuery, _currentPage);

      setState(() {
        if (isSearch) {
          _characters = response.results;
          _currentPage = 1; 
        } else {
          _characters.addAll(response.results);
        }
        _count = response.info.count;
        _maxPages = response.info.pages;
        _currentPage++;
      });
    } catch (error) {
      print("Error fetching characters: $error");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search characters...",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              setState(() {
                _searchQuery = "";
                _characters.clear();
                _currentPage = 1;
              });
              _fetchCharacters(isSearch: true);
            },
          ),
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value.toLowerCase();
            _characters.clear();
            _currentPage = 1;
          });
          _fetchCharacters(isSearch: true);
        },
      ),
    ),
    body: _characters.isEmpty && _isLoading
        ? Center(child: CircularProgressIndicator())
        : _characters.isEmpty
            ? Center(child: Text('No characters found'))
            : Column(
                children: [
                  Text("Characters: ${_count.toString()}", style: TextStyle(fontWeight: FontWeight.bold),),
                  Expanded( 
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = (constraints.maxWidth ~/ 200).clamp(2, 5);
                        return GridView.builder(
                          controller: _scrollController,
                          itemCount: _characters.length + (_isLoading ? 1 : 0),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 0.7,
                          ),
                          padding: EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            if (index < _characters.length) {
                              // print(_characters[index].id);
                              return characterCard(
                                _characters[index].image,
                                _characters[index].name,
                                _characters[index].gender,
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
  );
}


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
