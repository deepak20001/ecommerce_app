import '../product_model/product_model.dart';

class OrderModel {
  String payment;
  String status;
  List<ProductModel> products;
  double totalPrice;
  String orderId;

  OrderModel({
    required this.payment,
    required this.status,
    required this.products,
    required this.totalPrice,
    required this.orderId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> productMap = json["products"];

    return OrderModel(
      payment: json["payment"],
      status: json["status"],
      products: productMap.map((e) => ProductModel.fromJson(e)).toList(),
      totalPrice: json["totalPrice"],
      orderId: json["orderId"],
    );
  }

  // toJson currently not needed
  //  it's expected to be a method within the OrderModel class that converts an OrderModel instance to a JSON map. It will be used when sending order data to an API or when storing the data in a database.
}
