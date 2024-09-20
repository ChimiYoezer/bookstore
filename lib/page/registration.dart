import 'package:bookstore/data/Book_list.dart';
import 'package:bookstore/modelClass/Book_class.dart';
import 'package:bookstore/page/login.dart';
import 'package:bookstore/page/managestatepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isRePasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ManageState>(builder: (context, ms, _){
      return Scaffold(
        backgroundColor: Color(0XFFe6ccb2),
        appBar: AppBar(
          backgroundColor:  Color(0XFFe6ccb2),
          title: Text("Registration",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
          centerTitle: true,
          // centerTitle: true,
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
                      _buildTextField(
                        controller: _firstNameController,
                        label: "Name",
                        hint: "Your name",
                        validator: (value) {
                          if (value == null||  value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Please enter your number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||  value.isEmpty) {
                            return "Please enter your name";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _emailController,
                        label: "Email",
                        hint: "Enter your email",
                        suffixIcon: Icons.email_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          if (!value.contains("@")) {
                            return "Enter a valid email address";
                          }
                          if (!value.contains("gmail.com")) {
                            return "Email should contain 'gmail.com'";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: _passwordController,
                        label: "Password",
                        hint: "Enter your password",
                        obscureText: _isPasswordObscured,
                        suffixIcon: _isPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onSuffixIconPressed: () {
                          setState(() {
                            _isPasswordObscured = !_isPasswordObscured;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: _rePasswordController,
                        label: "Re-enter Password",
                        hint: "Re-enter your password",
                        obscureText: _isRePasswordObscured,
                        suffixIcon: _isRePasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onSuffixIconPressed: () {
                          setState(() {
                            _isRePasswordObscured = !_isRePasswordObscured;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please re-enter your password";
                          }
                          if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 45,
                        minWidth: MediaQuery.of(context).size.width * 0.9,
                        color: Color(0XFFd4a276),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            userInfo.add(
                              Register (
                                email: _emailController.text.toString(),
                                password: _passwordController.text.toString(),
                                name: _firstNameController.text.toString(),
                                phoneNo: _phoneController.text.toString(),
                              ),
                            );
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => enterpage()),
                                  (route) => false,
                            );
                          }
                        },
                        child: Text(
                          "Register Now",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
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
    });
  }
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    IconData? suffixIcon,
    void Function()? onSuffixIconPressed,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIconPressed,
        )
            : null,
      ),
      validator: validator,
    );
  }
}