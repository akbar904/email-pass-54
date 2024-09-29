
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_auth_app/screens/login_screen.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('renders LoginForm', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byType(LoginForm), findsOneWidget);
		});

		testWidgets('LoginForm contains Email and Password fields', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byKey(Key('emailField')), findsOneWidget);
			expect(find.byKey(Key('passwordField')), findsOneWidget);
		});

		testWidgets('LoginForm contains Login button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));

			expect(find.byKey(Key('loginButton')), findsOneWidget);
		});
	});
}
