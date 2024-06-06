import 'package:flutter/material.dart';
import 'package:assignment/widgets/texts.dart';

class StyledTextField extends StatelessWidget {
  const StyledTextField({required this.label, required this.hint, required this.isHidden, this.prefixIcon, this.suffixIcon, required this.controller, super.key});

  final String label;
  final String hint;
  final bool isHidden;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledBodyMedium(text: label, centered: false),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]
          ),
          child: TextField(
            controller: controller,
            obscureText: isHidden,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.headlineSmall,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
