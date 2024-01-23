import 'package:flutter/services.dart';

class BatteryChannel {
  //MethodChannel
  final MethodChannel _channel = const MethodChannel('battery');

  Future<int?> getBatteryLevel() async {
    return await _channel.invokeMethod('getBatteryLevel');
  }

  //EventChannel
  final EventChannel _eventChannel = EventChannel('batteryEvent');

  Stream get  stream => _eventChannel.receiveBroadcastStream().cast();
}