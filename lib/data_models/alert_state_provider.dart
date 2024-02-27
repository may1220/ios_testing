// ユーザー情報の受け渡しを行うためのProvider
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebhc/data_models/alert_state.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_state_provider.freezed.dart';

@freezed
class AlertStateProviderParameters with _$AlertStateProviderParameters {
  const factory AlertStateProviderParameters({
    @Default(false) bool isGroupAlert,
    required String id,
    required String alertId, // Add your fields here
  }) = _AlertStateProviderParameters;
}

// AlertStateの１つの取り出しはStreamにする必要はない
//
final alertStateProvider = FutureProvider.autoDispose
    .family<AlertState?, AlertStateProviderParameters>((ref, param) async {
  final id = param.id;
  final alertId = param.alertId;
  final collectionName = param.isGroupAlert ? 'groups' : 'users';

  final doc = await FirebaseFirestore.instance
      .collection(collectionName)
      .doc(id)
      .collection('alerts')
      .doc(param.alertId)
      .get();

  
  // 存在していなかったときはひとまずdefaultでよい
  // not existをexceptionで処理すべきかどうかは...
  // FutureProviderのなかではTを返す
  if (!doc.exists) {
    if (kDebugMode) {
      print("alertDoc is not exist: /$collectionName/$id/alerts/$alertId");
    }
    return null;
    // const AlertState();
  }
  if (kDebugMode) {
    print("alertDoc is found: /$collectionName/$id/alerts/$alertId");
  }

  final docmap = doc.data()!;
  return AlertState.fromJson(docmap);
});
