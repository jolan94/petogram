class Story {
  final String imageUrl;
  final String name;

  Story({required this.imageUrl, required this.name});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      imageUrl: json['imageUrl'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
    };
  }
}
