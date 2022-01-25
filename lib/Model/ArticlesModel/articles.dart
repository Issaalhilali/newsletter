class Articles {
  final List<dynamic> art;

  Articles({required this.art});

//for data value from list articles from json
  Articles.fromJson(Map<String, dynamic> json) : art = json['articles'];
}
