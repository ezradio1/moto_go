import 'package:flutter/material.dart';
import 'package:moto_go/constants/storage_key.dart';
import 'package:moto_go/layout/layout.dart';
import 'package:moto_go/utils/shared_preference.dart';
import 'package:moto_go/widget/button_custom.dart';
import 'package:moto_go/widget/custom_container.dart';
import 'package:moto_go/widget/input_custom.dart';

enum LoginType { manual, apple, google, facebook }

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginType? loading;
  String email = '';
  String password = '';
  String? emailErrorMsg;
  String? passwordErrorMsg;

  void handleSignIn(LoginType key) {
    if (key == LoginType.manual) {
      setState(() {
        emailErrorMsg = email == '' ? 'Please fill this field' : null;
        passwordErrorMsg = password == '' ? 'Please fill this field' : null;
      });

      if (email == '' || password == '') return;
    }
    setState(() {
      loading = key;
    });
    Future.delayed(const Duration(seconds: 2), () {
      saveData(isLogin, true);
      setState(() {
        loading = null;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Layout()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo_primary.png',
                  width: 160,
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Sign In',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const Text('Welcome, please fill in the form below',
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black38)),
                      const SizedBox(
                        height: 20,
                      ),
                      InputCustom(
                        errorText: emailErrorMsg,
                        labelText: 'Email',
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputCustom(
                        errorText: passwordErrorMsg,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        labelText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ButtonCustom(
                              loading: loading == LoginType.manual,
                              text: 'Sign In',
                              onPressed: () {
                                handleSignIn(LoginType.manual);
                              })),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity,
                        child: const Text(
                          'Or with',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonCustom(
                            loading: loading == LoginType.apple,
                            icon: Icons.apple,
                            type: ButtonType.light,
                            text: 'Sign In with Apple',
                            onPressed: () {
                              handleSignIn(LoginType.apple);
                            }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonCustom(
                            loading: loading == LoginType.google,
                            icon: Icons.email,
                            type: ButtonType.light,
                            text: 'Sign In with Google',
                            onPressed: () {
                              handleSignIn(LoginType.google);
                            }),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonCustom(
                            loading: loading == LoginType.facebook,
                            icon: Icons.facebook,
                            type: ButtonType.light,
                            text: 'Sign In with Facebook',
                            onPressed: () {
                              handleSignIn(LoginType.facebook);
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
