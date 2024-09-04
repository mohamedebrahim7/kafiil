import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class ServiceError extends StatelessWidget {
  final VoidCallback? onPressed;

  const ServiceError({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'An error occurred. Please try again.',
            style: context.textTheme.headlineMedium,
          ),
          const SizedBox(height: 20.0),
          IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.refresh, size: context.heightPercentage(5))),
        ],
      ),
    );
  }
}
