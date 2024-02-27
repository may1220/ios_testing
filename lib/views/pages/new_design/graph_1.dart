import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Graph1Page extends HookConsumerWidget {
  const Graph1Page({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        // 左側のアイコン
//        leading: const Icon(Icons.arrow_back),
        // タイトルテキスト
        title: const Text('作業者情報'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Graph1StatusWidget(),
            Graph1HeartRateWidget(),
            Graph1GraphMock(),
            Graph1PanelWidget(),
          ],
        ),
      ),
    );
  }
}

class Graph1StatusWidget extends HookConsumerWidget {
  const Graph1StatusWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const FlutterLogo(size: 24),
            ),
            const SizedBox(width: 8),
            const Text(
              "良好",
              style: TextStyle(
                color: Color(0xff167d1e),
                fontSize: 18,
                fontFamily: "Noto Sans JP",
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        const Text(
          "最新 (17:55)",
          style: TextStyle(
            color: Color(0xff50535c),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class Graph1HeartRateWidget extends HookConsumerWidget {
  const Graph1HeartRateWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: const Color(0xffee9999),
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const FlutterLogo(size: 16),
                ),
                const SizedBox(width: 4),
                const Text(
                  "心拍数",
                  style: TextStyle(
                    color: Color(0xff2b0000),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        const SizedBox(
          width: 64,
          child: Text(
            "70 BPM",
          ),
        ),
      ],
    );
  }
}

class Graph1GraphMock extends HookConsumerWidget {
  const Graph1GraphMock({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "BPM",
          style: TextStyle(
            color: Color(0xff50535c),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 258,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "125",
                        style: TextStyle(
                          color: Color(0xff121315),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 21),
                      Text(
                        "100",
                        style: TextStyle(
                          color: Color(0xff121315),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 21),
                      Text(
                        "75",
                        style: TextStyle(
                          color: Color(0xff121315),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 21),
                      Text(
                        "50",
                        style: TextStyle(
                          color: Color(0xff121315),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 21),
                      Text(
                        "25",
                        style: TextStyle(
                          color: Color(0xff121315),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 21),
                      Text(
                        "0",
                        style: TextStyle(
                          color: Color(0xff121315),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 304,
                          height: 1,
                          child: Material(
                            color: Color(0xffebecee),
                          ),
                        ),
                        SizedBox(height: 48),
                        SizedBox(
                          width: 304,
                          height: 1,
                          child: Material(
                            color: Color(0xffebecee),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    Material(
                      color: const Color(0xffe9faea),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 304,
                            height: 1,
                            child: Material(
                              color: Color(0xffebecee),
                            ),
                          ),
                          const SizedBox(height: 48),
                          const SizedBox(
                            width: 304,
                            height: 1,
                            child: Material(
                              color: Color(0xffebecee),
                            ),
                          ),
                          const SizedBox(height: 48),
                          SizedBox(
                            width: 304.50,
                            height: 85.50,
                            child: Material(
                              color: const Color(0x7f7f3a44),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 2,
                                  color: Color(0xff3b30ed),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    const SizedBox(
                      width: 304,
                      height: 1,
                      child: Material(
                        color: Color(0xffebecee),
                      ),
                    ),
                    const SizedBox(height: 48),
                    const SizedBox(
                      width: 304,
                      height: 1,
                      child: Material(
                        color: Color(0xffebecee),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Graph1PanelWidget extends HookConsumerWidget {
  const Graph1PanelWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 48,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "詳細データ",
            style: TextStyle(
              color: Color(0xff121315),
              fontSize: 14,
              fontFamily: "Noto Sans JP",
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 328,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xfff4f4f5),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "最大心拍数",
                  style: TextStyle(
                    color: Color(0xff121315),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "115BPM",
                      style: TextStyle(
                        color: Color(0xff121315),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "13:25",
                      style: TextStyle(
                        color: Color(0xff50535c),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 328,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xfff4f4f5),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "最小心拍数",
                  style: TextStyle(
                    color: Color(0xff121315),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "52BPM",
                      style: TextStyle(
                        color: Color(0xff121315),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "17:25",
                      style: TextStyle(
                        color: Color(0xff50535c),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xfff4f4f5),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 18,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 312,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "平均心拍範囲",
                        style: TextStyle(
                          color: Color(0xff121315),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "55~89BPM",
                        style: TextStyle(
                          color: Color(0xff121315),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
