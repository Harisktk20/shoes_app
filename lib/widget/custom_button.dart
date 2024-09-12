import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name, this.onTap});
  final String name;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
        backgroundColor: Colors.blue,
        
      ),
        onPressed: onTap,
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ));
  }
}
