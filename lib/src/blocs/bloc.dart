import "dart:async";
import 'package:login_stateful/src/blocs/validators.dart';
import "package:rxdart/rxdart.dart";

class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //we create a new getter

  //add data to the stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  //watch out for the combineLatestStream.combine2 function
  Stream<bool> get submitValid =>
      CombineLatestStream.combine2(email, password, (email, password) => true);

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print("Email is ${validEmail}, password is ${validPassword}");
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
