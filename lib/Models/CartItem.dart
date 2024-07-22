class CartItem {
  String? IMage;
  String? description;
  int? price;
  int? Count;
  int? totalPrice;
  String size;

  CartItem(
      this.IMage, this.description, this.price,
       this.Count, this.totalPrice , this.size);
}

List<CartItem> Cartitems = [];
