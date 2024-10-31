import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laundromat_flutter/helper/searchappbar.dart';
import 'package:laundromat_flutter/model/favpoke_model.dart';
import 'package:laundromat_flutter/model/pokemon_model.dart';
import 'package:laundromat_flutter/service/favpokemon/favpokemon_service.dart';
import 'package:laundromat_flutter/service/network/pokemon_service.dart';

import '../config/router/router.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  List<ResultPokemonList>? pokemonList = [];
  final ScrollController _scrollController = ScrollController();
  final FavpokemonService pokemonController = Get.put(FavpokemonService());

  bool isLoading = false;
  String? nextUrl = 'https://pokeapi.co/api/v2/pokemon';
  final PokemonService _pokemonService = PokemonService();
  List<ResultPokemonList> filteredItems = [];
  String query = "";
  Box<FavpokeModel>? favBox;

  @override
  void initState() {
    super.initState();
    _initHive();
    getPokemon();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getPokemon();
      }
    });
  }

  Future<void> _initHive() async {
    try {
      // Check if the box is already open
      if (!Hive.isBoxOpen('favpoke')) {
        favBox = await Hive.openBox<FavpokeModel>('favpoke');
      } else {
        favBox = Hive.box<FavpokeModel>('favpoke');
      }
      if (mounted) setState(() {});
    } catch (e) {
      print('Error initializing Hive box: $e');
    }
  }

  void getPokemon() async {
    if (isLoading || nextUrl == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final PokemonModel? data =
          await _pokemonService.fetchPokemonData(nextUrl!);
      if (mounted) {
        setState(() {
          pokemonList?.addAll(data?.results ?? []);
          nextUrl = data?.next;
          isLoading = false;
          filteredItems = pokemonList!;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      print('Error fetching data: $e');
    }
  }

  void _handleSearch(String searchQuery) {
    if (mounted) {
      setState(() {
        query = searchQuery;
        filteredItems = pokemonList!
            .where((item) =>
                item.name!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  void _handleSearchClear() {
    if (mounted) {
      setState(() {
        query = "";
        filteredItems = pokemonList!;
      });
    }
  }

  Future<void> addPerson(int id, String name, String imageUrl) async {
    final newFavBox = FavpokeModel(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
    await favBox!.add(newFavBox);
  }

  bool isFavorite(int id) {
    if (favBox == null) return false;
    return favBox!.values.any((favPoke) => favPoke.id == id);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: 'Pokemon List',
        onSearch: _handleSearch,
        onSearchClear: _handleSearchClear,
        debounceTime: const Duration(milliseconds: 500),
      ),
      body: pokemonList == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      if (index == filteredItems.length) {
                        return isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : const SizedBox.shrink();
                      }
                      final pokemonId = _pokemonService
                          .getIdFromUrl(filteredItems[index].url!);
                      final imageUrl =
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png';
                      return GestureDetector(
                        onTap: () {
                          context.push(AppRouter.pokemondetailScreen,
                              extra: {'pokemonId': pokemonId.toString()});
                        },
                        child: GridTile(
                          header: CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            imageUrl: imageUrl,
                            width: 100,
                            height: 100,
                          ),
                          footer: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  filteredItems[index].name!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Obx(() => IconButton(
                                    icon: Icon(
                                      pokemonController.isFavorite(pokemonId)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      pokemonController.toggleFavorite(
                                        pokemonId,
                                        filteredItems[index].name!,
                                        imageUrl,
                                      );
                                    },
                                  )),
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.blue.shade100,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
