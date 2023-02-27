class DistrictModel {
  DistrictModel._({
    required this.id,
    required this.title,
    required this.regionId,
  });

  final int id;
  final String title;
  final int regionId;

  factory DistrictModel.empty() => DistrictModel.fromJson({});

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel._(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        regionId: json["region_id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "region_id": regionId,
      };
}
