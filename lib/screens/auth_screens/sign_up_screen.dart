// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/auth_manager.dart';
import 'package:see_blogs_app/constants/strings/button_strings.dart';
import 'package:see_blogs_app/constants/strings/text_strings.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/core/helpers/validator.dart';
import 'package:see_blogs_app/core/utilities/toastr.dart';
import 'package:see_blogs_app/in_widgets/in_button_colorful.dart';
import 'package:see_blogs_app/in_widgets/in_button_white.dart';
import 'package:see_blogs_app/in_widgets/in_text_form_field.dart';
import 'package:see_blogs_app/core/helpers/routes/named_routes.dart';
import 'package:see_blogs_app/in_widgets/loading_widget.dart';
import 'package:see_blogs_app/screens/auth_screens/widgets/email_widget.dart';
import 'package:see_blogs_app/screens/auth_screens/widgets/image_widget.dart';
import 'package:see_blogs_app/screens/auth_screens/widgets/password_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final Color _color = Colors.transparent;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TitleStrings.SIGN_UP)),
      body: _BuildSignUpBody(formKey: _formKey, color: _color),
    );
  }
}

class _BuildSignUpBody extends StatelessWidget {
  const _BuildSignUpBody({
    Key? key,
    required GlobalKey<FormState> formKey,
    required Color color,
  })  : _formKey = formKey,
        _color = color,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 10,
          vertical: MediaQuery.of(context).size.height / 80),
      child: ListView(
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 40),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Divider(color: _color),
                  const ImageWidget(),
                  Divider(color: _color),
                  const EmailField(),
                  Divider(color: _color),
                  const PasswordField(),
                  Divider(color: _color),
                  const RePasswordField(),
                  Divider(color: _color),
                  RegisterButton(formKey: _formKey),
                  Divider(color: _color),
                  const LoginButton(),
                  Divider(color: _color),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RePasswordField extends StatelessWidget {
  const RePasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InTextFormField(
      label: const Text(TextStrings.RE_PASSWORD),
      validator: Validations.validator.requiredValidator,
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: const Icon(Icons.remove_red_eye),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (value) => context.read<LoginManager>().setRePassword = value,
    );
  }
}

class RegisterButton extends StatelessWidget {
  RegisterButton({Key? key, required this.formKey}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return InButtonColorful(
        onPressed: () async {
          await registerButtonOperations(context);
        },
        label: ButtonStrings.REGISTER,
        icon: Icons.login);
  }

  Future<void> registerButtonOperations(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      LoadingWidget.getLoadingCircularDialog(context: context);

      var result = await context.read<LoginManager>().signUp();
      if (result.hasError == false) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.HOME);
      } else {
        Navigator.pop(context);
        Toastr.buildErrorToast(result.message.toString());
      }
    }
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InButtonWhite(
      onPressed: () {
        Navigator.pushReplacementNamed(context, NamedRoutes.SIGN_IN);
      },
      label: ButtonStrings.LOG_IN,
      icon: Icons.login,
    );
  }
}
