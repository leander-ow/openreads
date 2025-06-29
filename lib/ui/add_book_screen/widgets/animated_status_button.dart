import 'package:flutter/material.dart';
import 'package:openreads/core/constants/enums/enums.dart';
import 'package:openreads/core/themes/app_theme.dart';

class AnimatedStatusButton extends StatelessWidget {
  const AnimatedStatusButton({
    super.key,
    required Duration duration,
    required this.height,
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.currentStatus,
  }) : _duration = duration;

  final Duration _duration;

  final double height;
  final Function() onPressed;
  final IconData icon;
  final String text;
  final bool isSelected;
  final BookStatus? currentStatus;

  @override
  Widget build(BuildContext context) {
    final baseWidth = (MediaQuery.of(context).size.width - 80) / 5;
    final selectedWidth = baseWidth + 20;

    return AnimatedContainer(
      duration: _duration,
      height: height,
      width: isSelected ? selectedWidth : baseWidth,
      alignment: Alignment.center,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cornerRadius),
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
            border: Border.all(color: dividerColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : null,
                  ),
                  FittedBox(
                    child: Text(
                      text,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 13,
                        color: isSelected
                            ? Theme.of(context).colorScheme.onPrimary
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
