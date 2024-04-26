import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/features/Auth/repo/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<SignInAnonymously>(_onSignInAnonymously);
    on<SignOut>(_onSignOut);
  }

  Future<void> _onSignInAnonymously(
    SignInAnonymously event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    User? user = await _authRepository.signInAnonymously();
    if (user != null) {
      emit(AuthSuccess(user: user));
    } else {
      emit(AuthFailure());
    }
  }

  Future<void> _onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.signOut();
    emit(AuthInitial());
  }
}
