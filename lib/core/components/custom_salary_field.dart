import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSalaryField extends StatelessWidget {
  final String title;
  final double salary;
  final String? errorText;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomSalaryField({
    super.key,
    required this.title,
    required this.salary,
    required this.onIncrement,
    required this.onDecrement,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: context.textTheme.titleMedium?.copyWith(
                color: errorText != null ? AppColors.textFiledError : null)),
        context.hSBox(Const.scrnPer1),
        InputDecorator(
            decoration: InputDecoration(
                errorStyle: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.textFiledError,
                    fontSize: context.heightPercentage(1.6)),
                contentPadding: EdgeInsets.symmetric(
                  vertical: context.heightPercentage(3.5),
                  horizontal: context.widthPercentage(3.5),
                ),
                errorText: errorText,
                fillColor: errorText != null
                    ? AppColors.textFiledFillErrorColor
                    : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                context.wSBox(5),
                InkWell(
                  onTap: () {
                    onDecrement.call();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Icon(
                          size: context.heightPercentage(3.5),
                          Icons.remove,
                          color: AppColors.primary,
                        ),
                      )),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'SAR ${salary.toInt()}',
                      style: context.textTheme.headlineMedium
                          ?.copyWith(fontSize: context.heightPercentage(2.5)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => onIncrement.call(),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        size: context.heightPercentage(3.5),
                        Icons.add,
                        color: AppColors.primary,
                      )),
                ),
                context.wSBox(5),
              ],
            )),
      ],
    );
  }
}
