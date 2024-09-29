
import 'package:flutter_test/flutter_test.dart';
import 'package:your_package_name/screens/home_screen.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('should display a Logout button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));

			// Act
			final logoutButtonFinder = find.text('Logout');

			// Assert
			expect(logoutButtonFinder, findsOneWidget);
		});
	});
}
