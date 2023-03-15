// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festivasia_competetion/config/size_cofig.dart';
import 'package:festivasia_competetion/constants/textfield_decoration.dart';
import 'package:festivasia_competetion/home_screen/admin_home_screen.dart';
import 'package:festivasia_competetion/home_screen/parent_home_screen.dart';
import 'package:festivasia_competetion/models/user_model/user_model.dart';
import 'package:festivasia_competetion/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddParentAccountScreen extends StatefulWidget {
  const AddParentAccountScreen({super.key});

  @override
  State<AddParentAccountScreen> createState() => _AddParentAccountScreenState();
}

class _AddParentAccountScreenState extends State<AddParentAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _classController = TextEditingController();
  bool _showSpinner = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply for leave"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.width15(context),
          right: SizeConfig.width15(context),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                cursorColor: Colors.green,
                textInputAction: TextInputAction.done,
                obscureText: true,
                textAlign: TextAlign.center,
                controller: _emailController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter email',
                ),
              ),
              TextFormField(
                cursorColor: Colors.green,
                textInputAction: TextInputAction.done,
                obscureText: true,
                textAlign: TextAlign.center,
                controller: _nameController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter parent name',
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                cursorColor: Colors.green,
                textInputAction: TextInputAction.done,
                obscureText: true,
                textAlign: TextAlign.center,
                controller: _idController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter parent\'s student id',
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                cursorColor: Colors.green,
                textInputAction: TextInputAction.done,
                obscureText: true,
                textAlign: TextAlign.center,
                controller: _classController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter student class',
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                cursorColor: Colors.green,
                textInputAction: TextInputAction.done,
                obscureText: true,
                textAlign: TextAlign.center,
                controller: _passwordController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter password',
                ),
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
                          createParentAccount();
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

  void createParentAccount() async {
    try {
      if (_formKey.currentState!.validate()) {
        FirebaseAuth firebaseAuth = FirebaseAuth.instance;
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        UserCredential? userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
        if (userCredential != null) {
          UserModel userModel = UserModel(
            email: _emailController.text,
            role: 'Parent',
            uid: userCredential.user!.uid,
          );
          firebaseFirestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set(userModel.toJson());

          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const AdminHomeScreen(),
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
