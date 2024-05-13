import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm_rxdart/Utils/vadation.dart';
import 'package:rxdart/rxdart.dart';

class LoginMVVM {
  final _tk = PublishSubject<String>();

  final _mk = PublishSubject<String>();

  final _tkFormat = BehaviorSubject.seeded(true);

  final _mkFormat = BehaviorSubject.seeded(true);

  final _loginState = PublishSubject<bool>();

  final _countLogin = ReplaySubject<int>(maxSize: 5);

  TextEditingController tkField = TextEditingController();

  TextEditingController mkField = TextEditingController();

////////////////////////////get////////////////////////////////////////
  Stream<String> get tk => _tk.stream;

  Sink<String> get tkSink => _tk.sink;

  Stream<String> get mk => _mk.stream;

  Sink<String> get mkSink => _mk.sink;

  Stream<bool> get tkFormat => _tkFormat.stream;

  Sink<bool> get tkFormatSink => _tkFormat.sink;

  Stream<bool> get mkFormat => _mkFormat.stream;

  Sink<bool> get mkFormatSink => _mkFormat.sink;

  Stream<bool> get loginState => _loginState.stream;

  Sink<bool> get loginStateSink => _loginState.sink;

  Stream<int> get countLogin => _countLogin.stream;

  Sink<int> get countLoginSink => _countLogin.sink;

  check() {
    Rx.combineLatest2(
      _tk,
      _mk,
      (email, pass) {
        return Validation.isValidPassword(pass);
      },
    ).listen((enable) {
      loginStateSink.add(enable);
    });

    // _tk.listen((email) {
    //   tkFormatSink.add(Validation.isValidEmail(email)) ;
    // });

    _mk.listen((pass) {
      mkFormatSink.add(Validation.isValidPassword(pass));
    });
  }

  Future<bool> login() async {
    final dio = Dio();

    final data = await dio.post('https://dummyjson.com/auth/login', data: {
      'username': tkField.text,
      'password': mkField.text,
      'expiresInMins': 30,
    });

    if (data.data != null) {
      return true;
    } else {
      return false;
    }


  }

  dispose() {
    _tk.close();
    _mk.close();
    _mkFormat.close();
    _tkFormat.close();
    _countLogin.close();
    _loginState.close();
  }
}
