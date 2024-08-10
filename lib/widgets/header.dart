import 'package:devti_test/widgets/ButtonHome.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  final VoidCallback? function;
  final String? imageSelected;
  const HeaderPage({super.key, this.function, this.imageSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "20% OFF",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "on 6 month subscription",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            ButtonHome(
              function: function,
              textValue: "Manage Subscription",
              bgColor: Theme.of(context).cardColor,
              color: Colors.white,
            ),
          ],
        ),
        Image.asset(
          "assets/$imageSelected",
          height: 60,
          width: 60,
        ), // Use the imageSelected path
      ],
    );
  }
}
