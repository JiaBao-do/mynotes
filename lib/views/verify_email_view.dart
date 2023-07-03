import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/services/auth/bloc/auth_bloc.dart';
import 'package:mynotes/services/auth/bloc/auth_event.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text(
              "An verification email has been sent. Please click the link to verify account. "),
          const Text(
              "Haven't received a verification email? Press the button below."),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
              if (!mounted) return;
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            child: const Text('Send email verification'),
          ),
          TextButton(
            onPressed: () async {
              if (!mounted) return;
              context.read<AuthBloc>().add(const AuthEventLogOut());
            },
            child: const Text('Go to Login.'),
          )
        ],
      ),
    );
  }
}
