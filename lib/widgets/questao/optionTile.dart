
import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String optionText;
  final String optionLetter; 
  final bool isSelected;
  final VoidCallback onTap;

  OptionTile({
    required this.optionText,
    required this.optionLetter,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: isSelected ? Color(0xFF789DBC) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(optionText),
          leading: CircleAvatar(
            backgroundColor: isSelected ? Colors.white: Colors.white,
            child: Text(optionLetter),
            foregroundColor: Colors.black, 
          ),
        ),
      ),
    );
  }
}
