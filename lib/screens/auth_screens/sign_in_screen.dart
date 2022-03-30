// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:see_blogs_app/business/auth_manager.dart';
import 'package:see_blogs_app/business/blog_manager.dart';
import 'package:see_blogs_app/constants/strings/button_strings.dart';
import 'package:see_blogs_app/constants/strings/title_strings.dart';
import 'package:see_blogs_app/core/helpers/routes/named_routes.dart';
import 'package:see_blogs_app/core/utilities/toastr.dart';
import 'package:see_blogs_app/environment.dart';
import 'package:see_blogs_app/in_widgets/in_button_colorful.dart';
import 'package:see_blogs_app/in_widgets/in_button_white.dart';
import 'package:see_blogs_app/in_widgets/loading_widget.dart';
import 'package:see_blogs_app/models/login_model_data/login_model_data.dart';
import 'package:see_blogs_app/screens/auth_screens/widgets/email_widget.dart';
import 'package:see_blogs_app/screens/auth_screens/widgets/image_widget.dart';
import 'package:see_blogs_app/screens/auth_screens/widgets/password_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final Color _color = Colors.transparent;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TitleStrings.SIGN_IN)),
      body: _BuildSignInBody(formKey: _formKey, color: _color),
    );
  }
}

class _BuildSignInBody extends StatelessWidget {
  const _BuildSignInBody({
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
            elevation: 7,
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
                  LoginButton(formKey: _formKey),
                  Divider(color: _color),
                  const RegisterButton(),
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

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InButtonWhite(
        onPressed: () {
          Navigator.pushReplacementNamed(context, NamedRoutes.SIGN_UP);
        },
        label: ButtonStrings.REGISTER,
        icon: Icons.login);
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return InButtonColorful(
        onPressed: () async {
          await signInButtonOperations(context);
        },
        label: ButtonStrings.LOG_IN,
        icon: Icons.login);
  }

  Future<void> signInButtonOperations(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      LoadingWidget.getLoadingCircularDialog(context: context);

      var result = await context.read<LoginManager>().signIn();
      if (result.hasError == false) {
        await tokenBoxOperations(result);
        await context.read<BlogManager>().getBlogsWithCategoryId();

        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.HOME);
      } else {
        Navigator.pop(context);
        Toastr.buildErrorToast(result.message.toString());
      }
    }
  }

  Future<void> tokenBoxOperations(LogInModelData result) async {
      var box = await Hive.openBox('token');
    await box.put('jwt', result.data?.token.toString());
    Environment.token = await box.get('jwt');
    box.close();
  }
}
