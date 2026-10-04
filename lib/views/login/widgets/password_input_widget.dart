
import 'package:bloc_management/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({super.key,required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
          buildWhen: (current,previous)=>current.password!=previous.password,
          builder:(context,state){
            return TextFormField(
              keyboardType: TextInputType.text,
              focusNode: passwordFocusNode,
              decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder()
              ),
              onChanged: (value){
                context.read<LoginBloc>().add(PasswordChanged(password: value));
              },
              validator: (value){
                if(value!.isEmpty){
                  return "Please Enter Password";
                }
                if(value.length<6){
                  return "Enter the password greater then 6 char";
                }
                return null;
              },
              onFieldSubmitted: (value){
              },
            );
          });
  }
}
