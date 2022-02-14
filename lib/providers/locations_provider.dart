import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/location_model.dart';

class LocationsProvider extends ChangeNotifier {
  String locationPpal = "";
  int _totalLocations = 0;
  int _maxResidents = 0;

  LocationsProvider() {
    getAllLocations();
  }

  Future<String> _getJsonData() async {
    var request = http.Request(
        'GET', Uri.parse('https://rickandmortyapi.com/api/location'));

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

  Future<String> _getJsonDataLocation(int location) async {
    var request = http.Request(
        'GET', Uri.parse('https://rickandmortyapi.com/api/location/$location'));

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

  getAllLocations() async {
    final data = await _getJsonData();

    if (data.isNotEmpty) {
      final decodedData = json.decode(data);

      _totalLocations = decodedData['info']['count'];
    } else {
      _totalLocations = 0;
    }
    notifyListeners();
    getMaximunLocation();
  }

  getMaximunLocation() async {
    int i = 0;
    int ban = 0;
    print("Total: $_totalLocations");
    while (i < _totalLocations) {
      i++;
      final data = await _getJsonDataLocation(i);

      if (data.isNotEmpty) {
        final decodedData = LocationModel.fromJson(json.decode(data));
        ban = decodedData.residents.length;
        if (ban > _maxResidents) {
          _maxResidents = ban;
          locationPpal = decodedData.name;
        }
      }
    }
    notifyListeners();
  }
}
