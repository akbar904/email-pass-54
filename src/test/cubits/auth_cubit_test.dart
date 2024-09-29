
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_auth_app/cubits/auth_cubit.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, AuthInitial());
		});

		blocTest<AuthCubit, AuthState>(
			'emit Authenticated when login is called with correct credentials',
			build: () => authCubit,
			act: (cubit) => cubit.login('zharfan@walturn.com', 'abc123'),
			expect: () => [Authenticated()],
		);

		blocTest<AuthCubit, AuthState>(
			'emit AuthError when login is called with incorrect credentials',
			build: () => authCubit,
			act: (cubit) => cubit.login('wrong@walturn.com', 'wrongpass'),
			expect: () => [AuthError('Invalid credentials')],
		);

		blocTest<AuthCubit, AuthState>(
			'emit Unauthenticated when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [Unauthenticated()],
		);
	});
}
