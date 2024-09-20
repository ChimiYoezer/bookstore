import 'package:bookstore/data/Book_list.dart';
import 'package:bookstore/modelClass/Book_class.dart';
import 'package:bookstore/page/managestatepage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class PaymentInfo extends StatefulWidget {
  const PaymentInfo({super.key});

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  PaymentModel _selectedMethod = allMethods[0];

  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFe6ccb2),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFFd4a276),
          title: Text("Payment Information",
            style: TextStyle(color: Colors.white),),
          centerTitle: true,

        ),
        body: Consumer<ManageState>(
          builder: (context, ms, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer Name: ${ms.deliveryDetails[0].userName}",
                      style: TextStyle(fontSize: 22),),
                    Text("Location: ${ms.deliveryDetails[0].address}",
                      style: TextStyle(fontSize: 22),),
                    Text("No of items: ${ms.cartProducts.length}",
                      style: TextStyle(fontSize: 22),),
                    Text("Total Price: \$${ms.getTotalPrice()}",
                      style: TextStyle(fontSize: 22),),
                    Gap(10),
                    Text("Choose payment method",
                      style: TextStyle(fontSize: 20),),
                    Gap(10),
                   DropdownButton<PaymentModel>(
                      value: _selectedMethod,
                      onChanged: (PaymentModel? newValue) {
                        setState(() {
                          _selectedMethod = newValue!;
                        });
                      },
                      items: allMethods.map<DropdownMenuItem<PaymentModel>>((PaymentModel method) {
                        return DropdownMenuItem<PaymentModel>(
                          value: method,
                          child: Row(
                            children: [
                              Gap(10),
                              Text("${method.paymentMethod}"),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    Gap(10),
                    _selectedMethod == allMethods[0] ? Gap(10) :Column(
                      children: [
                        TextField(
                          controller: _cardNumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Card number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Gap(10),
                        TextField(
                          controller: _amount,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Amount',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Gap(10),
                        TextField(
                            controller: _password,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(),
                            ),


                        ),
                      ],
                    ),
                    Gap(30),
                    MaterialButton(
                      color: Color(0xffCECFBB),
                      minWidth: double.infinity,
                      onPressed: () {

                        // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> PaymentInfo()));
                      },
                      child: Text(
                        "Buy",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}