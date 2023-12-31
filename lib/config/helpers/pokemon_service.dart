import 'package:dio/dio.dart';

class PokemonService {
  static Future<String> getPokemon(int pokemonId) async {
    await Future.delayed(const Duration(seconds: 2));

    final dio = Dio();
    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      return response.data['name'] ?? 'Name not found';
    } catch (e) {
      throw Exception('Name not found');
    }
  }
}
