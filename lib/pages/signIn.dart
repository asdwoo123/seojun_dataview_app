import 'package:flutter/material.dart';
import 'package:seojun_dataview_app/service/account.dart';
import 'package:seojun_dataview_app/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isRemember = false;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  /*void handleSignIn(email, password, remember) {
    signInService(email, password, remember);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text("SEOJUNENG APP", style: heading2),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                      ),
                      child: TextFormField(
                        onSaved: (value) {
                          setState(() {
                            email = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '이메일을 입력하세요';
                          }
                          if (!emailValidate(value.toString())) {
                            return '이메일 양식이 맞지 않습니다';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: heading6.copyWith(color: textGray),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14.0)),
                      child: TextFormField(
                        obscureText: true,
                        onSaved: (value) {
                          setState(() {
                            password = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '비밀번호를 입력하세요';
                          }
                          if (value.toString().length < 3) {
                            return '4글자 이상 입력하세요';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: heading6.copyWith(color: textGray),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: isRemember,
                          onChanged: (value) {
                            setState(() {
                              isRemember = value as bool;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }

                        signInService(email, password, isRemember);
                      },
                      child: const SizedBox(
                          height: 56,
                          child: Center(
                              child: Text('Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  )))),
                      style: ElevatedButton.styleFrom(
                          primary: primaryColor, onPrimary: Colors.white),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(primary: textPrimaryBlue),
                            child: Text('Forgot password', style: heading6,),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(primary: textPrimaryBlue),
                            child: Text('Create an SEOJUNAPP account', style: heading6,),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
