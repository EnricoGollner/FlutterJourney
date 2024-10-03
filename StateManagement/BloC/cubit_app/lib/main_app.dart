import 'package:cubit_app/app/cubits/todo_cubit.dart';
import 'package:cubit_app/app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
      ),
    );
  }
}