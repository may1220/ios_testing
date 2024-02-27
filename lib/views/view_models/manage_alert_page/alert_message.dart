import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatMessage {
  ChatMessage({this.message = ''});
  late String message;
}

class ChatMessageNotifier extends StateNotifier<ChatMessage> {
  ChatMessageNotifier(ChatMessage state) : super(state);
  setMessage(message) {
    if (kDebugMode) {
      print("chat message: $message");
    }
    state.message = message;
  }
}

// メッセージの受け渡しを行うためのProvider
// ※ autoDisposeを付けることで自動的に値をリセットできます
//
final chatMessageProvider =
    StateNotifierProvider<ChatMessageNotifier, ChatMessage>((ref) {
  return ChatMessageNotifier(ChatMessage());
});
