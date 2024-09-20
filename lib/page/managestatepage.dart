import 'package:bookstore/modelClass/Book_class.dart';
import 'package:flutter/material.dart';
class ManageState with ChangeNotifier {
  int _counter = 0;
  int _booker = 0;

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
  set booker(int value) {
    _booker = value;
    notifyListeners();
  }

  int get counter => _counter;
  int get booker => _booker;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
  void incrementBooker() {
    _booker++;
    notifyListeners();
  }

  List<BookModel> _cartProducts = [];

  bool addToCart(BookModel product) {
    if(!_cartProducts.contains(product)) {
      _cartProducts.add(product);
      _counter++;
      notifyListeners();
      return true;
    }
    else {
      return false;
    }
  }
  List<BookModel> _bookProducts = [];
  bool addToBook(BookModel product){
    if(!_bookProducts.contains(product)){
      _bookProducts.add(product);
      _booker++;
      notifyListeners();
      return true;
    }
    else{
      return false;
    }
  }



  List<BookModel> get cartProducts => _cartProducts;

  void increaseQuantity(BookModel product) {
    product.quantity++;
    notifyListeners();
  }
  void decreaseQuantity(BookModel product) {
    if(product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    } else {
      _cartProducts.remove(product);
      _counter--;
      notifyListeners();
    }
  }
  List<BookModel> get bookProducts => _bookProducts;

  void incrementQuantity(BookModel product) {
    product.quantity++;
    notifyListeners();
  }
  void decrementQuantity(BookModel product) {
    if(product.quantity > 1) {
      product.quantity--;
      notifyListeners();
    } else {
      _bookProducts.remove(product);
      _booker--;
      notifyListeners();
    }
  }



  double getTotalPrice() {
    double total = 0;
    for(var product in _cartProducts) {
      total = total + product.price * product.quantity;
    }
    return total;
  }
  List<DeliveryModel> _deliveryDetails = [];

  List<DeliveryModel> get deliveryDetails => _deliveryDetails;

  void addDeliveryDetails(String name, String address, double price) {
    _deliveryDetails.add(
      DeliveryModel(
        userName: name,
        address: address,
        totalPrice: price,
      ),
    );
  }
}






