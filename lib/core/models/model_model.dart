class CarModel {
  CarModel._({
    required this.id,
    required this.name,
    required this.value,
    required this.popular,
    required this.parent,
  });

  final String id;
  final String name;
  final String value;
  final int popular;
  final int parent;

  factory CarModel.empty() => CarModel.fromJson({});

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel._(
    id: json["id"] ?? "",
    name: json["name"] ?? "",
    value: json["value"] ?? "",
    popular: json["popular"] ?? 0,
    parent: json["parent"] ?? 0,
  );

}
