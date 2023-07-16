import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdProvider);
    // with family modificator
    // final pokemonAsync = ref.watch(pokemonNameProvider(pokemonId));


    final pokemonAsync = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Future Povider $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (value) => Text(value),
          error: (_, __) => const Text('Error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state + 1);
            },
            child: const Icon(Icons.plus_one_outlined),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((state) => state - 1);
            },
            child: const Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
    );
  }
}
