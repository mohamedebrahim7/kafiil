import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_fields/form_fields.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil/generated/assets.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/resources/app_strings.dart';
import '../cubit/forget_password_cubit.dart';
import '../cubit/forget_password_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _phoneFocusNode = FocusNode();
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ForgetPasswordCubit>();
    _phoneFocusNode.addListener(() {
      if (!_phoneFocusNode.hasFocus) {
        cubit.onPhoneUnfocused();
      }
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            Text(
              AppStrings.forgetPassword,
              style: context.textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: context.allHPad(Const.scrnPer2),
            child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
              builder: (context, state) {
                final phoneError =
                    state.phone.invalid ? state.phone.error : null;
                final isSubmissionInProgress =
                    state.submissionStatus == SubmissionStatus.inProgress;
                final cubit = context.read<ForgetPasswordCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    context.hSBox(Const.scrnPer2),
                    Center(child: SvgPicture.asset(Assets.svgForgetPassword)),
                    context.hSBox(Const.scrnPer3),
                    CustomPhoneTxtField(
                      title: AppStrings.phoneNumber,
                      hint: AppStrings.phoneNumberHint,
                      controller: controller,
                      focusNode: _phoneFocusNode,
                      enabled: !isSubmissionInProgress,
                      errorText: phoneErrMsg(phoneError, context),
                      onChanged: (phone) {
                        cubit.onPhoneChanged(phone.completeNumber);
                      },
                      onCountryChanged: (country) {
                        cubit.onPhoneChanged(
                            "+${country.dialCode}${controller.text}");
                      },
                      onSubmitted: (value) {
                        cubit.onSubmit(context);
                      },
                    ),
                    context.hSBox(Const.scrnPer5),
                    CustomBtn(
                      inProgress: state.forgetPasswordStatus ==
                          ForgetPasswordStatus.loading,
                      onPressed: isSubmissionInProgress
                          ? null
                          : () {
                              cubit.onSubmit(context);
                            },
                      txt: AppStrings.sendVerificationCode,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
