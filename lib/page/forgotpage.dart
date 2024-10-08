import 'package:bookstore/data/Book_list.dart';
import 'package:flutter/material.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneEmailController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3), // Duration for the SnackBar
        action: SnackBarAction(
          label: "OK",
          onPressed: () {},
        ),
      ),
    );
  }

  Future<void> _Resend() async {
    if (_formKey.currentState?.validate() ?? false) {
      _showSnackBar("Password reset link sent to your email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFe6ccb2),
      appBar: AppBar(
        backgroundColor: Color(0XFFe6ccb2),
        // backgroundColor: Color(0xff9d0208),
        title: Text("Forgot Password",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
        centerTitle: true,
        iconTheme: IconThemeData(
            size: 30
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _phoneEmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        if (value != userInfo[0].email) {
                          return "Email does not match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: 40,
                      color: Color(0XFFd4a276),
                      onPressed: _Resend,
                      child: Text(
                        "Resend",
                        style: TextStyle(fontSize: 24,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}