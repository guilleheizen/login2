import 'dart:async';
import 'package:login2/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

// GETTERS
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get fromValidStream => Rx.combineLatest2(emailStream, passwordStream, (e,p) => true);


// SETTERS
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
