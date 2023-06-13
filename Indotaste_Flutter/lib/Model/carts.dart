class Cart {
  final int id;
  final String user_id;
  final String food_id;
  final String quantity;

  const Cart({
    required this.id,
    required this.user_id,
    required this.food_id,
    required this.quantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      user_id: json['user_id'],
      food_id: json['food_id'],
      quantity: json['quantity'],
    );
  }
}
