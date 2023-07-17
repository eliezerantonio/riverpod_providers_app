import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers_app/presentation/providers/providers.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randonNames$ = ref.watch(namesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: randonNames$.when(
        data: (data) => Center(
          child: Text(data),
        ),
        error: (_, __) => const Text('Error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
