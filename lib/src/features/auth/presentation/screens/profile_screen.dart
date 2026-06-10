import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_event.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_state.dart';
import 'package:test_architecture/src/features/news/config/news_route_module.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.status.maybeWhen(
                    authorized: () => 'Authorized user',
                    orElse: () => 'Unauthorized user',
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutRequested());
                    context.router.replace(const LoginRoute());
                  },
                  child: const Text('Sign out'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
