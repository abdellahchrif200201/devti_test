import 'package:flutter/material.dart';

class ContainerCur extends StatelessWidget {
  final bool indexIsActive;
  const ContainerCur({required this.indexIsActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: indexIsActive ? Colors.green : Colors.amber,
          borderRadius: BorderRadius.circular(6)),
    );
  }
}