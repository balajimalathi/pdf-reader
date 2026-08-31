final books = [
  Book(
    title: "The Society of the Spectacle",
    author: "Guy Debord",
    image: "assets/books/1.jpg",
    progress: 34,
    isAudio: true,
  ),
  Book(
    title: "The Society of the Spectacle",
    author: "Guy Debord",
    image: "assets/books/2.jpg",
    progress: 45,
    isAudio: false,
  ),
  Book(
    title: "The Society of the Spectacle",
    author: "Guy Debord",
    image: "assets/books/3.jpg",
    progress: 80,
    isAudio: true,
  ),
];

class Book {
  String title;
  String author;
  String image;
  int progress;
  bool isAudio;

  Book({
    required this.title,
    required this.author,
    required this.image,
    required this.progress,
    required this.isAudio,
  });

  Book copyWith({
    String? title,
    String? author,
    String? image,
    int? progress,
    bool? isAudio,
  }) {
    return Book(
      title: title ?? this.title,
      author: author ?? this.author,
      image: image ?? this.image,
      progress: progress ?? this.progress,
      isAudio: isAudio ?? this.isAudio,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'image': image,
      'progress': progress,
      'isAudio': isAudio,
    };
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      image: json['image'],
      progress: json['progress'],
      isAudio: json['isAudio'],
    );
  }

  @override
  String toString() {
    return '''Book(title: $title, author: $author, image: $image, progress: $progress, isAudio: $isAudio)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.title == title &&
        other.author == author &&
        other.image == image &&
        other.progress == progress &&
        other.isAudio == isAudio;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        author.hashCode ^
        image.hashCode ^
        progress.hashCode ^
        isAudio.hashCode;
  }
}
