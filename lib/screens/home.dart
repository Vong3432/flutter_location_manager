import 'package:flutter/material.dart';
import 'package:location_manager/providers/location_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationAPIProvider>(
      builder: (BuildContext context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              provider.status,
            ),
            Text(
              "Lat: ${provider.coordinate?.latitude ?? 0.0} ,Lng: ${provider.coordinate?.longitude ?? 0.0}",
            ),
            TextButton(
              onPressed: () {
                provider.getCoordinate();
              },
              child: const Text("Get"),
            ),
            TextButton(
              onPressed: () {
                provider.watch();
              },
              child: const Text("Listen"),
            ),
            TextButton(
              onPressed: () {
                provider.stop();
              },
              child: const Text("Stop"),
            ),
          ],
        );
      },
    );
  }
}
