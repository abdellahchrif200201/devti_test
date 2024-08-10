import 'package:flutter/material.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 1.5,
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sub user added",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "dev ti",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    Text(
                      "10:23 PM",
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
