part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignInAnonymously extends AuthEvent {}

class SignOut extends AuthEvent {}
