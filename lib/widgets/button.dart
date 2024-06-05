import 'package:assignment/constants/colors.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(this.onPressed, this.child, {super.key});

  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
        ),
        decoration: BoxDecoration(
          color: onPressed == null ? AppColors.primaryColor.withOpacity(0.2) : AppColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
