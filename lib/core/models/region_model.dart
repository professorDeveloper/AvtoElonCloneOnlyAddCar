class RegionModel {
  RegionModel._({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory RegionModel.empty() => RegionModel.fromJson({});

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel._(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
