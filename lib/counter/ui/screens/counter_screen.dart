import 'package:flutter/material.dart';
import 'package:counter_app/counter/ui/bloc/num_manager_inherited_widget.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final numManagerBloc = NumManager.of(context).numManagerBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
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
