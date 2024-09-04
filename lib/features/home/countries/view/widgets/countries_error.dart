import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CountriesErrorWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const CountriesErrorWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        height: context.heightPercentage(65), // Fixed height for the card
        child: Center(
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
                  icon: Icon(Icons.refresh, size: context.heightPercentage(7))),
            ],
          ),
        ),
      ),
    );
  }
}
