import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';

class ReloadWidget extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;

  const ReloadWidget.empty({
    Key? key,
    required this.content,
    this.onPressed,
  }) : super(key: key);

  const ReloadWidget.error({
    Key? key,
    required this.content,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          if (onPressed != null)
            const Icon(
              Icons.refresh,
            ),
        ],
      ),
    );
  }
}
