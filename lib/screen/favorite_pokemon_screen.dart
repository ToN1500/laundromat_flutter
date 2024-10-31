import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laundromat_flutter/model/favpoke_model.dart';
import 'package:laundromat_flutter/service/favpokemon/favpokemon_service.dart';

class FavoritePokemonScreen extends StatelessWidget {
  FavoritePokemonScreen({super.key});

  final FavpokemonService pokemonController = Get.find<FavpokemonService>();
  Box<FavpokeModel>? favBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Pokemon'),
      ),
      body: Obx(() {
        final favorites = pokemonController.favorites;

        if (favorites.isEmpty) {
          return const Center(
            child: Text('No favorite Pokemon yet'),
          );
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final pokemon = favorites[index];
            return ListTile(
              leading: CachedNetworkImage(
                imageUrl: pokemon.imageUrl,
                width: 50,
                height: 50,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
              title: Text(pokemon.name),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  pokemonController.removeFavorite(pokemon);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
