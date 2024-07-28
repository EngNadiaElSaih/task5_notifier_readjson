class Item {
  final String id;
  final String name;
  final String description;

  Item({required this.id, required this.name, required this.description});

  factory Item.fromJson(Map<String, dynamic> data) {
    return Item(
      id: data['id'],
      name: data['name'],
      description: data['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
