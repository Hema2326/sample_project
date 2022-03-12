part of 'loginscreen_bloc.dart';

abstract class LoginscreenEvent extends Equatable {
  const LoginscreenEvent();

  @override
  List<Object> get props => [];
}

class LoginScreenIntialEvent extends LoginscreenEvent {}