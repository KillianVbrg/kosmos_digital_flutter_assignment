import 'package:flutter/material.dart';

class StyledBodySmall extends StatelessWidget {
  const StyledBodySmall(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}


class StyledBodyMedium extends StatelessWidget {
  const StyledBodyMedium({required this.text, required this.centered, super.key});

  final String text;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:  centered ? TextAlign.center : TextAlign.left,
      softWrap: true,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}


class StyledHeadlineSmall extends StatelessWidget {
  const StyledHeadlineSmall({required this.text, required this.centered, super.key});

  final String text;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:  centered ? TextAlign.center : TextAlign.left,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}


class StyledHeadlineMedium extends StatelessWidget {
  const StyledHeadlineMedium(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}


class StyledHeadlineLarge extends StatelessWidget {
  const StyledHeadlineLarge({required this.text, required this.centered, super.key});

  final String text;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: centered ? TextAlign.center : TextAlign.left,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}


class StyledHeadlineLargest extends StatelessWidget {
  const StyledHeadlineLargest({required this.text, required this.centered, super.key});

  final String text;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:  centered ? TextAlign.center : TextAlign.left,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}


class StyledTitleSmall extends StatelessWidget {
  const StyledTitleSmall(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}


class StyledTitleMedium extends StatelessWidget {
  const StyledTitleMedium(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}


class StyledTitleLarge extends StatelessWidget {
  const StyledTitleLarge(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}