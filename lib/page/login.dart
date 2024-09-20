import 'package:bookstore/data/Book_list.dart';
import 'package:bookstore/page/forgotpage.dart';
import 'package:bookstore/page/managestatepage.dart';
import 'package:bookstore/page/navbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
class enterpage extends StatefulWidget {
  const enterpage({Key? key}) : super(key: key);

  @override
  State<enterpage> createState() => _enterpageState();
}

class _enterpageState extends State<enterpage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _phoneEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isObs = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      // title: Text("Log In",style: TextStyle(fontSize: 24,color:Color(0xffCECFBB),fontWeight: FontWeight.bold)),
      // centerTitle: true,
      return Scaffold(
        backgroundColor: Color(0XFFe6ccb2),
        appBar: AppBar(
          backgroundColor: Color(0XFFe6ccb2),
          // backgroundColor: Color(0xff9d0208),
        ),
        body:
        Column(
          children: [
            Gap(90),
            Column(
              children: [
                Text("Log In",style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold)),
              ],
            ),
            Gap(2),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
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
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              }
                              if (value != userInfo[0].email) {
                                return "Email does not match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            maxLines: 1,
                            controller: _passwordController,
                            obscureText: _isObs,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter your password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObs = !_isObs;
                                  });
                                },
                                icon: Icon(
                                  _isObs ? Icons.visibility_off : Icons.visibility,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }
                              if (value != userInfo[0].password) {
                                return "Password does not match";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ForgetPassword()),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 20,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: MaterialButton(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      height: 40,
                      color:Color(0XFFd4a276),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (_phoneEmailController.text == userInfo[0].email) {

                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => bottomnavbar(),
                              ),
                                  (route) => false,
                            );
                          }
                        }
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(fontSize: 19,  fontWeight:  FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    );
  }
}