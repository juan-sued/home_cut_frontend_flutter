import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final String buttonText;
  final String tooltipMessage;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isIconLeft;
  const ButtonWithIcon({
    required this.buttonText,
    required this.tooltipMessage,
    required this.icon,
    required this.onPressed,
    required this.isIconLeft,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Expanded(
      child: Tooltip(
        height: theme.tooltipTheme.height,
        verticalOffset: theme.tooltipTheme.verticalOffset,
        message: tooltipMessage,
        child: Directionality(
          textDirection: isIconLeft ? TextDirection.ltr : TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: onPressed,
            style: ButtonStyle(
              enableFeedback: true,
              backgroundColor:
                  MaterialStateProperty.all(theme.colorScheme.tertiary),
              overlayColor: MaterialStateProperty.all(
                theme.colorScheme.background.withOpacity(0.2),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsetsDirectional.all(10),
              ),
            ),
            label: Text(
              buttonText,
              style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.background,
              ),
            ),
            icon: Icon(
              icon,
              color: theme.colorScheme.background,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
