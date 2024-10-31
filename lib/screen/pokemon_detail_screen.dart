// pokemon_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:laundromat_flutter/helper/app_size.dart';
import 'package:laundromat_flutter/model/pokemondetail_model.dart';
import 'package:laundromat_flutter/service/favpokemon/favpokemon_service.dart';
import 'package:laundromat_flutter/service/network/pokemon_service.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String pokemonId;

  const PokemonDetailScreen({super.key, required this.pokemonId});

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  PokemonDetailModel? pokemonDetail;
  bool isLoading = true;
  final PokemonService _pokemonService = PokemonService();
  String? url = 'https://pokeapi.co/api/v2/pokemon/';
  List<String> imagedetailUrl = [
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/",
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/",
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/",
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/"
  ];
  final FavpokemonService pokemonController = Get.put(FavpokemonService());

  @override
  void initState() {
    super.initState();
    fetchPokemonDetail();
  }

  void fetchPokemonDetail() async {
    try {
      final detail = await _pokemonService
          .fetchPokemonDetail((url ?? '') + widget.pokemonId.toString());
      setState(() {
        pokemonDetail = detail;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching Pokemon detail: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonDetail?.name ?? 'Loading...'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : pokemonDetail == null
              ? Center(child: Text('Failed to load details'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            child: Row(children: [
                              CachedNetworkImage(
                                imageUrl:
                                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.pokemonId}.png',
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name: ' +
                                          (pokemonDetail?.name ?? 'Unknown'),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        'Types: ${(pokemonDetail?.types?.map((e) => e.type?.name).join(' , ').toString())}'),
                                    Obx(() => IconButton(
                                          icon: Icon(
                                            pokemonController.isFavorite(
                                                    int.parse(widget.pokemonId))
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.redAccent,
                                          ),
                                          onPressed: () {
                                            pokemonController.toggleFavorite(
                                              int.parse(widget.pokemonId),
                                              pokemonDetail?.name ?? 'Unknown',
                                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.pokemonId}.png',
                                            );
                                          },
                                        )),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(height: 16),
                          Text("รูปเพิ่มเติมในเกม",
                              style: TextStyle(fontSize: 18)),
                          SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            height: AppSizes.heightSize(context, 50),
                            child: Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 1,
                                ),
                                itemCount: imagedetailUrl.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: imagedetailUrl[index] +
                                            widget.pokemonId.toString() +
                                            '.png',
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        "TEST",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
