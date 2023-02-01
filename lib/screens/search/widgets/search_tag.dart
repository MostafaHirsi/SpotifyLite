import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchTag extends StatelessWidget {
  final bool isSelected;
  final Function()? onTap;
  final String label;
  const SearchTag({
    super.key,
    required this.isSelected,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : const Color(0xFF303030),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.secondaryContainer,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
