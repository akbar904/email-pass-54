
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:simple_auth_app/widgets/login_form.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginForm Widget Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('LoginForm displays email and password fields and login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LoginForm(),
					),
				),
			);

			expect(find.byType(TextFormField), findsNWidgets(2));
			expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
		});

		testWidgets('LoginForm calls login on AuthCubit when login button is pressed', (WidgetTester tester) async {
			when(() => mockAuthCubit.state).thenReturn(Unauthenticated());

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<AuthCubit>(
							create: (context) => mockAuthCubit,
							child: LoginForm(),
						),
					),
				),
			);

			await tester.enterText(find.byType(TextFormField).at(0), 'zharfan@walturn.com');
			await tester.enterText(find.byType(TextFormField).at(1), 'abc123');

			await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
			await tester.pump();

			verify(() => mockAuthCubit.login('zharfan@walturn.com', 'abc123')).called(1);
		});
	});
}
