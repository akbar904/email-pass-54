
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_auth_app/main.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('Main', () {
		testWidgets('App initializes with LoginScreen', (tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(LoginScreen), findsOneWidget);
		});

		testWidgets('Navigates to HomeScreen on successful login', (tester) async {
			final mockAuthCubit = MockAuthCubit();

			whenListen(
				mockAuthCubit,
				Stream.fromIterable([Unauthenticated(), Authenticated()]),
				initialState: Unauthenticated(),
			);

			await tester.pumpWidget(
				BlocProvider.value(
					value: mockAuthCubit,
					child: MyApp(),
				),
			);

			await tester.enterText(find.byKey(Key('emailField')), 'zharfan@walturn.com');
			await tester.enterText(find.byKey(Key('passwordField')), 'abc123');
			await tester.tap(find.byKey(Key('loginButton')));
			await tester.pump();

			expect(find.byType(HomeScreen), findsOneWidget);
		});

		testWidgets('Navigates back to LoginScreen on logout', (tester) async {
			final mockAuthCubit = MockAuthCubit();

			whenListen(
				mockAuthCubit,
				Stream.fromIterable([Authenticated(), Unauthenticated()]),
				initialState: Authenticated(),
			);

			await tester.pumpWidget(
				BlocProvider.value(
					value: mockAuthCubit,
					child: MyApp(),
				),
			);

			await tester.tap(find.byKey(Key('logoutButton')));
			await tester.pump();

			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});
}
