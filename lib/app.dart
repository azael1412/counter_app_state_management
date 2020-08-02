import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int number;

  void numChangeCallback(int receivedNum) {
    setState(() {
      number = receivedNum;
    });
  }

  @override
  void initState() {
    super.initState();
    number = 0;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NumManager(
            number: number,
            callback: numChangeCallback,
            child: Builder(builder: homeScreenBuilder)),
      );
}

Widget homeScreenBuilder(BuildContext context) {
  int _number = NumManager.of(context).number;
  Function(int) _callback = NumManager.of(context).callback;
  return Scaffold(
    appBar: AppBar(
      title: Text('Inherited Callback Pattern'),
      elevation: 0.0,
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        _callback(++_number);
      },
      child: Text('+1'),
    ),
    body: Center(
      child: Text(
        _number.toString(),
        style: TextStyle(
            fontSize: 40.0, color: Colors.blue, fontWeight: FontWeight.w900),
      ),
    ),
  );
}

class NumManager extends InheritedWidget {
  final int number;
  final Widget child;
  final Function(int) callback;
  final Key key;

  NumManager(
      {@required this.number,
      @required this.callback,
      @required this.child,
      this.key})
      : super(key: key);

  @override
  bool updateShouldNotify(NumManager oldWidget) {
    return oldWidget.number == number;
  }

  static NumManager of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: NumManager);
}
