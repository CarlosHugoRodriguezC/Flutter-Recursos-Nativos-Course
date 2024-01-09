import 'package:isar/isar.dart';

part 'pokemon.g.dart';

@collection
class Pokemon {
  const Pokemon({
    required this.id,
    required this.name,
    required this.spriteFront,
  });

  final int id;
  final String name;
  final String spriteFront;
}
