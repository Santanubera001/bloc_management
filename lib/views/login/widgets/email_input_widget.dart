import 'package:bloc_management/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_management/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final  FocusNode emailFocusNode;
  const  EmailInputWidget({super.key,required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      buildWhen: (current,previous)=>current.email!=previous.email,
        builder:(context,state){
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: emailFocusNode,
        decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder()
        ),
        onChanged: (value){
          context.read<LoginBloc>().add(EmailChanged(email: value));
        },
        validator: (value){
          if(value!.isEmpty){
            return "Please Enter Email";
          }
          if(!Validation.emailValidator(value)){
            return "Email is not correct";
          }
          return null;
        },
        onFieldSubmitted: (value){
        },
      );
    });
  }
}
