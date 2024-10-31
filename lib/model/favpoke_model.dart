import 'package:hive/hive.dart';
part 'favpoke_model.g.dart';

@HiveType(typeId: 0)
class FavpokeModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String imageUrl;

  FavpokeModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}
