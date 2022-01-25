class ArticlesModel {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  ArticlesModel(
      {this.title,
      this.description,
      this.urlToImage,
      this.publishedAt,
      this.content});

// for data value from json
  ArticlesModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'];
}
