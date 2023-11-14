import 'package:flutter/material.dart';
import 'package:mauamados/src/widgets/profile_box.dart';

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
    return ProfileBox(
      label: widget.label, 
      fontSize: widget.fontSize,
      data: DropdownButton<String>(
        isExpanded: true,
        value: _selectedItem,
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: widget.fontSize,
              ),
              softWrap: true,
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
      ),
    );
  }
}
