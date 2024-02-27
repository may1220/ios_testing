import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationStream {
  static LocationStream? _instance;
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  final int _timeGap = 15; //minute
  Timer? _timer;
  bool updating = false;

  LocationStream._internal(Function(bool) callback) {
    _controller.stream.listen(callback);
  }

  factory LocationStream(Function(bool) callback) {
    _instance ??= LocationStream._internal(callback);
    return _instance!;
  }

  Stream<bool> get stream => _controller.stream;
  int get gap => _timeGap;

  void _tick() async {
    if(updating == false){
      updating = true;
      SharedPreferences shp = await SharedPreferences.getInstance();
      int updatedTime = shp.getInt('loc')??0;
     if(((DateTime.now().millisecondsSinceEpoch - updatedTime) > (_timeGap * 1000 * 60))){
        _update();
      }
      updating = false;
    }
  }

  void _update() async {
    SharedPreferences shp = await SharedPreferences.getInstance();
    shp.setInt('loc', DateTime.now().millisecondsSinceEpoch);
    _controller.add(true);
  }

  void start() async {
    _update();
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) => _tick());
  }

  void resume() => _tick();

  void stop() {
    _timer?.cancel();
    _timer = null;
  }
}
