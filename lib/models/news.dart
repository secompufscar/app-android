class News {
  final String title;
  final String publishedAt;

  News({this.title, this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] as String,
      publishedAt: json['publishedAt'] as String,
    );
  }
}