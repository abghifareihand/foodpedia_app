class FoodResponseModel {
    final String? id;
    final String? name;
    final String? description;
    final int? price;
    final String? image;
    final double? rating;

    FoodResponseModel({
        this.id,
        this.name,
        this.description,
        this.price,
        this.image,
        this.rating,
    });

    factory FoodResponseModel.fromJson(String id, Map<String, dynamic> json) => FoodResponseModel(
        id: id,
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image,
        "rating": rating,
    };
}
