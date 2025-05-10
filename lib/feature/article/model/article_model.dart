class ArticleModel {
  int userId;
  int id;
  String title;
  String body;
  bool isFavourite = false;
  ArticleModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body,
      this.isFavourite = false});
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
