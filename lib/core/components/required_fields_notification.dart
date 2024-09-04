import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/auth/register/presentation/cubit/register_state.dart';

class RequiredFieldsNotification extends StatelessWidget {
  final RegisterState state;
  const RequiredFieldsNotification({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          state.submissionStatus == SubmissionStatus.invalidCredentialsError,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF1F1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            context.wSBox(1),
            Icon(
              Icons.info_outline,
              color: const Color(0xFFF56342),
              size: context.heightPercentage(3),
            ),
            context.wSBox(2),
            Text(
              "Fill the required fields",
              style: GoogleFonts.montserrat(
                  color: const Color(0xFFF56342),
                  fontSize: context.heightPercentage(2),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
