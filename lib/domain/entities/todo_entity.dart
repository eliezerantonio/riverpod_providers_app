class TodoEntity {
  final String id;
  final String description;
  final DateTime? completedAt;

  TodoEntity({
    required this.id,
    required this.description,
    required this.completedAt,
  });

  TodoEntity copyWith(
          {String? id, String? description, DateTime? completedAt}) =>
      TodoEntity(
        id: id ?? this.id,
        description: description ?? this.description,
        completedAt: completedAt,
      );

  bool get done {
    return completedAt != null;
  }
}
