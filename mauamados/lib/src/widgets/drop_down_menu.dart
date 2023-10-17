import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  final List<String> items;
  final double fontSize;
  final String selectedItem;
  final Function(String) onChanged;
  final String label;

  const DropDownMenu({
    required this.items,
    required this.fontSize,
    required this.selectedItem,
    required this.onChanged,
    required this.label,
    super.key
  });

  @override
  State<DropDownMenu> createState() {
    return _DropDownMenuState();
  }
}

class _DropDownMenuState extends State<DropDownMenu> {
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06,
        vertical: MediaQuery.of(context).size.height * 0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: widget.fontSize,
              color: const Color.fromARGB(255, 0, 71, 133)
            ),
          ),
          DropdownButton<String>(
            value: _selectedItem,
            items: widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? selectedItem) {
              if (selectedItem != null) {
                setState(() {
                  _selectedItem = selectedItem;
                });
                widget.onChanged(selectedItem);
              }
            },
          )
        ],
      )
    );
  }
}
