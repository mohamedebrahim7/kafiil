import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSalaryTxtField extends StatefulWidget {
  final String title;
  final String? Function(String?)? validator;
  final String? errorText;
  final String hint;
  final String? helper;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(int) onChanged;
  final VoidCallback? onEditingComplete;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;

  const CustomSalaryTxtField(
      {super.key,
      required this.title,
      required this.hint,
      this.isPassword = false,
      this.keyboardType,
      this.enabled,
      this.textInputAction,
      this.errorText,
      this.focusNode,
      required this.onChanged,
      this.onEditingComplete,
      this.validator,
      this.helper,
      this.maxLines,
      this.contentPadding});

  @override
  State<CustomSalaryTxtField> createState() => _CustomSalaryTxtFieldState();
}

class _CustomSalaryTxtFieldState extends State<CustomSalaryTxtField> {
  int price = 0;
  late TextEditingController c;
  @override
  void initState() {
    super.initState();
    c = TextEditingController(text: "SAR $price");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.title,
            style: context.textTheme.titleMedium?.copyWith(
                color: widget.errorText != null
                    ? AppColors.textFiledError
                    : null)),
        context.hSBox(Const.scrnPer1),
        TextFormField(
          controller: c,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          readOnly: true,
          style: context.textTheme.titleMedium?.copyWith(
              color:
                  widget.errorText != null ? AppColors.textFiledError : null),
          cursorColor: AppColors.primary,
          maxLines: widget.maxLines,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: context.heightPercentage(3),
                horizontal: context.widthPercentage(3),
              ),
              errorMaxLines: 4,
              errorStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.textFiledError,
                  fontSize: context.heightPercentage(1.3)),
              // suffiIconConstraints: BoxConstraints(maxHeight: 10, maxWidth: 10),
              suffixIcon: GestureDetector(
                onTap: () {
                  price += 10;
                  c.text = "SAR $price";
                  widget.onChanged(price);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 50.0, top: 10, bottom: 10),
                  child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        size: 25,
                        Icons.add,
                        color: AppColors.primary,
                      )),
                ),
              ),
              prefixIcon: GestureDetector(
                onTap: () {
                  if (price > 0) {
                    price -= 10;
                    c.text = "SAR $price";
                    widget.onChanged(price);
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50.0, top: 10, bottom: 10),
                  child: Container(
                      padding: const EdgeInsets.all(1),

                      //give border raduies
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        size: 25,
                        Icons.remove,
                        color: AppColors.primary,
                      )),
                ),
              ),
              errorText: widget.errorText,
              hintText: widget.hint,
              fillColor: widget.errorText != null
                  ? AppColors.textFiledFillErrorColor
                  : null),
        )
      ],
    );
  }
}
