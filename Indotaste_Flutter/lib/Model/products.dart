class Product {
  final int id;
  final String name;
  final String price;
  final int type;
  final String image;
  final String text;

  const Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.type,
      required this.image,
      required this.text});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      type: json['type'],
      image: json['image'],
      text: json['text'],
    );
  }
}
