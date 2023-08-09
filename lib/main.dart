import 'package:animated_custom_drawer/app/app_page.dart';
import 'package:animated_custom_drawer/app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AppCubit(),
      child: const _App(
        key: Key('app'),
      ),
    ),
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/app',
      routes: {
        '/': (context) => Container(),
        '/app': (context) => const AppPage(),
      },
    );
  }
}
