class CardArticleModel {
  final String title;
  final String author;
  final String navigationPath;
  final String text;
  final String imageUrl;
  final String publishedDate;

  CardArticleModel({
    required this.title,
    required this.author,
    required this.navigationPath,
    required this.text,
    required this.imageUrl,
    required this.publishedDate,
  });

  @override
  String toString() {
    return 'CardArticleModel{title: $title, author: $author, navigationPath: $navigationPath, text: $text, imageUrl: $imageUrl, publishedDate: $publishedDate}';
  }

  static fromJSON(json) {
    return CardArticleModel(
        title: json["title"],
        author: json["authorName"],
      publishedDate: json["date"],
      navigationPath: '',
      text: json["text"],
      imageUrl: '',);
  }
}