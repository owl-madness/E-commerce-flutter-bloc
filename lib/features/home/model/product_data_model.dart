class ProductDataModel {
  String id;
  String name;
  double price;
  String description;
  String images;
  int quantity;

  ProductDataModel(
      {required this.id,
      required this.description,
      required this.images,
      required this.name,
      required this.price,
      required this.quantity});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        id: json["id"],
        description: json["description"],
        images: json["images"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
      );
}
