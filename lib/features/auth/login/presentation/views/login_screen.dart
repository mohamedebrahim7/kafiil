import 'package:app_theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_fields/form_fields.dart';
import 'package:kafiil/features/auth/login/presentation/views/widgets/custom_checkbox.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/resources/app_strings.dart';
import '../../../../../generated/assets.dart';
import '../cubit/log_in_cubit.dart';
import '../cubit/log_in_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<LogInCubit>();
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        cubit.onPasswordUnfocused();
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        cubit.onEmailUnfocused();
      }
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppStrings.signIn,
          style: context.textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: context.hPad(Const.scrnPer4),
            child: BlocBuilder<LogInCubit, LogInState>(
              builder: (context, state) {
                final passwordError = (state.password?.invalid ?? false)
                    ? state.password?.error
                    : null;
                final emailError =
                    (state.email?.invalid ?? false) ? state.email?.error : null;
                final isSubmissionInProgress =
                    state.submissionStatus == SubmissionStatus.inProgress;
                final cubit = context.read<LogInCubit>();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: SvgPicture.asset(
                      Assets.svgLoginPerson,
                      height: context.heightPercentage(30),
                    )),
                    context.hSBox(Const.scrnPer3),
                    CustomTxtField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      onChanged: cubit.onEmailChanged,
                      title: AppStrings.email,
                      hint: "",
                      enabled: !isSubmissionInProgress,
                      errorText: emailErrMsg(emailError, context),
                    ),
                    context.hSBox(Const.scrnPer2),
                    CustomTxtField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      focusNode: _passwordFocusNode,
                      onChanged: cubit.onPasswordChanged,
                      isPassword: true,
                      title: AppStrings.password,
                      hint: "",
                      enabled: !isSubmissionInProgress,
                      errorText: passwordErrMsg(passwordError, context),
                    ),
                    context.hSBox(Const.scrnPer1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomCheckbox(
                          onChanged: (bool value) {
                            _rememberMe = value;
                          },
                        ),
                        const Expanded(child: SizedBox()),
                        RichText(
                            text: TextSpan(
                          text: AppStrings.forgotPassword,
                          style: context.textTheme.titleMedium!.copyWith(),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => cubit.goForgetPassword(context),
                        ))
                      ],
                    ),
                    context.hSBox(Const.scrnPer4),
                    CustomBtn(
                      inProgress: isSubmissionInProgress,
                      onPressed: isSubmissionInProgress
                          ? null
                          : () {
                              cubit.onSubmit(
                                  context: context, remmberMe: _rememberMe);
                            },
                      txt: AppStrings.logIn,
                    ),
                    context.hSBox(Const.scrnPer3),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: AppStrings.dontHaveAccount,
                          style: context.textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: AppStrings.signUp,
                              style: context.textTheme.titleMedium!.copyWith(
                                color: AppColors.primary,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => cubit.pushRegister(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    context.hSBox(Const.scrnPer3),
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
