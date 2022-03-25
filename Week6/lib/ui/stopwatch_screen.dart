import 'package:flutter/material.dart';
import 'dart:async';
import './login_screen.dart';

class StopwatchScreen extends StatefulWidget {
  static const route = '/stopwatch';
  @override
  State<StatefulWidget> createState() {
    return StopwatchScreenState();
  }
}

class StopwatchScreenState extends State<StatefulWidget> {
  int milliseconds = 0;
  int seconds = 0;
  late Timer timer;
  final laps = <int>[];
  bool isTicking = false;

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    print('email=$email');
    return Scaffold(
      appBar: AppBar(
        title: Text(email),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(LoginScreen.route);
        },
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white),
          ),
          Text(_secondsText(milliseconds),
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white)),
          SizedBox(height: 20),
          _buildControls()
        ],
      ),
    );
  }

  Row _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            onPressed: isTicking ? null : _startTimer,
            child: Text('Start')),
        SizedBox(width: 20),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.black54)),
            onPressed: isTicking ? _lap : null,
            child: Text('Lap')),
        SizedBox(width: 20),
        Builder(
            builder: (context) => TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text('Stop'),
                  onPressed: isTicking ? () => _stopTimer(context) : null,
                ))
      ],
    );
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
        child: ListView.builder(
            itemCount: laps.length,
            itemBuilder: (context, index) {
              final milliseconds = laps[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 50),
                title: Text('Lap ${index + 1}'),
                trailing: Text(_secondsText(milliseconds)),
              );
            }));
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      laps.clear();
      isTicking = true;
    });
  }

  void _stopTimer(BuildContext context) {
    timer.cancel();
    setState(() {
      isTicking = false;
    });
  }

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });
  }
}
