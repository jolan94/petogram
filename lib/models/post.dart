class Post {
  final String imageUrl;
  final String caption;
  final int likeCount;

  Post(
      {required this.imageUrl, required this.caption, required this.likeCount});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      imageUrl: json['imageUrl'],
      caption: json['caption'],
      likeCount: json['likeCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'caption': caption,
      'likeCount': likeCount,
    };
  }
}
