import 'dart:async';

import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/services/authentication_api.dart';

class LoginBloc {
  final AuthenticationApi authenticationApi;
  final StreamController<User> _signUpController = StreamController<User>();
  Sink<User> get signUpUser => _signUpController.sink;
  Stream<User> get signedUpUser => _signUpController.stream;
  final StreamController<User> _signInController = StreamController<User>();
  Sink<User> get signInUser => _signUpController.sink;
  Stream<User> get signedInUser => _signUpController.stream;

  LoginBloc(this.authenticationApi) {
    _signUpController.stream.listen(_createAccount);
    _signInController.stream.listen(_logIn);

    // _startListenersIfEmailPasswordAreValid();
  }

  Future<String> _createAccount(User _user) async {
    String _result = '';
    await authenticationApi
        .createUserWithEmailAndPassword(fullname: _user.fullname, email: _user.email, password: _user.password)
        .then((user) {
      print('Created user: $user');
      _result = 'Created user: $user';
      authenticationApi
          .signInWithEmailAndPassword(email: _user.email , password: _user.password)
          .then((user) {})
          .catchError((error) async {
        print('Login error: $error');
        _result = error;
      });
    }).catchError((error) async {
      print('Creating user error: $error');
    });
    return _result;
  }

  Future<String> _logIn(User user) async {
    String _result = '';
    await authenticationApi
        .signInWithEmailAndPassword(email: user.email, password: user.password)
        .then((user) {
      _result = 'Success';
    }).catchError((error) {
      print('Login error: $error');
      _result = error;
    });
    return _result;
  }

  void dispose() {
    _signUpController.close();
    _signInController.close();
  }
}
