import 'package:flutter/material.dart';

class CustomPopupMenuItem extends PopupMenuEntry<String> {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  CustomPopupMenuItem({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(String? value) => false;

  @override
  CustomPopupMenuItemState createState() => CustomPopupMenuItemState();
}

class CustomPopupMenuItemState extends State<CustomPopupMenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Row(
        children: [
          IconButton(
            icon: Icon(widget.icon),
            onPressed: widget.onPressed,
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
