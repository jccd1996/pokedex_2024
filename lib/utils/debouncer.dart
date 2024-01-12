import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Timer? timer;
  void execute(VoidCallback action) {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 1), action);
  }
}