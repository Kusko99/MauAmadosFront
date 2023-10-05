import 'package:flutter/material.dart';

class ChoiceButton extends StatefulWidget {
  final double size;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const ChoiceButton({
    Key? key,
    required this.size,
    required this.color,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size * 2,
      width: widget.size * 2,
      margin: EdgeInsetsDirectional.only(
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          backgroundColor: widget.backgroundColor,
          elevation: 4,
          highlightElevation: 1,
          hoverElevation: 1,
          hoverColor: widget.color,
          splashColor: widget.color,
          child: Icon(
            widget.icon,
            size: widget.size,
            color: isHovered ? Colors.white : widget.color,
          ),
        ),
      ),
    );
  }
}
