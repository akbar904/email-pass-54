
import 'package:flutter/material.dart';
import 'package:com.example.simple_auth_app/widgets/logout_button.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home Screen'),
			),
			body: Center(
				child: LogoutButton(),
			),
		);
	}
}
