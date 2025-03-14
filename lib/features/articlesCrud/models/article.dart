class Article {
  final String id;
  final String title;
  final String author;
  final String category;
  final String description;
  final int readTime;
  final String createdAt;
  final String updatedAt;

  Article({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.readTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? '',
      title: json['title'] ?? 'Untitled',
      author: json['author'] ?? 'Unknown',
      category: json['category'] ?? 'Uncategorized',
      description: json['description'] ?? 'No description available',
      readTime: json['read_time'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
