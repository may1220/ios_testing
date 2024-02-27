import 'package:ebhc/data_models/firebase_firestore_site_weather_stream_provider.dart';
import 'package:ebhc/views/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddressWidget extends HookConsumerWidget {
  final String siteId;
  const AddressWidget({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationProvider(siteId));
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.near_me_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
            child: locationState.when(
                data: (data) {
                  return FutureBuilder<String>(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const AppText(
                          text: "東京都港区六本木",
                          size: 16,
                        );
                      }
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        return AppText(
                          text: snapshot.data!,
                          size: 16,
                          textAlign: TextAlign.start,
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  );
                },
                error: (err, stack) {
                  return Text("${err.toString()}");
                },
                loading: () => const Text("Loading")))
      ],
    );
  }
}
