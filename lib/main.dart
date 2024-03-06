import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/register/register_bloc.dart';
import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';
import 'package:flutter_ecatalog/presentation/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(AuthDataSource()),
      child: MaterialApp(
        title: 'Flutter eCatalog',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: RegisterPage(),
      ),
    );
  }
}
