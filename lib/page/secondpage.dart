import 'package:bookstore/page/managestatepage.dart';
import 'package:bookstore/page/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFe6ccb2),
        appBar: AppBar(
          backgroundColor: Color(0XFFd4a276),
          title: Text("BookStore"),
          centerTitle: true,
        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ms.cartProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        color: Color(0XFFb08968),
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "${ms.cartProducts[index].imgeUrl}"),
                                          fit: BoxFit.cover)),
                                ),
                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.3,
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      children: [
                                        Text(
                                          "${ms.cartProducts[index].bookName}",
                                          style: TextStyle(
                                              fontSize: 23, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "\$${ms.cartProducts[index].price}",
                                          style: TextStyle(
                                              fontSize: 22, fontWeight: FontWeight.bold),
                                        ),
                                        Gap(30),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                ms.decreaseQuantity(ms.cartProducts[index]);
                                              },
                                              icon: Icon(
                                                Icons.remove,
                                                size: 30,
                                                color: Colors.red,
                                              ),
                                            ),
                                            Gap(10),
                                            Text(
                                              "${ms.cartProducts[index].quantity}",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Gap(10),
                                            IconButton(
                                              onPressed: () {
                                                ms.increaseQuantity(ms.cartProducts[index]);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                size: 30,
                                                color: Colors.green,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 250,
                      color: Color(0XFFd4a276),
                      child: Container(
                          child:
                          Center(
                            child:
                            Text("Total Price: \S${ms.getTotalPrice()}", style: TextStyle(fontSize: 25),),)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>DeliveryInfo()));
                      },
                      child: Container(
                        height: 100,
                        width: 142,
                        decoration: BoxDecoration(
                          color:Color(0XFFd4a276),
                        ),
                        child: Center(child: Text("BUY",style: TextStyle(fontSize: 25),)),
                      ),
                    )
                  ],
                )

              ],
            );
          },
        )
    );
  }
}

