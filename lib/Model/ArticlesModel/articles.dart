class Articles {
  final List<dynamic> art;

  Articles({required this.art});

  Articles.fromJson(Map<String, dynamic> json) : art = json['articles'];
}
