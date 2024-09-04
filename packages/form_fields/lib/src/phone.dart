import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../form_fields.dart';

class Phone extends FormzInput<String, PhoneValidationError> {
  //You use the unvalidated constructor when
  // you don’t want to validate your field’s value just yet
  const Phone.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const Phone.validated([
    String value = '',
  ]) : super.dirty(value);

  @override
  PhoneValidationError? validator(String value) {
    String number = "";
    Country? country;
    try {
      country = _getCountry(value);
      if (value.startsWith('+')) {
        number = value
            .substring(1 + country.dialCode.length + country.regionCode.length);
      } else {
        number = value
            .substring(country.dialCode.length + country.regionCode.length);
      }
    } on Exception catch (_) {
      //throw "validator error from PhoneValidationError function in phone.file ";
    }

    if (number.isEmpty) {
      return PhoneValidationError.empty;
    } else if (number.length < country!.minLength) {
      return PhoneValidationError.short;
    } else if (number.length > country.maxLength) {
      return PhoneValidationError.long;
    } else {
      return null;
    }
  }

  static Country _getCountry(String phoneNumber) {
    if (phoneNumber == "") {
      throw NumberTooShortException();
    }

    final validPhoneNumber = RegExp(r'^[+0-9]*[0-9]*$');

    if (!validPhoneNumber.hasMatch(phoneNumber)) {
      throw InvalidCharactersException();
    }

    if (phoneNumber.startsWith('+')) {
      return countries.firstWhere((country) => phoneNumber
          .substring(1)
          .startsWith(country.dialCode + country.regionCode));
    }
    return countries.firstWhere((country) =>
        phoneNumber.startsWith(country.dialCode + country.regionCode));
  }
}

enum PhoneValidationError { empty, short, long }

String? phoneErrMsg(PhoneValidationError? phoneError, BuildContext context) {
  switch (phoneError) {
    case PhoneValidationError.empty:
      return 'Phone cannot be empty';
    case PhoneValidationError.short:
      return 'Invalid Mobile Number';
    case PhoneValidationError.long:
      return 'Invalid Mobile Number';
    default:
      return null;
  }
}
