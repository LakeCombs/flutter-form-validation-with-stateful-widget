// ignore_for_file: avoid_print

import "package:flutter/material.dart";
import 'package:login_stateful/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // create an instance of the global key state
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        //reference the key to the formKey we created in the GlobalKey
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "email@email.com",
      ),
      validator: validateEmail,
      onSaved: (String? value) {
        email = value!;
      },
    );
  }

  //the ! is the null check and it is used for null safety on
  //method that don't support null

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Password",
      ),
      validator: validatePassword,
      onSaved: (String? value) {
        password = value!;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ButtonStyle(),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          // ignore: unnecessary_brace_in_string_interps
          print("Time to post ${email}  and ${password} to the api");
        }
      },
      child: Text("Submit"),
    );
  }
}
