import 'package:aksaraapp/konversi_bloc.dart';
import 'package:flutter/material.dart';
import 'package:aksaraapp/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hanacaraka',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: BlocProvider<KonversiBloc>(
          create: (context) => KonversiBloc(),
          child: HomePage(),
        ));
  }
}
