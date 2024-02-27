//import 'package:ebhc/data_models/map_state.dart';
import 'package:ebhc/data_models/map_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:location/location.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

// class MapPage extends HookConsumerWidget {
//   const MapPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return const Text("MapPage");
//   }
// }

class MapPage extends HookConsumerWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mmsp = ref.watch(mapStateProvider.notifier);
    final mmState = ref.watch(mapStateProvider);

    useEffect(() {
      mmsp.initState();
      return () {};
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: mmState.lastPosition, zoom: 18),
            onMapCreated: mmsp.onMapCreated,
            myLocationEnabled: true,
            compassEnabled: true,
            markers: mmState.markers,
            onCameraMove: mmsp.onCameraMove,
          ),
          Positioned(
            top: 40,
            right: 10,
            child: FloatingActionButton(
              onPressed: mmsp.addMarker,
              tooltip: 'add marker',
              backgroundColor: Colors.blue,
              child: const Icon(Icons.add_location, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
