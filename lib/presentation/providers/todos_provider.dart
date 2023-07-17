import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers_app/config/config.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';

const _uuid = Uuid();

final todosProvider =
    StateNotifierProvider<TodosNotifier, List<TodoEntity>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<TodoEntity>> {
  TodosNotifier()
      : super([
          TodoEntity(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          TodoEntity(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          TodoEntity(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          TodoEntity(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
        ]);

  void addTodo() {
    state = [
      ...state,
      TodoEntity(
        id: _uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
    ];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id != id) return todo;

      if (todo.done) return todo.copyWith(completedAt: null);

      return todo.copyWith(completedAt: DateTime.now());
    }).toList();
  }
}
