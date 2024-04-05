import 'package:assig1/modules/signup.dart';
import 'package:assig1/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppCubit()..createDatabase()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUP(),
      ),
    );
  }
}
