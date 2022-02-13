import 'package:flutter/material.dart';
import 'package:seojun_dataview_app/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPwdVisible = false;
  bool? isRemember = false;

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
              Form(child:
              Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,

              ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: heading6.copyWith(color: textGray),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0)
                      ),
                      child: TextFormField(
                        obscureText: !isPwdVisible,

                      ),
                    ),
                    Checkbox(
                      value: isRemember,
                      onChanged: (value) {
                        setState(() {
                          isRemember = value;
                        });
                      },
                    )
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
