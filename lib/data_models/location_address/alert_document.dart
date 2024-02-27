import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AlertDocument {
  String? uId;
  bool? isOpen;
  String? gId;
  String? uName;
  String? docId;
  double? latitude;
  int? messageId;
  DateTime? time;
  int? timestamp;
  int? type;
  double? longitude;

  AlertDocument(
      {this.uId,
        this.isOpen,
        this.gId,
        this.uName,
        this.docId,
        this.latitude,
        this.messageId,
        this.time,
        this.timestamp,
        this.type,
        this.longitude});

  AlertDocument.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    isOpen = json['isOpen'];
    gId = json['gId'];
    uName = json['uName'];
    docId = json['docId'];
    latitude = json['latitude'];
    messageId = json['messageId'];
    time = DateTime.parse(json['time']);
    Timestamp tts = json['timestamp'];
    timestamp = tts.toDate().millisecondsSinceEpoch;
    type = json['type'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['uId'] = uId;
    data['isOpen'] = isOpen;
    data['gId'] = gId;
    data['uName'] = uName;
    data['docId'] = docId;
    data['latitude'] = latitude;
    data['messageId'] = messageId;
    data['time'] = time;
    data['timestamp'] = timestamp;
    data['type'] = type;
    data['longitude'] = longitude;
    return data;
  }
}
