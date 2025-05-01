import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FieldValidators {
  FieldValidators._();

  /// Combine multiple validators into one
  static FormFieldValidator<String> combine(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (var validator in validators) {
        final error = validator(value);
        if (error != null) return error;
      }
      return null;
    };
  }

  /// Validate that the field is not empty
  static FormFieldValidator<String> notEmpty({
    String errorMessage = 'This field is required',
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return errorMessage;
      }
      return null;
    };
  }

  static FormFieldValidator<T> notEmptyObject<T>({
    String errorMessage = 'This field is required',
  }) {
    return (value) {
      if (value == null) {
        return errorMessage;
      }
      return null;
    };
  }

  /// Validate email format
  static FormFieldValidator<String> email({
    String errorMessage = 'Invalid email',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return errorMessage;
      const emailPattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
      final regex = RegExp(emailPattern);
      return regex.hasMatch(value) ? null : errorMessage;
    };
  }

  /// Validate minimum length
  static FormFieldValidator<String> minLength(
    int minLength, {
    String errorMessage = 'Too short',
  }) {
    return (value) {
      if (value == null || value.length < minLength) return errorMessage;
      return null;
    };
  }

  /// Validate phone number (only digits, length 10-15)
  static FormFieldValidator<String> phone({
    String errorMessage = 'Invalid phone number',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return errorMessage;
      const phonePattern = r"^\+?[0-9]{10,15}$";
      final regex = RegExp(phonePattern);
      return regex.hasMatch(value) ? null : errorMessage;
    };
  }

  /// Validate password (minimum $minLength characters)
  static FormFieldValidator<String> password({
    int defaultMinimumLength = 6,
    String errorMessage = 'Password must be at least 6 characters',
  }) {
    return minLength(defaultMinimumLength, errorMessage: errorMessage);
  }

  /// Validate password confirmation
  static FormFieldValidator<String> confirmPassword(
    String password, {
    String errorMessage = 'Passwords do not match',
  }) {
    return (repeatedPassword) {
      if (repeatedPassword != password) {
        return errorMessage;
      }
      return null; // Valid
    };
  }

  /// Validate that a date is in the correct format (dd.MM.yyyy)
  static FormFieldValidator<String> validDate({
    String errorMessage = 'Invalid date format (dd.MM.yyyy)',
  }) {
    return (value) {
      if (value == null || value.trim().isEmpty) return errorMessage;

      try {
        DateFormat('dd.MM.yyyy').parseStrict(value);
        return null; // Valid
      } catch (_) {
        return 'Invalid date format dd.MM.yyyy';
      }
    };
  }
}
