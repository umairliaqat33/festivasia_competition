import 'dart:developer';

import 'package:festivasia_competetion/config/size_cofig.dart';
import 'package:festivasia_competetion/constants/textfield_decoration.dart';
import 'package:festivasia_competetion/widgets/round_button.dart';
import 'package:flutter/material.dart';

class AddSudentScreen extends StatelessWidget {
  AddSudentScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _programController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
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
                controller: _nameController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter your name',
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
                  hintText: 'Enter student id',
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
                controller: _programController,
                decoration: kMessageTextFieldDecoration.copyWith(
                  hintText: 'Enter study program',
                ),
              ),
              RoundedButton(
                color: Theme.of(context).primaryColor,
                title: "Add student",
                onPressed: () {
                  log("Submit button presses");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
