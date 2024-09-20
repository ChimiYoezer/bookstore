import 'package:bookstore/page/fourthpage.dart';
import 'package:bookstore/page/managestatepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryInfo extends StatelessWidget {
  DeliveryInfo({super.key});

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Information" ,
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
      ),
      body: Consumer<ManageState>(
        builder: (context, ms, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(hintText: "Name"),
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(hintText: "Address"),
                    ),
                    Text(
                      "Total Price: \$${ms.getTotalPrice()}",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    MaterialButton(
                      color: Color(0xffCECFBB),
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      onPressed: () {
                        ms.addDeliveryDetails(
                          _nameController.text.toString(),
                          _addressController.text.toString(),
                          ms.getTotalPrice(),
                        );
                        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> PaymentInfo()));
                      },
                      child: Text(
                        "Payment",
                        style: TextStyle( fontSize: 19),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}