import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers_app/config/config.dart';

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

final pokemonNameProvider = FutureProvider((
  ref,
) async {
  final id = ref.watch(pokemonIdProvider);
  final name = await PokemonService.getPokemon(id);
  return name;
});



// final pokemonNameProvider = FutureProvider.family<String, int>((ref, pokemonId) async {
//   final name = await PokemonService.getPokemon(pokemonId);
//   return name;
// });
