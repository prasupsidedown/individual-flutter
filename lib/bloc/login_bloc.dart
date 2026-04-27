import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../repositories/login_repository.dart';
import '../utils/session_manager.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;

  LoginBloc({LoginRepository? repository})
    : _repository = repository ?? LoginRepository(),
      super(const LoginState()) {
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
          errorMessage: 'Username dan password tidak boleh kosong.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: LoginStatus.loading));

    final result = await _repository.login(
      username: state.email,
      password: state.password,
    );

    // Hindari async di dalam fold — pisah jadi if/else
    if (result.isLeft()) {
      final error = result.fold((l) => l, (r) => '');
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: error));
    } else {
      final response = result.fold((l) => null, (r) => r);
      await SessionManager.saveToken(response?.accessToken ?? '');
      emit(state.copyWith(status: LoginStatus.success));
    }
  }
}
