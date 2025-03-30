import 'dart:async';
import 'package:flutter/cupertino.dart';

class DebounceTimer {

  Timer? _timer;
  DebounceTimer();

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}