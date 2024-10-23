import 'package:tugasapi/models/review.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String genre;
  final String summary;
  final String imgUrl;
  final List<Review> reviews; // Tambahkan properti reviews

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.summary,
    required this.imgUrl,
    required this.reviews, // Tambahkan parameter ini
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    var reviewsFromJson = json['reviews'] as List;
    List<Review> reviewsList = reviewsFromJson.map((i) => Review.fromJson(i)).toList();

    return Book(
      id: json['_id'],
      title: json['title'],
      author: json['author'],
      genre: json['genre'],
      summary: json['summary'],
      imgUrl: json['img_url'],
      reviews: reviewsList, // Assign ke reviews
    );
  }
}
