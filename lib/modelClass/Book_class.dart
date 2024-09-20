class BookModel {
  String bookName;
  String authorName;
  double price;
  int quantity;
  String publisher;
  String imgeUrl;

  BookModel({
    required this.bookName,
    required this.authorName,
    required this.price,
    required this.quantity,
    required this.publisher,
    required this.imgeUrl,
  });
}
class PaymentModel {
  String imgUrl;
  String paymentMethod;

  PaymentModel({
    required this.paymentMethod,
    required this.imgUrl,
  });
}

class DeliveryModel {
  String userName;
  String address;
  double totalPrice;



  DeliveryModel({
    required this.userName,
    required this.address,
    required this.totalPrice,

  });
}
class Register{
  String name;
  String email;
  String password;
  String phoneNo;

  Register({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNo,
  });
}

