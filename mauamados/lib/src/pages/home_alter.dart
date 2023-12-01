import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/widgets.dart';

class HomeAlter extends StatelessWidget {
  const HomeAlter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: NoUsers()
          )
        ],
      ),
    );
  }
}