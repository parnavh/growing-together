import 'package:flutter/material.dart';
import 'nav_options.dart';

class BottomNavButton extends StatefulWidget {
  final String name;
  const BottomNavButton({Key? key, required this.name}) : super(key: key);

  @override
  State<BottomNavButton> createState() => _BottomNavButtonState();
}

class _BottomNavButtonState extends State<BottomNavButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavOptions.navBarOptions[widget.name]!));
      },
        child: Container(
          child: Text(widget.name),
        )
    );
  }
}
