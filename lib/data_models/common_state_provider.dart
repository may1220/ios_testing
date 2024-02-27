/* import 'package:ebhc/data_models/firebase_auth_repository.dart';
import 'package:ebhc/data_models/firestore_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final timeStreamProvider = StreamProvider((ref) =>
    Stream.periodic(const Duration(minutes: 5), (i) => DateTime.now()));

final timeNotifierProvider =
    StateNotifierProvider<TimeNotifier, AsyncValue<DateTime>>(
        (ref) => TimeNotifier(ref));

class TimeNotifier extends StateNotifier<AsyncValue<DateTime>> {
  final Ref ref;
  TimeNotifier(this.ref) : super(AsyncData(DateTime.now())) {
    ref.listen(timeStreamProvider, (p, n) {
      state = AsyncValue.data(DateTime.now());
    });
    ref.listen(userHealthLatestListener, (p, n) {
      state = AsyncValue.data(DateTime.now());
    });
    ref.listen(healthStatusProvider, (p, n) {
      state = AsyncValue.data(DateTime.now());
    });
  }

  updateTime(DateTime time) {
    state = AsyncData(time);
  }
}

final userHealthLatestListener = StreamProvider((ref) {
  final uId = ref.watch(firebaseAuthProvider).currentUser!.uid;
  return ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .doc(uId)
      .snapshots();
});

final healthStatusProvider = StreamProvider((ref) {
  final uId = ref.watch(firebaseAuthProvider).currentUser!.uid;
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String greaterThan = "$currentDate 00:00:00";
  String lessThan = "$currentDate 23:59:59";
  return ref
      .watch(firebaseFirestoreProvider)
      .collection('users')
      .doc(uId)
      .collection('health')
      .where('time', isLessThan: lessThan, isGreaterThan: greaterThan)
      .snapshots();
});
 */

