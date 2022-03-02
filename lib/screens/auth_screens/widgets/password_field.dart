import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/auth_manager.dart';
import 'package:see_blogs_app/core/helpers/validator.dart';
import 'package:see_blogs_app/in_widgets/in_text_form_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InTextFormField(
      label: const Text('Password'),
      prefixIcon: const Icon(Icons.lock),
      validator: Validations.validator.requiredValidator,
      suffixIcon: const Icon(Icons.remove_red_eye),
      obscureText: true,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) =>
          context.read<AuthManager>().setPassword = value,
    );
  }
}
