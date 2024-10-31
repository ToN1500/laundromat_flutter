import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:laundromat_flutter/model/favpoke_model.dart';

class FavpokemonService extends GetxController {
  final RxList<FavpokeModel> favorites = <FavpokeModel>[].obs;
  Box<FavpokeModel>? favBox;

  @override
  void onInit() {
    super.onInit();
    initHive();
  }

  Future<void> initHive() async {
    if (Hive.isBoxOpen('favpoke')) {
      favBox = Hive.box<FavpokeModel>('favpoke');
    } else {
      favBox = await Hive.openBox<FavpokeModel>('favpoke');
    }
    loadFavorites();
  }

  void loadFavorites() {
    if (favBox != null) {
      favorites.value = favBox!.values.toList();
    }
  }

  bool isFavorite(int id) {
    return favorites.any((pokemon) => pokemon.id == id);
  }

  Future<void> toggleFavorite(int id, String name, String imageUrl) async {
    if (favBox == null) return;

    if (isFavorite(id)) {
      // ลบออกจาก favorites
      final pokemonToDelete =
          favorites.firstWhere((pokemon) => pokemon.id == id);
      await pokemonToDelete.delete();
    } else {
      // เพิ่มเข้า favorites
      final newFavPoke = FavpokeModel(
        id: id,
        name: name,
        imageUrl: imageUrl,
      );
      await favBox!.add(newFavPoke);
    }

    // โหลดข้อมูลใหม่
    loadFavorites();
  }

  Future<void> removeFavorite(FavpokeModel pokemon) async {
    await pokemon.delete();
    loadFavorites();
  }
}
