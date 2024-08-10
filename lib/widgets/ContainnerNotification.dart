import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationPage extends StatelessWidget {
  final String imageUser;
  final String date;
  final String nameUser;
  final String company;
  final String status;
  final String codeID;

  const NotificationPage({
    required this.imageUser,
    required this.date,
    required this.nameUser,
    required this.company,
    required this.status,
    required this.codeID,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(imageUser))),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameUser,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          company,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                    const FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            color: Theme.of(context).cardColor,
            height: 1,
            width: MediaQuery.sizeOf(context).width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "code id # $codeID",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: status == "completed" ? Colors.green : Colors.red),
                  child: Text(
                    status,
                    style: const TextStyle(color: Colors.white),
                  )),
              Text(
                date,
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          )
        ],
      ),
    );
  }
}
