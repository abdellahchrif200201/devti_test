import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final VoidCallback? function;
  final String? textValue;
  final Icon? icon;
  final Color? color; // Text color
  final Color? borderColor; // Border color
  final Color? bgColor; // Background color

  const ButtonHome({
    super.key,
    this.function,
    this.textValue,
    this.icon,
    this.color,
    this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      // ignore: sort_child_properties_last
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (icon != null) ...[
            icon!,
            // Add spacing between icon and text
            const SizedBox(
              width: 3,
            )
          ],
          Text(
            textValue ?? "Default Text",
            style: TextStyle(
                color: color ??
                    Theme.of(context).textTheme.bodyText1!.color), // Text color
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: bgColor ?? Colors.green, // Background color
        onPrimary: color ?? Colors.white, // Text color
        side: BorderSide(
          color: borderColor ?? Colors.white, // Border color
          width: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
      ),
    );
  }
}
