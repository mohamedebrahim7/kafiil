import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../../../core/components/components.dart';
import '../../../../../core/resources/app_strings.dart';
import '../../../../../generated/assets.dart';
import '../../../../error_screens/no_internet_widget.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class person {}

class _RegisterScreenState extends State<RegisterScreen> {
  final _dateController = TextEditingController();
  final _stringTagController = StringTagController();
  final _firstnameFocusNode = FocusNode();
  final _lastnameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmationFocusNode = FocusNode();
  final _aboutFocusNode = FocusNode(); // New focus node
  @override
  void initState() {
    super.initState();
    final cubit = context.read<RegisterCubit>();

    _aboutFocusNode.addListener(() {
      // New listener
      if (!_aboutFocusNode.hasFocus) {
        cubit.onAboutUnfocused();
      }
    });

    _firstnameFocusNode.addListener(() {
      if (!_firstnameFocusNode.hasFocus) {
        cubit.onFirstnameUnfocused();
      }
    });
    _lastnameFocusNode.addListener(() {
      if (!_lastnameFocusNode.hasFocus) {
        cubit.onLastnameUnfocused();
      }
    });
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        cubit.onEmailUnfocused();
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        cubit.onPasswordUnfocused();
      }
    });
    _passwordConfirmationFocusNode.addListener(() {
      if (!_passwordConfirmationFocusNode.hasFocus) {
        cubit.onPasswordConfirmationUnfocused();
      }
    });
  }

  @override
  void dispose() {
    _stringTagController.dispose();
    _firstnameFocusNode.dispose();
    _lastnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmationFocusNode.dispose();
    _aboutFocusNode.dispose();
    _dateController.dispose(); // New dispose
    super.dispose();
  }

  File? _profilePicFile;

  // A simple usage of EditableImage.
  // This method gets called when trying to change an image.
  Future<void> _directUpdateImage(File? file) async {
    if (file == null) return;

    setState(() {
      _profilePicFile = file;
    });
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
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            Text(
              AppStrings.signUp,
              style: context.textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: context.hPad(Const.scrnPer4),
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  final aboutError =
                      state.about.invalid ? state.about.error : null;
                  final salaryError = state.salary.invalid
                      ? state.salary.error
                      : null; // New errorNew error
                  final birthDateError = state.birthDate.invalid
                      ? state.birthDate.error
                      : null; // New errorNew error

                  final firstnameError =
                      state.firstname.invalid ? state.firstname.error : null;

                  final userTypeError =
                      state.userType.invalid ? state.userType.error : null;

                  final lastnameError =
                      state.lastname.invalid ? state.lastname.error : null;
                  final emailError =
                      state.email.invalid ? state.email.error : null;
                  final passwordError =
                      state.password.invalid ? state.password.error : null;
                  final passwordConfirmationError =
                      state.passwordConfirmation.invalid
                          ? state.passwordConfirmation.error
                          : null;
                  final isSubmissionInProgress =
                      state.submissionStatus == SubmissionStatus.inProgress;
                  final cubit = context.read<RegisterCubit>();

                  if (state.submissionStatus == SubmissionStatus.inProgress) {
                    return const CircularProgressIndicator();
                  } else if (state.submissionStatus ==
                      SubmissionStatus.invalidCredentialsError) {
                    return Center(
                      child: NoInternetWidget(
                        reload: () {
                          cubit.fetchData();
                        },
                      ),
                    );
                  } else {
                    final typesList = state.dependenciesResponse!.data.types;
                    final tagsList = state.dependenciesResponse!.data.tags;
                    final socialMediaList =
                        state.dependenciesResponse!.data.socialMedia;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequiredFieldsNotification(
                          state: state,
                        ),
                        context.hSBox(Const.scrnPer3),
                        CustomStepper(
                          go2nd: state.go2nd,
                        ),
                        context.hSBox(Const.scrnPer5),
                        state.go2nd
                            ? Column(
                                children: [
                                  Center(
                                    child: EditableImage(
                                      imageBorder: Border.all(
                                          color: state.submissionStatus ==
                                                      SubmissionStatus
                                                          .invalidCredentialsError &&
                                                  _profilePicFile == null
                                              ? AppColors.textError
                                              : AppColors.primary,
                                          width: 2.0),
                                      size: context.heightPercentage(15),
                                      onChange: _directUpdateImage,
                                      // Define the source of the image.
                                      image: _profilePicFile != null
                                          ? Image.file(_profilePicFile!,
                                              fit: BoxFit.cover)
                                          : null,
                                      defaultImgSVG: Assets.iconsB,
                                      editIconColor: Colors.white,
                                      editIconBackgroundColor:
                                          AppColors.primary,
                                      editIcon: Icons.add,
                                    ),
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                  CustomTxtField(
                                    maxLines: 5,
                                    focusNode: _aboutFocusNode, // New field
                                    onChanged: cubit.onAboutChanged,
                                    textInputAction: TextInputAction.next,

                                    title: "About",
                                    hint: "",
                                    enabled: !isSubmissionInProgress,
                                    errorText: aboutErrMsg(aboutError),
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                  CustomSalaryField(
                                    errorText: salaryErrMsg(salaryError),
                                    title: 'Salary',
                                    salary: state.salary.value,
                                    onIncrement: () {
                                      cubit.incrementSalary();
                                    },
                                    onDecrement: () {
                                      cubit.decrementSalary();
                                    },
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                  CustomDateTxtField(
                                    textController: _dateController,
                                    selectedDate: state.birthDate.value,
                                    onDateSelected: (date) =>
                                        cubit.onBirthDateChanged(date!),
                                    title: "Birth Date",
                                    hint: "",
                                    enabled: !isSubmissionInProgress,
                                    errorText: dateErrMsg(birthDateError),
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                  RadioListGroupField(
                                      state: state.gender,
                                      title: 'Gender',
                                      options: const ["Male", "Female"]),
                                  context.hSBox(Const.scrnPer3),
                                  CustomTagTxtField(
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: context.heightPercentage(6),
                                        horizontal:
                                            context.widthPercentage(3.5),
                                      ),
                                      title: "Skills",
                                      hint: "",
                                      tagsList: tagsList,
                                      stringTagController:
                                          _stringTagController),
                                  context.hSBox(Const.scrnPer3),
                                  InterestsField(
                                    state: state.interests,
                                    title: 'Favourite Social Media',
                                    socialMedia: socialMediaList,
                                  ),
                                  context.hSBox(Const.scrnPer4),
                                  CustomBtn(
                                      onPressed: () {
                                        cubit.onSubmit2nd(
                                            context,
                                            _stringTagController,
                                            _profilePicFile);
                                      },
                                      inProgress: state.submissionStatus ==
                                          SubmissionStatus.isBtnLoading,
                                      txt: "Submit"),
                                  context.hSBox(Const.scrnPer5),
                                ],
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTxtField(
                                          keyboardType: TextInputType.name,
                                          focusNode: _firstnameFocusNode,
                                          onChanged: cubit.onFirstnameChanged,
                                          textInputAction: TextInputAction.next,
                                          title: "First Name",
                                          hint: "",
                                          enabled: !isSubmissionInProgress,
                                          errorText: userNameErrMsg(
                                              firstnameError, context),
                                        ),
                                      ),
                                      context.wSBox(Const.scrnPer3),
                                      Expanded(
                                        child: CustomTxtField(
                                          focusNode: _lastnameFocusNode,
                                          keyboardType: TextInputType.name,
                                          onChanged: cubit.onLastnameChanged,
                                          textInputAction: TextInputAction.next,
                                          title: "Last Name",
                                          hint: "",
                                          enabled: !isSubmissionInProgress,
                                          errorText: userNameErrMsg(
                                              lastnameError, context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                  CustomTxtField(
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode: _emailFocusNode,
                                    onChanged: cubit.onEmailChanged,
                                    textInputAction: TextInputAction.next,
                                    title: AppStrings.email,
                                    hint: "",
                                    enabled: !isSubmissionInProgress,
                                    errorText: emailErrMsg(emailError, context),
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                  CustomTxtField(
                                    keyboardType: TextInputType.visiblePassword,
                                    maxLines: 1,
                                    focusNode: _passwordFocusNode,
                                    onChanged: cubit.onPasswordChanged,
                                    textInputAction: TextInputAction.next,
                                    title: AppStrings.password,
                                    onEditingComplete: () {
                                      FocusScope.of(context).requestFocus(
                                          _passwordConfirmationFocusNode);
                                    },
                                    hint: "",
                                    isPassword: true,
                                    enabled: !isSubmissionInProgress,
                                    errorText:
                                        passwordErrMsg(passwordError, context),
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                  CustomTxtField(
                                    keyboardType: TextInputType.visiblePassword,
                                    maxLines: 1,
                                    focusNode: _passwordConfirmationFocusNode,
                                    onChanged:
                                        cubit.onPasswordConfirmationChanged,
                                    textInputAction: TextInputAction.done,
                                    title: "Confirm Password",
                                    hint: "",
                                    isPassword: true,
                                    onEditingComplete: () {
                                      FocusScope.of(context).nextFocus();
                                    },
                                    enabled: !isSubmissionInProgress,
                                    errorText: passwordConfirmationErrMsg(
                                        passwordConfirmationError, context),
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                  CustomDropDown(
                                      enabled: !isSubmissionInProgress,
                                      title: "User Type",
                                      hint: "",
                                      errorText: dropdownErrorText(
                                        userTypeError,
                                      ),
                                      onChanged: (value) {
                                        cubit.onDropdownChanged(value);
                                      },
                                      dropDownList:
                                          cubit.convertToDropDownValueModel(
                                              typesList)),
                                  context.hSBox(Const.scrnPer2),
                                  Row(
                                    children: [
                                      const Expanded(
                                          flex: 8, child: SizedBox()),
                                      Expanded(
                                        flex: 5,
                                        child: CustomBtn(
                                          inProgress: isSubmissionInProgress,
                                          onPressed: isSubmissionInProgress
                                              ? null
                                              : () {
                                                  cubit.onSubmit(context);
                                                },
                                          txt: "Next",
                                        ),
                                      ),
                                    ],
                                  ),
                                  context.hSBox(Const.scrnPer3),
                                ],
                              )
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InterestsField extends StatelessWidget {
  final MultiSelectionCheckbox state;
  final String title;
  final List<DependencySocialMedia> socialMedia;

  const InterestsField({
    super.key,
    required this.state,
    required this.title,
    required this.socialMedia,
  });

  @override
  Widget build(BuildContext context) {
    final interestsError = state.invalid ? state.error : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleMedium?.copyWith(
            color: interestsError != null ? AppColors.textFiledError : null,
          ),
        ),
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
              fontSize: context.heightPercentage(1.6),
            ),
            errorText: multiSelectionErrMsg(interestsError),
          ),
          child: Column(
            children: socialMedia.map((social) {
              return CheckboxRow(
                isChecked: state.value.contains(social.value),
                svgAsset: getSocialMediaIcon(social.value),
                text: social.label,
                onChanged: (isSelected) {
                  List<String> newValues = List.from(state.value);
                  if (isSelected!) {
                    newValues.add(social.value);
                  } else {
                    newValues.remove(social.value);
                  }
                  context.read<RegisterCubit>().onInterestsChanged(newValues);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
