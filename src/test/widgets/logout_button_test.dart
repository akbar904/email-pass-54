
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth_app/widgets/logout_button.dart';

// Mock AuthCubit class
class MockAuthCubit extends MockCubit<void> implements AuthCubit {}

void main() {
	group('LogoutButton Widget Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		testWidgets('renders LogoutButton with "Logout" text', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LogoutButton(authCubit: mockAuthCubit),
					),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('triggers logout when pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LogoutButton(authCubit: mockAuthCubit),
					),
				),
			);

			await tester.tap(find.byType(LogoutButton));
			await tester.pump();

			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
