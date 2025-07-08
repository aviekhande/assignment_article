// ignore_for_file: unnecessary_new

mixin ValidationsMixin {
  String? validatedPassword(String? value) {
    if (value == null || value.isEmpty || value.contains(' ')) {
      // return 'Ensure passwords are identical.';
      return 'Passwords fields should not be empty';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else {
      return null;
    }
  }

  String? validatedPhoneNumber(String? value) {
    if (value == null ||
        value.length > 10 ||
        value.isEmpty ||
        value.length < 10) {
      return 'Please enter valid phone number';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Please enter valid phone number';
    } else {
      return null;
    }
  }
String? validatedEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid email';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email';
  } else {
    return null;
  }
}

  String? validatedName(String? value) {
    if (value == null || value.isEmpty || value.length >= 52) {
      return 'Please enter valid name';
    } else {
      //name regex
      RegExp regex = new RegExp(r'^[A-Za-z\ ]+$');
      if (!regex.hasMatch(value)) {
        return 'Name Should only contain alphabets';
      } else {
        return null;
      }
    }
  }

  String? validatedMessage(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Please enter valid message';
    } else {
      return null;
    }
  }

  String? validatedAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid address';
    } else {
      return null;
    }
  }

  String? validatedDob(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid dob';
    } else {
      return null;
    }
  }

  String? validatedState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Add a valid pincode to fetch state';
    } else {
      return null;
    }
  }

  String? validatedCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Add a valid pincode to fetch city';
    } else {
      return null;
    }
  }

  String? validatedPincode(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Please enter valid pincode';
    } else {
      return null;
    }
  }

  String? validatedQuestion(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Question field cannot be empty';
    } else {
      return null;
    }
  }

  String? validatedOptions(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'options field cannot be empty';
    } else {
      return null;
    }
  }

  String? validateOtp(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'OTP field should not be empty';
    } else {
      return null;
    }
  }

  String? validatedFees(String? value) {
    String fees = value!.substring(1).trim();

    final RegExp regex = RegExp(r'^\d+(\.\d+)?$');

    if (fees.isEmpty) {
      return 'Fee cannot be empty';
    } else if (!regex.hasMatch(fees)) {
      return 'Enter a valid fee';
    }

    double? parsedFee = double.tryParse(fees);
    if (parsedFee == null || parsedFee < 0) {
      return 'Enter a valid fee';
    }

    return null;
  }

  String? validateRemark(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid remark';
    } else {
      return null;
    }
  }

  String? validateAwbNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid AWB number';
    } else {
      return null;
    }
  }
}
