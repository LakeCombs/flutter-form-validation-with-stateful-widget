import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_stateful/src/blocs/bloc.dart';
import 'package:login_stateful/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    bloc.changeEmail("Lakecombs@gmail.com");

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(bottom: 25.0),
          ),
          submitButton(),
        ],
      ),
    );
  }

//in this funtion you
  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "email@email.com",
            labelText: "email address",
            errorText: snapshot.error.toString(),
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: "password",
            labelText: "Password",
            errorText: snapshot.error.toString(),
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Login"),
    );
  }
}
