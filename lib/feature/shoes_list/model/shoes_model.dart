// To parse this JSON data, do
//
//     final shoesModel = shoesModelFromJson(jsonString);

import 'dart:convert';

ShoesModel shoesModelFromJson(String str) =>
    ShoesModel.fromJson(json.decode(str));

String shoesModelToJson(ShoesModel data) => json.encode(data.toJson());

class ShoesModel {
  List<String>? categories;
  List<Shoe>? shoes;

  ShoesModel({
    this.categories,
    this.shoes,
  });

  factory ShoesModel.fromJson(Map<String, dynamic> json) => ShoesModel(
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
        shoes: json["shoes"] == null
            ? []
            : List<Shoe>.from(json["shoes"]!.map((x) => Shoe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "shoes": shoes == null
            ? []
            : List<dynamic>.from(shoes!.map((x) => x.toJson())),
      };
}

class Shoe {
  String? name;
  String? image;
  String? url;
  double? price;
  double? rating;
  int? numberOfReviews;
  List<int>? size;
  String? description;
  List<Review>? reviews;

  Shoe({
    this.name,
    this.image,
    this.url,
    this.price,
    this.rating,
    this.numberOfReviews,
    this.size,
    this.description,
    this.reviews,
  });

  factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
        name: json["name"],
        image: json["image"],
        url: json["url"],
        price: json["price"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        numberOfReviews: json["number_of_reviews"],
        size: json["size"] == null
            ? []
            : List<int>.from(json["size"]!.map((x) => x)),
        description: json["description"]!,
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price": price,
        "url": url,
        "rating": rating,
        "number_of_reviews": numberOfReviews,
        "size": size == null ? [] : List<dynamic>.from(size!.map((x) => x)),
        "description": description,
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

enum Description {
  PERFECT_FOR_KEEPING_YOUR_FEET_DRY_AND_WARM_IN_DAMP_CONDITIONS
}

final descriptionValues = EnumValues({
  "Perfect for keeping your feet dry and warm in damp conditions":
      Description.PERFECT_FOR_KEEPING_YOUR_FEET_DRY_AND_WARM_IN_DAMP_CONDITIONS
});

class Review {
  String? reviewerName;
  double? rating;
  String? description;
  Date? date;

  Review({
    this.reviewerName,
    this.rating,
    this.description,
    this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewerName: json["reviewer_name"],
        rating: json["rating"].toDouble(),
        description: json["description"]!,
        date: dateValues.map[json["date"]]!,
      );

  Map<String, dynamic> toJson() => {
        "reviewer_name": reviewerName,
        "rating": rating,
        "description": description,
        "date": dateValues.reverse[date],
      };
}

enum Date { TODAY }

final dateValues = EnumValues({"Today": Date.TODAY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
