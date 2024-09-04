import 'package:api_client/api_client.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CustomTagTxtField extends StatefulWidget {
  final List<DependencyTag>? tagsList;
  final String title;
  final String? Function(String?)? validator;
  final String? errorText;
  final String hint;
  final String? helper;
  final TextEditingController? textController;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final StringTagController stringTagController;

  final List<String>? initialTags;

  const CustomTagTxtField(
      {super.key,
      required this.title,
      this.textController,
      required this.hint,
      this.initialTags,
      this.isPassword = false,
      this.keyboardType,
      this.enabled,
      this.textInputAction,
      this.errorText,
      this.focusNode,
      this.onChanged,
      this.onEditingComplete,
      this.validator,
      this.helper,
      this.maxLines,
      this.contentPadding,
      required this.stringTagController,
      this.tagsList});

  @override
  State<CustomTagTxtField> createState() => _CustomTagTxtFieldState();
}

class _CustomTagTxtFieldState extends State<CustomTagTxtField> {
  late double _distanceToField;
  bool error = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldTags<String>(
      textfieldTagsController: widget.stringTagController,
      initialTags: widget.initialTags,
      textSeparators: const [',', '\n'],
      letterCase: LetterCase.normal,
      validator: (String tag) {
        if (tag.isEmpty) {
          return 'this field is required';
        } else if (!widget.tagsList!.any(
          (element) => element.label == tag,
        )) {
          return "$tag is not a valid tag";
        }
        return null;
      },
      inputFieldBuilder: (context, inputFieldValues) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: context.textTheme.titleMedium?.copyWith(
                    color: inputFieldValues.error != null
                        ? AppColors.textFiledError
                        : null)),
            context.hSBox(Const.scrnPer1),
            TextField(
              enabled: widget.enabled,
              maxLines: widget.maxLines,
              onTap: () {
                widget.stringTagController.getFocusNode?.requestFocus();
              },
              controller: inputFieldValues.textEditingController,
              focusNode: inputFieldValues.focusNode,
              decoration: InputDecoration(
                fillColor: inputFieldValues.error != null
                    ? AppColors.textFiledFillErrorColor
                    : null,
                contentPadding: widget.contentPadding ??
                    EdgeInsets.symmetric(
                      vertical: context.heightPercentage(3.5),
                      horizontal: context.widthPercentage(4.5),
                    ),
                errorStyle: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.textFiledError,
                    fontSize: context.heightPercentage(1.6)),
                isDense: true,
                errorText: inputFieldValues.error,
                prefixIconConstraints:
                    BoxConstraints(maxWidth: _distanceToField * 0.8),
                prefixIcon: inputFieldValues.tags.isNotEmpty
                    ? SingleChildScrollView(
                        controller: inputFieldValues.tagScrollController,
                        scrollDirection: Axis.vertical,
                        child: Wrap(
                            runSpacing: 4.0,
                            spacing: 4.0,
                            children: inputFieldValues.tags.map((String tag) {
                              return Container(
                                height: context.heightPercentage(5),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE9F9F1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      tag,
                                      style: context.textTheme.displayMedium,
                                    ),
                                    const SizedBox(width: 4.0),
                                    InkWell(
                                      child: const Icon(
                                        Icons.close,
                                        size: 14.0,
                                        color: AppColors.primary,
                                      ),
                                      onTap: () {
                                        inputFieldValues.onTagRemoved(tag);
                                        if (widget.stringTagController.getTags!
                                            .isEmpty) {
                                          widget.stringTagController.setError =
                                              "skills cant be empty";
                                        }
                                      },
                                    )
                                  ],
                                ),
                              );
                            }).toList()),
                      )
                    : null,
              ),
              onTapOutside: (event) {
                inputFieldValues.focusNode.unfocus();
                if (widget.stringTagController.getTags!.isEmpty) {
                  widget.stringTagController.setError = "skills cant be empty";
                }
              },
              onChanged: inputFieldValues.onTagChanged,
              onSubmitted: (value) {
                inputFieldValues.onTagSubmitted;
              },
            ),
          ],
        );
      },
    );
  }
}
