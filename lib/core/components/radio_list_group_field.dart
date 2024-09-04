import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';

import '../../features/auth/register/presentation/cubit/register_cubit.dart';

class RadioListGroupField extends StatelessWidget {
  final Gender state;
  final String title;
  final List<String> options;

  const RadioListGroupField(
      {super.key,
      required this.state,
      required this.title,
      required this.options});
  @override
  Widget build(BuildContext context) {
    final genderError = state.invalid ? state.error : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: context.textTheme.titleMedium?.copyWith(
                color: genderError != null ? AppColors.textFiledError : null)),
        context.hSBox(Const.scrnPer1),
        InputDecorator(
            decoration: InputDecoration(
              border: null,
              enabledBorder: null,
              focusedBorder: null,
              errorBorder: null,
              hoverColor: null,
              contentPadding: const EdgeInsets.all(0),
              disabledBorder: null,
              fillColor: Colors.transparent,
              errorStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.textFiledError,
                  fontSize: context.heightPercentage(1.3)),
              errorText: genderErrMsg(genderError),
            ),
            child: Row(
                children: options.map(
              (e) {
                return Row(
                  children: [
                    Radio<String>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: e,
                      groupValue: state.value,
                      onChanged: (value) =>
                          context.read<RegisterCubit>().onGenderChanged(value),
                    ),
                    context.wSBox(Const.scrnPer1),
                    Text(
                      e,
                      style: context.textTheme.headlineMedium
                          ?.copyWith(fontSize: context.heightPercentage(2.2)),
                    ),
                    context.wSBox(Const.scrnPer3),
                  ],
                );
              },
            ).toList())),
      ],
    );
  }
}
