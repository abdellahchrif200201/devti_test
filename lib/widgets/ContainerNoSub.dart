import 'package:flutter/material.dart';

class ContainerNotSub extends StatelessWidget {
  const ContainerNotSub({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(
            color: Colors.black, // Border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        const Icon(
          Icons.timelapse,
          size: 50,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "you well see recent activties about your \n subsrption and delivries here   ",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        )
      ]),
    );
  }
}
