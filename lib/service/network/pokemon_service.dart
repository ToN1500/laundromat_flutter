import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:laundromat_flutter/model/pokemon_model.dart';
import 'package:laundromat_flutter/model/pokemondetail_model.dart';

class PokemonService {
  final Dio _dio = Dio();

  Future<PokemonModel?> fetchPokemonData(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return pokemonModelFromJson(jsonEncode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  int getIdFromUrl(String url) {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }

    Future<PokemonDetailModel?> fetchPokemonDetail(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return pokemonDetailModelFromJson(jsonEncode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
