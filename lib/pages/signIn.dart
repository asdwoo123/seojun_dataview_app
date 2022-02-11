import 'package:flutter/material.dart';
import 'package:seojun_dataview_app/service/account.dart';
import 'package:seojun_dataview_app/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool pwdVisible = false;
  bool remember = false;

  void handleSignIn(email, password, remember) {
    signInService(email, password, remember);
  }

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
              Form(child:
              Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,

              ),
                      child: TextFormField(),
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
