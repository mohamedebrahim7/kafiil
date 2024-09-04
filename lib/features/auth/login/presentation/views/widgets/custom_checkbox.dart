import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool initialValue;

  const CustomCheckbox({
    super.key,
    required this.onChanged,
    this.initialValue = false,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  void _onCheckboxChanged(bool? newValue) {
    if (newValue != null) {
      setState(() {
        _isChecked = newValue;
      });
      widget.onChanged(_isChecked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: _onCheckboxChanged,
        ),
        context.wSBox(1),
        Text(
          "Remember me",
          style: context.textTheme.titleMedium?.copyWith(
              fontSize: context.heightPercentage(1.7),
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
