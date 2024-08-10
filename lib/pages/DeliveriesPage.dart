import 'package:flutter/material.dart';

class DeliveriesPage extends StatelessWidget {
  const DeliveriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Text(
          "this is Deliveries Page ",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
