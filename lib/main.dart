import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/bloc/cartListBloc.dart';
import 'package:foodapp/bloc/listStyleColorBloc.dart';
import 'package:foodapp/widgets/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(dependencies: [],
        blocs: [
          Bloc((i) => CartListBloc()),
          Bloc((i)=>ColorBloc()),
    ],

      child : MaterialApp(
      title: "Food App",
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}
