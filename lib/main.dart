import 'package:flutter/material.dart';

import 'package:counter_app/counter/bloc/num_manager_bloc.dart';
import 'package:counter_app/counter/ui/screens/counter_screen.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // final NumManagerBloc numManagerBloc = NumManagerBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NumManagerBloc(),
      child: Consumer<NumManagerBloc>(builder: (context, bloc, widget) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: CounterScreen());
      }),
    );
  }
}
