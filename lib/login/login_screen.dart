// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festivasia_competetion/constants/textfield_decoration.dart';
import 'package:festivasia_competetion/home_screen/admin_home_screen.dart';
import 'package:festivasia_competetion/home_screen/parent_home_screen.dart';
import 'package:festivasia_competetion/models/user_model/user_model.dart';
import 'package:festivasia_competetion/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // final AuthProvider _authProvider = AuthProvider();
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field required";
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                cursorColor: Colors.green,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                controller: emailController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter Your Email',
                  icon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                validator: (value) {
                  RegExp regex = RegExp(r"^.{6,}$");
                  if (value!.isEmpty) {
                    return "Field is required";
                  }
                  if (!regex.hasMatch(value)) {
                    return "Password must contain 6 characters minimum";
                  }
                  return null;
                },
                cursorColor: Colors.green,
                textInputAction: TextInputAction.done,
                obscureText: true,
                textAlign: TextAlign.center,
                controller: passController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter Your Password',
                  icon: const Icon(Icons.password),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              _showSpinner
                  ? Container(
                      margin: const EdgeInsets.only(
                        left: 120,
                        right: 120,
                      ),
                      child: const CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: RoundedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          setState(() {
                            _showSpinner = true;
                          });
                          _signIn(emailController.text, passController.text);
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        title: 'Login',
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn(String email, String password) async {
    try {
      if (_formKey.currentState!.validate()) {
        FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        UserCredential? userCredential =
            await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential != null) {
          var v = await FirebaseFirestore.instance
              .collection('user')
              .doc(userCredential.user!.uid)
              .get();
          UserModel userModel = UserModel.fromJson(v.data()!);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => userModel.role == "Parent"
                  ? const ParentHomeScreen()
                  : const AdminHomeScreen(),
            ),
            (route) => false,
          );
          Fluttertoast.showToast(msg: "Login Successful");
          _showSpinner = false;
          setState(() {});
        } else {
          Fluttertoast.showToast(msg: "Login failed");
          setState(() {
            _showSpinner = false;
          });
        }
      }
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
    setState(() {
      _showSpinner = false;
    });
  }
}
