// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:see_blogs_app/constants/values.dart';
import 'package:see_blogs_app/core/helpers/validator.dart';
import 'package:see_blogs_app/in_widgets/in_text_form_field.dart';
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
      appBar: AppBar(title: const Text('Sign In')),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10,
            vertical: MediaQuery.of(context).size.height / 80),
        // margin: EdgeInsets.symmetric(
        //     horizontal: MediaQuery.of(context).size.width / 20,
        //     vertical: MediaQuery.of(context).size.height / 20),
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
      label: const Text('Re-Password'),
      validator: Validations.validator.requiredValidator,
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: const Icon(Icons.remove_red_eye),
      obscureText: true,
      textInputAction: TextInputAction.done,
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.login,
        color: Colors.black,
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: const Size(300, 50),
      ),
      label: const Text(
        'Register',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {},
    );
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
    return OutlinedButton.icon(
        onPressed: () {
          if (formKey.currentState!.validate()) {
          } else {}
        },
        icon: const Icon(
          Icons.login,
          color: Colors.white,
          size: 30,
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.blueGrey.shade800,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          minimumSize: const Size(300, 50),
        ),
        label: const Text(
          'Log in',
          style: TextStyle(color: Colors.white),
        ));

    // return ListTile(
    //   tileColor: Colors.blueGrey.shade800,
    //   leading: Icon(
    //     Icons.login,
    //     color: Colors.white,
    //   ),
    //   shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(Values.shapeCircularRadius)),
    //   title: Text('Log in', textAlign: TextAlign.center),
    // );
  }
}
