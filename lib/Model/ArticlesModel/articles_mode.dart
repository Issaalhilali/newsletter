class ArticlesModel {
  final String? title;
  final String? description;
  final String? urlToImage;

  final String? publishedAt;

  ArticlesModel(
      {this.title, this.description, this.urlToImage, this.publishedAt});

// for data value from json
  ArticlesModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'];
}
