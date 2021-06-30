/// 推荐内容entity

class RecommendRequestEntity {
  RecommendRequestEntity({
    required this.page,
  });
  int page;
  Map<String, dynamic> toJson() => {
        "page": page,
      };
}

class RecommendResponseEntity {
  RecommendResponseEntity({
    required this.author,
    required this.authorPhoto,
    this.content,
    this.images,
    required this.likeCount,
    required this.messageCount,
    required this.shareCount,
    this.topic,
  });

  String author;
  String authorPhoto;
  String? content;
  List<String>? images;
  int likeCount;
  int messageCount;
  int shareCount;
  String? topic;

  factory RecommendResponseEntity.fromJson(Map<String, dynamic> json) =>
      RecommendResponseEntity(
        author: json["author"],
        authorPhoto: json["author_photo"],
        content: json["content"] == null ? null : json["content"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        likeCount: json["likeCount"],
        messageCount: json["messageCount"],
        shareCount: json["shareCount"],
        topic: json["topic"] == null ? null : json["topic"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "author_photo": authorPhoto,
        "content": content == null ? null : content,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "likeCount": likeCount,
        "messageCount": messageCount,
        "shareCount": shareCount,
        "topic": topic == null ? null : topic,
      };
}
