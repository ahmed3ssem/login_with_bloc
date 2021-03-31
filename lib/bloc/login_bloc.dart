import 'dart:async';
import 'validator.dart';

class LoginBloc extends Object with Validator{
  final emailController = StreamController<String>();
  final passwordController = StreamController<String>();

  Function(String) get changeEmail=>emailController.sink.add;

  Function(String) get changePassword=>passwordController.sink.add;

  Stream<String> get email=>emailController.stream.transform(validateEmail);
  Stream<String> get password=>passwordController.stream.transform(validatePassword);

  dispose(){
    emailController.close();
    passwordController.close();
  }
}

final bloc = LoginBloc();