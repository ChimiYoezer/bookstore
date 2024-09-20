
import 'package:bookstore/modelClass/Book_class.dart';

List<BookModel> allBook = [
  BookModel(
    bookName: "The circle of karma",
    authorName: "Kunzang Choden",
    publisher: "Penguin Global",
    quantity: 0,
    price:44,
    imgeUrl:"assets/image/circle.jpg",
  ),
  BookModel(
      bookName: "The complete series",
      authorName: "J. K. Rowling",
      publisher: "Scholastic Corporation",
    quantity: 0,
      price:55,
    imgeUrl:"assets/image/harry.jpg",

  ),
  BookModel(
      bookName: "Aladdin and thieves",
      authorName: "Bhagwati Prasad Mishra",
      publisher: " Simon & Schuster.",
      quantity: 0,
      price:90,
    imgeUrl:"assets/image/aladdin.jpg",
  ),
  BookModel(
      bookName: "Beauty and beast",
      authorName: "Gabrielle-Suzanne de Villeneuve",
      publisher: "Robert Simon & Schuster",
      quantity: 0,
      price:35,
    imgeUrl:"assets/image/beauty.jpg",
  ),
  BookModel(
      bookName: "The ghost rider",
      authorName: "Bhagwati Prasad Mishra",
      publisher: " Simon & Schuster.",
      quantity: 0,
      price:20,
      imgeUrl:"assets/image/ghost.jpg",
  ),
  BookModel(
      bookName: " The Golden Army",
      authorName: "Gabrielle-Suzanne de Villeneuve",
      publisher: "Robert Simon & Schuster",
      quantity: 0,
      price:30,
      imgeUrl:"assets/image/hell.jpg",
  ),

];

List<PaymentModel> allMethods = [
  PaymentModel(paymentMethod: "Cash On Delivery", imgUrl: "assets/image/cash.png"),
  PaymentModel(paymentMethod: "Credit Card", imgUrl: "assets/image/credit.png"),
  PaymentModel(paymentMethod: "Master Card", imgUrl: "assets/image/master.png"),
];

List<Register> userInfo = [];

