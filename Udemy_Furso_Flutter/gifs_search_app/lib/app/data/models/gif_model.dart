class GifModel {
  final String title;
  final String imageUrl;

  GifModel({required this.title, required this.imageUrl});

  factory GifModel.fromMap(Map<String, dynamic> map) {
    return GifModel(
      title: map["title"],
      imageUrl: map["images"]["fixed_height"]["url"],
    );
  }
}
