import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // Ganti email dan password sesuai keinginan kamu
  static const _validEmail = 'admin@gmail.com';
  static const _validPassword = '123456';

  LoginBloc() : super(const LoginState()) {
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Email dan password tidak boleh kosong.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: LoginStatus.loading));

    await Future.delayed(const Duration(seconds: 1)); // simulasi loading

    if (state.email == _validEmail && state.password == _validPassword) {
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Email atau password salah.',
        ),
      );
    }
  }
}
