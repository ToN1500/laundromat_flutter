// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
    final int? count;
    final String? next;
    final dynamic previous;
    final List<ResultPokemonList>? results;

    PokemonModel({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<ResultPokemonList>.from(json["results"]!.map((x) => ResultPokemonList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class ResultPokemonList {
    final String? name;
    final String? url;

    ResultPokemonList({
        this.name,
        this.url,
    });

    factory ResultPokemonList.fromJson(Map<String, dynamic> json) => ResultPokemonList(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
