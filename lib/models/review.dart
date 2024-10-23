class Review {
  final String reviewer;
  final int rating;
  final String comment;

  Review({
    required this.reviewer,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewer: json['reviewer'],
      rating: json['rating'],
      comment: json['comment'],
    );
  }
}
