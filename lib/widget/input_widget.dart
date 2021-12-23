
import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {

  final bool obscureText;
  final String? hitText;
  final IconData? iconData;
  final ValueChanged<String>? onChanged;
  final TextStyle? textStyle;
  final TextEditingController? controller;

  const InputWidget({
    Key? key,
    this.obscureText = false,
    this.hitText,
    this.iconData,
    this.onChanged,
    this.textStyle,
    this.controller,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hitText,
        icon: widget.iconData == null ? null : Icon(widget.iconData),
      ),
    );
  }
}
