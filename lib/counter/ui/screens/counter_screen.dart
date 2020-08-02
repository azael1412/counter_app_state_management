import 'package:flutter/material.dart';

import 'package:counter_app/counter/bloc/num_manager_bloc.dart';

import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final numManagerBloc = Provider.of<NumManagerBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Contador con Provider"),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Center(
        child: Text(
          numManagerBloc.number.toString(),
          style: TextStyle(
              fontSize: 40.0, color: Colors.blue, fontWeight: FontWeight.w900),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => numManagerBloc.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
