import 'package:flutter/material.dart';

class MyInboxPage extends StatelessWidget {
  const MyInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Text(
          "this is page inbox",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
