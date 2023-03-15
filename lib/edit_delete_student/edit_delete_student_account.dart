import 'dart:developer';

import 'package:festivasia_competetion/config/size_cofig.dart';
import 'package:festivasia_competetion/constants/textfield_decoration.dart';
import 'package:festivasia_competetion/widgets/round_button.dart';
import 'package:flutter/material.dart';

class EditDeleteStudentAccountScreen extends StatelessWidget {
  EditDeleteStudentAccountScreen({super.key});

  final TextEditingController _idController = TextEditingController();
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
              RoundedButton(
                color: Theme.of(context).primaryColor,
                title: "Search account",
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
