import 'package:ebhc/views/pages/new_design/health_panel_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class TestFeaturePage extends HookConsumerWidget {
  const TestFeaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("機能テスト")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: _MyElevatedButton(Colors.purple, 'MAPテスト', onPressed: () {
              Routemaster.of(context).push('map');
              if (kDebugMode) {
                print('push route to map');
              }
            }),
          ),
          SizedBox(
            width: double.infinity,
            child: _MyElevatedButton(Colors.purple, 'QRスキャンテスト', onPressed: () {
              Routemaster.of(context).push('qrscan');
              if (kDebugMode) {
                print('push route to qrscan');
              }
            }),
          ),
          SizedBox(
            width: double.infinity,
            child: _MyElevatedButton(Colors.purple, 'Graphテスト', onPressed: () {
              Routemaster.of(context).push('graph');
              if (kDebugMode) {
                print('push route to graph');
              }
            }),
          ),
          SizedBox(
            width: double.infinity,
            child: _MyElevatedButton(Colors.green, "戻る", onPressed: () {
              Routemaster.of(context).pop();
              if (kDebugMode) {
                print('pop route');
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget row(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title:', style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}

class _MyElevatedButton extends HookConsumerWidget {
  final Color color;
  final String text;
  final Function()? onPressed;

  const _MyElevatedButton(this.color, this.text, {this.onPressed, Key? key})
      : super(key: key);
  //onPressed ??= () {};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 16,
      ),
      child: Text(text),
    );
  }
}
