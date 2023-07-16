import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme.titleMedium;

    final name = ref.watch(randomNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Provider',
        ),
      ),
      body: Center(
        child: Text(
          name,
          style: textTheme,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref
          //     .read(randomNameProvider.notifier)
          //     .update((state) => state.toLowerCase());

          ref.invalidate(randomNameProvider);
        },
        child: const Icon(
          Icons.refresh_rounded,
        ),
      ),
    );
  }
}
