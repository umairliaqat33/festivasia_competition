import 'dart:developer';

import 'package:festivasia_competetion/config/size_cofig.dart';
import 'package:festivasia_competetion/leave/apply_for_leave.dart';
import 'package:festivasia_competetion/time_screens/in_time_screen.dart';
import 'package:festivasia_competetion/time_screens/out_time_screen.dart';
import 'package:festivasia_competetion/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Monitor Your child"),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.width15(context) * 2),
              textWidget("Moasib"),
              SizedBox(height: SizeConfig.width15(context) * 2),
              textWidget("10 th"),
              SizedBox(height: SizeConfig.width15(context) * 2),
              textWidget("B-25741"),
              SizedBox(height: SizeConfig.width15(context) * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContainerWidget(
                    text: "In Time",
                    color: Colors.green,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => InTimeScreen(),
                        ),
                      );
                    },
                  ),
                  ContainerWidget(
                    color: Colors.orange,
                    text: "Out Time",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OutTimeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.width15(context) * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerWidget(
                    color: Colors.purple,
                    text: "Apply for Leave",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ApplyForLeave(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text textWidget(
    String text,
  ) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
