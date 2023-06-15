class Group {
  String name;

  Group ({required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Group && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}