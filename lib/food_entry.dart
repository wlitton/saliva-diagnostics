class FoodEntry {
  const FoodEntry({
    required this.id,
    required this.createdAt,
    this.imagePath,
    this.imageData,
  });

  final String id;
  final DateTime createdAt;
  final String? imagePath;
  final String? imageData;

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'imagePath': imagePath,
        'imageData': imageData,
      };

  factory FoodEntry.fromJson(Map<String, dynamic> json) {
    return FoodEntry(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      imagePath: json['imagePath'] as String?,
      imageData: json['imageData'] as String?,
    );
  }
}
