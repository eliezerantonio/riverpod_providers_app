import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
          title: 'State Provider',
          subTitle: 'Um estado simples + AutoDispose',
          location: '/state-provider',
        ),
        _CustomListTile(
          title: 'Future Provider',
          subTitle: 'Um simles future + Family',
          location: '/future-provider',
        ),
        _CustomListTile(
          title: 'Stream Provider',
          subTitle: 'Um simles Stream',
          location: '/stream-provider',
        ),
        _CustomListTile(
          title: 'State notifier provider',
          subTitle: 'Um provider com estado personalizado',
          location: '/state-notifier-provider',
        ),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile(
      {required this.title, required this.subTitle, required this.location});

  final String title;
  final String subTitle;
  final String location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => context.push(location),
    );
  }
}
