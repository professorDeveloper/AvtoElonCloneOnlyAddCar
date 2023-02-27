class BrandModel {
  BrandModel._({
    required this.id,
    required this.name,
    required this.value,
    required this.popular,
  });

  final String id;
  final String name;
  final String value;
  final int popular;

  factory BrandModel.empty() => BrandModel.fromJson({});

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel._(
    id: json["id"] ?? "0",
    name: json["name"] ?? "",
    value: json["value"] ?? "",
    popular: json["popular"] ?? 0,
  );

}
