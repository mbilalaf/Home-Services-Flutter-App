class CartModel {
  final String title;
  final String description;
  final int quantity;
  final int quantity2;
  final String price;

  CartModel({
    required this.title,
    required this.description,
    required this.price,
    this.quantity = 1,
    this.quantity2 = 1,
  });
}

List<CartModel> cartList = [
  CartModel(
    title: 'Hello ',
    description: 'description',
    price: '\$19.9',
    quantity: 1,
    quantity2: 1,
  ),
  CartModel(
    title: 'Hello000 ',
    description: 'description',
    price: '\$25.9',
    quantity: 1,
    quantity2: 1,
  ),
];
