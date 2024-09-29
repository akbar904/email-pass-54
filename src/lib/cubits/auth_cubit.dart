
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
	final String message;

	AuthError(this.message);
}

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) {
		if (email == 'zharfan@walturn.com' && password == 'abc123') {
			emit(Authenticated());
		} else {
			emit(AuthError('Invalid credentials'));
		}
	}

	void logout() {
		emit(Unauthenticated());
	}
}
