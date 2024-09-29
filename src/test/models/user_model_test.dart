
import 'package:flutter_test/flutter_test.dart';

import 'package:simple_auth_app/models/user_model.dart';

void main() {
	group('User Model Tests', () {
		test('User model should serialize correctly', () {
			final user = User(email: 'zharfan@walturn.com', password: 'abc123');
			final userMap = user.toMap();

			expect(userMap['email'], 'zharfan@walturn.com');
			expect(userMap['password'], 'abc123');
		});

		test('User model should deserialize correctly', () {
			final userMap = {
				'email': 'zharfan@walturn.com',
				'password': 'abc123'
			};
			final user = User.fromMap(userMap);

			expect(user.email, 'zharfan@walturn.com');
			expect(user.password, 'abc123');
		});

		test('User model equality should work correctly', () {
			final user1 = User(email: 'zharfan@walturn.com', password: 'abc123');
			final user2 = User(email: 'zharfan@walturn.com', password: 'abc123');
			final user3 = User(email: 'other@walturn.com', password: 'abc123');

			expect(user1, equals(user2));
			expect(user1, isNot(equals(user3)));
		});

		test('User model toString should work correctly', () {
			final user = User(email: 'zharfan@walturn.com', password: 'abc123');
			final userString = user.toString();

			expect(userString, 'User(email: zharfan@walturn.com, password: abc123)');
		});
	});
}
