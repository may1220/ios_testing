import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// cloud_firestoreパッケージ内にあるという記事もあったがない？
// https://qiita.com/rei_012/items/281b716f22482419834b
// > それがこちら
// > TimestampConverter
// > これは何かというと、 Firestore のパッケージの中に入っているカスタムコンバータです。

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}
