import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/character_model.dart';

class CharacterProvider extends ChangeNotifier {
  List<Character> characters = [];
  int infoCapitulos = 0;
  int _characterPage = 0;

  CharacterProvider() {
    getAllCharacters();
  }

  Future<String> _getJsonData(int page) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://rickandmortyapi.com/api/character/?page=$_characterPage'));

    try {
      http.StreamedResponse response = await request.send();
      final data = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return data;
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  getAllCharacters() async {
    _characterPage++;

    final data = await _getJsonData(_characterPage);

    if (data.isNotEmpty) {
      final decodedData = CharacterModel.fromJson(json.decode(data));

      characters = [...characters, ...decodedData.results];
    } else {
      characters = [...characters];
    }
    notifyListeners();
  }
}
