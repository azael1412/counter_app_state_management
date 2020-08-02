import 'package:flutter/material.dart';

import 'package:counter_app/counter/bloc/num_manager_bloc.dart';

class NumManager extends InheritedWidget {
  final Widget child;
  final NumManagerBloc numManagerBloc;
  final Key key;

  NumManager({@required this.child, @required this.numManagerBloc, this.key})
      : super(key: key);

  @override
  bool updateShouldNotify(NumManager oldWidget) => true;

  static NumManager of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
