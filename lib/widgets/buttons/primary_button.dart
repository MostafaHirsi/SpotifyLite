import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool showAlternativeColor;
  final String label;
  const PrimaryButton({
    super.key,
    this.showAlternativeColor = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStatePropertyAll(
          showAlternativeColor
              ? Theme.of(context).colorScheme.secondaryContainer
              : Theme.of(context).colorScheme.primary,
        ),
      ),
      onPressed: () => {},
      child: Container(
        child: Baseline(
          baselineType: TextBaseline.alphabetic,
          baseline: 14.0,
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
