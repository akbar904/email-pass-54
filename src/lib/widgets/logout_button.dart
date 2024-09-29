
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit.dart';

class LogoutButton extends StatelessWidget {
	final AuthCubit authCubit;

	const LogoutButton({Key? key, required this.authCubit}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			onPressed: () {
				authCubit.logout();
			},
			child: const Text('Logout'),
		);
	}
}
