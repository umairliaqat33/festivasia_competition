import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:festivasia_competetion/add_parent_account/add_parent_account_screen.dart';
import 'package:festivasia_competetion/add_student/add_student_screen.dart';
import 'package:festivasia_competetion/config/size_cofig.dart';
import 'package:festivasia_competetion/widgets/container_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Admin Panel"),
        actions: [
          IconButton(
            onPressed: () {
              log("Logout Presses");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.width15(context),
          right: SizeConfig.width15(context),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.height8(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerWidget(
                      text: "Add Student",
                      color: Colors.blue,
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => AddSudentScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                    ContainerWidget(
                      text: "Add Parent Account",
                      color: Colors.redAccent,
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>
                                const AddParentAccountScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.height8(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerWidget(
                      text: "Edit/Delete Student",
                      color: Colors.cyan,
                      onTap: () {},
                    ),
                    ContainerWidget(
                      text: "View student details",
                      color: Colors.redAccent,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
