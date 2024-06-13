class ShoeModel {
  final String? name;
  final String? price;
  final double? rating;
  final int? numberOfReviews;
  final List<int>? size;
  final String? description;
  final List<ReviewModel>? reviews;

  ShoeModel({
    this.name,
    this.price,
    this.rating,
    this.numberOfReviews,
    this.size,
    this.description,
    this.reviews,
  });

  factory ShoeModel.fromMap(Map<String, dynamic> map) {
    return ShoeModel(
      name: map['name'],
      price: map['price'],
      rating: map['rating'],
      numberOfReviews: map['number_of_reviews'],
      size: List<int>.from(map['size'] ?? []),
      description: map['description'],
      reviews: List<ReviewModel>.from(
          (map['reviews'] ?? []).map((x) => ReviewModel.fromMap(x))),
    );
  }
}

class ReviewModel {
  final String? reviewerName;
  final int? rating;
  final String? description;
  final String? date;

  ReviewModel({
    this.reviewerName,
    this.rating,
    this.description,
    this.date,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      reviewerName: map['reviewer_name'],
      rating: map['rating'],
      description: map['description'],
      date: map['date'],
    );
  }
}

class ShoesData {
  final List<String>? categories;
  final List<ShoeModel>? shoes;

  ShoesData({
    this.categories,
    this.shoes,
  });

  factory ShoesData.fromMap(Map<String, dynamic> map) {
    return ShoesData(
      categories: List<String>.from(map['categories'] ?? []),
      shoes: List<ShoeModel>.from(
          (map['shoes'] ?? []).map((x) => ShoeModel.fromMap(x))),
    );
  }
}
