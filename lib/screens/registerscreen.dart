import 'dart:convert';

import 'package:email_validator/email_validator.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../helpers/sliderightroute.dart';
import '../screens/loginscreen.dart';
import '../services/auth_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String _title = 'Register';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: StatefulRegisterWidget(),
    );
  }
}

class StatefulRegisterWidget extends StatefulWidget {
  const StatefulRegisterWidget({Key? key}) : super(key: key);

  @override
  State<StatefulRegisterWidget> createState() => _StatefulRegisterWidget();
}

class _StatefulRegisterWidget extends State<StatefulRegisterWidget> {
  final AuthService authService = AuthService();
  final _registerFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _registerFormKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 80, 15, 20),
                child: Text(
                  'Please fill your email, password, name, and phone',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.171875,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter your email';
                    } else {
                      return EmailValidator.validate(value)
                          ? null
                          : 'Please fill with the valid email';
                    }
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.email,
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Minimum 6 characters';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.password,
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.perm_identity,
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  autocorrect: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    hintText: 'Phone',
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: Icon(
                        Icons.perm_identity,
                        size: 24,
                      ),
                    ),
                    labelStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      height: 1.171875,
                      fontSize: 24.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                    filled: true,
                  ),
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: SizedBox(
                  height: 60.0,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.update,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (_registerFormKey.currentState!.validate()) {
                        _registerFormKey.currentState!.save();
                        EasyLoading.show();
                        var res = await authService.register(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text,
                            _phoneController.text);

                        switch (res!.statusCode) {
                          case 201:
                            EasyLoading.dismiss();
                            Navigator.push(
                                context,
                                SlideRightRoute(
                                    page: const LoginScreen(
                                  errMsg: 'Registered Successfully',
                                )));
                            break;
                          case 400:
                            EasyLoading.dismiss();
                            var data = jsonDecode(res.body);
                            if (data["msg"]) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(data["msg"].toString()),
                              ));
                            }
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Registration Failed"),
                            ));
                            break;
                          default:
                            EasyLoading.dismiss();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Registration Failed"),
                            ));
                            break;
                        }
                      }
                    },
                    label: const Text('REGISTER',
                        style: TextStyle(
                          height: 1.171875,
                          fontSize: 24.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: RichText(
                  text: TextSpan(
                    text: 'Already registered? ',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Login ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w300,
                            //color: Color.fromARGB(255, 235, 235, 235),
                          )),
                      TextSpan(
                          text: 'here ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  SlideRightRoute(
                                      page: const LoginScreen(
                                    errMsg: '',
                                  )));
                            },
                          style: const TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Colors.blueAccent)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
