import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:app_theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_fields/form_fields.dart';
import 'package:kafiil/core/navigation/cubits/app_settings_manager_cubit.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../../../../core/navigation/cubits/app_settings_manager_state.dart';
import '../../../../../../core/resources/app_strings.dart';
import '../../../../core/components/components.dart';
import '../../../auth/register/presentation/views/register_screen.dart';

class ProfileScreen extends StatelessWidget {
  final LoginResponse? loginResponse;

  const ProfileScreen({super.key, this.loginResponse});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<AppSettingsManagerCubit, AppSettingsManagerState>(
        builder: (context, state) {
          final user = loginResponse?.data ?? state.loginResponse?.data;
          log("🟡🟡🟡 from constructor ${loginResponse != null}🟡🟡🟡");
          return Column(
            children: [
              context.hSBox(Const.scrnPer3),
              Center(
                child: EditableImage(
                  enabled: false,
                  imageBorder: Border.all(color: AppColors.primary, width: 2.0),
                  size: context.heightPercentage(15),
                  onChange: (file) {},
                  image: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: user!.avatar,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  // Define the source of the image.
                  editIconColor: Colors.white,
                  editIconBackgroundColor: AppColors.primary,
                  editIcon: Icons.add,
                ),
              ),
              context.hSBox(Const.scrnPer3),
              Row(
                children: [
                  Expanded(
                    child: CustomTxtField(
                      initialValue: user.firstName,
                      textInputAction: TextInputAction.next,
                      title: "First Name",
                      hint: "",
                      enabled: false,
                    ),
                  ),
                  context.wSBox(Const.scrnPer3),
                  Expanded(
                    child: CustomTxtField(
                      initialValue: user.lastName,
                      textInputAction: TextInputAction.next,
                      title: "Last Name",
                      hint: "",
                      enabled: false,
                    ),
                  ),
                ],
              ),
              context.hSBox(Const.scrnPer3),
              CustomTxtField(
                initialValue: user.email,
                textInputAction: TextInputAction.next,
                title: AppStrings.email,
                hint: "",
                enabled: false,
              ),
              context.hSBox(Const.scrnPer3),
              const CustomTxtField(
                initialValue: "dummy password",
                maxLines: 1,
                textInputAction: TextInputAction.next,
                title: AppStrings.password,
                hint: "",
                isPassword: true,
                readOnly: true,
              ),
              context.hSBox(Const.scrnPer3),
              RadioListGroupField(
                options: const ["seller", "buyer", "both"],
                state: Gender.dirty(user.type.name),
                title: 'User Type',
              ),
              context.hSBox(Const.scrnPer3),
              CustomTxtField(
                textController: TextEditingController(text: user.about),
                maxLines: 5,
                textInputAction: TextInputAction.next,
                title: "About",
                hint: "",
                enabled: false,
              ),
              context.hSBox(Const.scrnPer3),
              CustomTxtField(
                initialValue: 'SAR ${user.salary.toString()}',
                maxLines: 1,
                textInputAction: TextInputAction.next,
                title: "Salary",
                hint: "",
                enabled: false,
              ),
              context.hSBox(Const.scrnPer3),
              CustomDateTxtField(
                initialValue: user.birthDate,
                onDateSelected: (date) {},
                title: "Birth Date",
                hint: "",
                enabled: false,
              ),
              context.hSBox(Const.scrnPer3),
              RadioListGroupField(
                options: const ["Male", "Female"],
                state: Gender.dirty(user.gender == 0
                    ? "Male"
                    : user.gender == 1
                        ? "Female"
                        : ''),
                title: 'Gender',
              ),
              context.hSBox(Const.scrnPer3),
              CustomTagTxtField(
                  initialTags: user.tags.map(
                    (element) {
                      return element.name;
                    },
                  ).toList(),
                  enabled: false,
                  maxLines: 3,
                  title: "Skills",
                  hint: "",
                  stringTagController: StringTagController()),
              context.hSBox(Const.scrnPer3),
              InterestsField(
                state: MultiSelectionCheckbox.dirty(user.favoriteSocialMedia),
                title: 'Favourite Social Media',
                socialMedia: user.favoriteSocialMedia.map(
                  (e) {
                    return DependencySocialMedia(value: e, label: e);
                  },
                ).toList(),
              ),
              context.hSBox(Const.scrnPer4),
              context.hSBox(Const.scrnPer5),
            ],
          );
        },
      ),
    );
  }
}
