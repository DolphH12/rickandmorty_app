import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EpisodesProvider extends ChangeNotifier {
  int infoCapitulos = 0;

  EpisodesProvider() {
    getAllEpisodes();
  }

  Future<String> _getJsonData() async {
    var request = http.Request(
        'GET', Uri.parse('https://rickandmortyapi.com/api/episode'));

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

  getAllEpisodes() async {
    final data = await _getJsonData();

    if (data.isNotEmpty) {
      final decodedData = json.decode(data);

      infoCapitulos = decodedData['info']['count'];
    } else {
      infoCapitulos = 0;
    }
    notifyListeners();
  }
}
