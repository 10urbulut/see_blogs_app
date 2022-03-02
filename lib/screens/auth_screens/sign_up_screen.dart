// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:see_blogs_app/core/helpers/validator.dart';
import 'package:see_blogs_app/in_widgets/in_text_form_field.dart';
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
      appBar: AppBar(title: const Text('Sign Up')),
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
  RegisterButton({Key? key, required this.formKey}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.login, size: 30),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.blueGrey.shade800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minimumSize: const Size(300, 50),
      ),
      label: const Text('Register'),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          print("fsdf");
        } else {}
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.login,
          color: Colors.black,
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          minimumSize: const Size(300, 50),
        ),
        label: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ));
  }
}
