import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 4,
      child: ListTile(
        leading: Text(
          "Bus",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        title: Text(
          "March 10, 2023",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "10:30 AM",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
