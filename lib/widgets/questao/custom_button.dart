import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;

  CustomButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: Colors.white), // White border to match the design
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
        ),
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16), // White text color
        ),
      ),
    );
  }
}
