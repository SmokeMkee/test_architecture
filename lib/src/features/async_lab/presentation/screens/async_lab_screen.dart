import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_architecture/src/features/async_lab/domain/models/async_lab_state.dart';
import 'package:test_architecture/src/features/async_lab/presentation/blocs/async_lab_bloc.dart';
import 'package:test_architecture/src/features/async_lab/presentation/blocs/async_lab_event.dart';

class AsyncLabScreen extends StatefulWidget {
  const AsyncLabScreen({super.key});

  @override
  State<AsyncLabScreen> createState() => _AsyncLabScreenState();
}

class _AsyncLabScreenState extends State<AsyncLabScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AsyncLabBloc, AsyncLabState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Debounce Search')),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _SectionCard(
                title: 'Debounce Search',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Type fast (try: dart, stream, error)',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<AsyncLabBloc>().add(
                              AsyncLabSearchQueryChanged(value),
                            );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text('Current query: ${state.searchQuery}'),
                    const SizedBox(height: 8),
                    Text(
                      state.searchErrorMessage ??
                          (state.searchResults.isEmpty
                              ? 'No results yet'
                              : state.searchResults.join('\n')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
