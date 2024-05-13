import 'package:flutter/material.dart';
import 'package:mvvm_rxdart/ui/main.dart';
import 'package:mvvm_rxdart/viewmodel/login_mvvm.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginMVVM loginMVVM = LoginMVVM();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginMVVM.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<bool>(
                stream: loginMVVM.tkFormat,
                builder: (context, snapshot) {
                  print('test thu ${snapshot.data}');
                  return TextFormField(
                    controller: loginMVVM.tkField,
                    onChanged: (value) {
                      //loginMVVM.tkField.text = value;
                      loginMVVM.tkSink.add(value);
                      loginMVVM.check();
                    },
                    decoration: InputDecoration(
                        errorText:
                            snapshot.data == false ? 'email sai format' : null),
                  );
                }),
            StreamBuilder<bool>(
                stream: loginMVVM.mkFormat,
                builder: (context, snapshot) {
                  return TextFormField(
                    controller: loginMVVM.mkField,
                    onChanged: (value) {
                      //loginMVVM.mkField.text = value;
                      loginMVVM.mkSink.add(value);
                      loginMVVM.check();
                    },
                    decoration: InputDecoration(
                        errorText:
                            snapshot.data == false ? 'pass sai format' : null),
                  );
                }),
            StreamBuilder<bool>(
              stream: loginMVVM.loginState,
              builder: (context, snapshot) {
                return ElevatedButton(
                  onPressed:  () async {
                    final check = await loginMVVM.login();
                    if(check ==  true){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Home();
                      },));
                    }
                  },
                  style:  ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        snapshot.data == false ? Colors.grey : Colors.red
                    ),
                  ),
                  child: const Text('Login', style: TextStyle(color: Colors.white)),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
