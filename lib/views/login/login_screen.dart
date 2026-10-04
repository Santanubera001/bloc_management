import 'package:bloc_management/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_management/main.dart';
import 'package:bloc_management/models/user/user_model.dart';
import 'package:bloc_management/repository/auth/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;
  final emailFocusNode=FocusNode();
  final passwordFocusNode =FocusNode();
  final _formKey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _loginBloc=LoginBloc(loginRepository:getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: BlocProvider(create:(_) => _loginBloc,
      child:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputWidget(emailFocusNode: emailFocusNode),
              SizedBox(
                height: 20,
              ),
              PasswordInputWidget(passwordFocusNode: passwordFocusNode),
              SizedBox(
                height: 20,
              ),
              LoginButton(formKey: _formKey,),
            ],
          ) ,

        ),
      ),
      )
    );
  }
}
