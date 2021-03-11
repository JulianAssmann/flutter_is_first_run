import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'is_first_run demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? _isFirstRun;
  bool? _isFirstCall;

  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      _isFirstRun = ifr;
    });
  }

  void _checkFirstCall() async {
    bool ifc = await IsFirstRun.isFirstCall();
    setState(() {
      _isFirstCall = ifc;
    });
  }

  void _reset() async {
    await IsFirstRun.reset();
    _checkFirstRun();
    _checkFirstCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  child: Text('Check first run'), onPressed: _checkFirstRun),
              ElevatedButton(
                  child: Text('Check first call'), onPressed: _checkFirstCall),
              ElevatedButton(child: Text('Reset'), onPressed: _reset),
              SizedBox(height: 24),
              Text(
                  'Is first run: ${_isFirstRun != null ? _isFirstRun : 'Unknown'}'),
              Text(
                  'Is first call: ${_isFirstCall != null ? _isFirstCall : 'Unknown'}'),
            ]),
      ),
    );
  }
}
