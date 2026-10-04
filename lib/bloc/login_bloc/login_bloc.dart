import 'dart:ui_web';

import 'package:bloc_management/repository/auth/login_repository.dart';
import 'package:bloc_management/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginRepository loginRepository ;
  LoginBloc({required this.loginRepository}) : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit)async {
    Map data = {"email": state.email, "password": state.password};
    emit(
      state.copyWith(postStatusApi: PostStatusApi.loading)
    );

   await loginRepository.loginApi(data).then((value) {
      if(value.error!.isNotEmpty){
        emit(state.copyWith(massage: value.error.toString(),postStatusApi: PostStatusApi.error));
      }
      else{
        emit(state.copyWith(massage: "Login Successful",postStatusApi: PostStatusApi.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        massage: error.toString(),postStatusApi: PostStatusApi.error
      ));
    });
  }
}
