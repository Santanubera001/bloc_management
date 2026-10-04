part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String massage;
  final PostStatusApi postStatusApi;


  const LoginState({
    this.email = "",
    this.password = "",
    this.massage='',
    this.postStatusApi=PostStatusApi.initial,

  });

  LoginState copyWith({String? email, String? password,String? massage,PostStatusApi? postStatusApi}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      massage: massage??this.massage,
      postStatusApi: postStatusApi??this.postStatusApi
    );
  }

  @override
  List<Object?> get props => [password, email,massage,postStatusApi];
}
