// ignore_for_file: must_be_immutable

import 'package:festivasia_competetion/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';

class InTimeScreen extends StatelessWidget {
  InTimeScreen({super.key});
  List<ListTileWidget> list = [
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
    const ListTileWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("In Time"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return list[index];
              },
            );
          },
        ),
      ),
    );
  }
}
