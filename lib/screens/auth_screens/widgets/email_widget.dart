// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/auth_manager.dart';
import 'package:see_blogs_app/core/helpers/validator.dart';
import 'package:see_blogs_app/in_widgets/in_text_form_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InTextFormField(
      label: const Text('Email'),
      validator: MultiValidator([
        Validations.validator.emailValidator,
        Validations.validator.requiredValidator
      ]),
      prefixIcon: const Icon(Icons.mail),
      textInputAction: TextInputAction.next,
      onChanged: (value) => context.read<AuthManager>().setEmail = value,
    );
  }
}
