import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavaen_timer/util/modifiedtesxt.dart';
class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Duration _currentTime = Duration(seconds: 60); // Initial time in seconds
  bool _isRunning = false;
  late Timer _timer;

  void startTimer(Duration duration) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentTime.inSeconds > 0) {
          _currentTime -= Duration(seconds: 1);
        } else {
          _timer.cancel();
          _isRunning = false;
        }
      });
    });
  }

  void pauseTimer() {
    if (_isRunning) {
      _timer.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  void resetTimer() {
    if (!_isRunning) {
      setState(() {
        _currentTime = Duration(seconds: 60); // Reset the timer to the initial time
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = 1.0 - (_currentTime.inSeconds / 60.0); // Calculate progress between 0.0 and 1.0
    double angle = 2 * pi * progress;

    String formattedTime =
        '${_currentTime.inHours.toString().padLeft(2, '0')}:${_currentTime.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_currentTime.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Scaffold(
      appBar: AppBar(
        title: Text('One minute timer',style: GoogleFonts.breeSerif(
          letterSpacing: 2
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Stack(
                children: [
                  CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  Center(
                    child: Text(
                      formattedTime,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (!_isRunning) {
                      startTimer(_currentTime);
                      setState(() {
                        _isRunning = true;
                      });
                    }
                  },
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    pauseTimer();
                  },
                  child: Text('Pause'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    resetTimer();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}