import 'package:background_fetch/background_fetch.dart';
import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';


class LocationBackgroundService {
// [Android-only] This "Headless Task" is run when the Android app
// is terminated with enableHeadless: true
  Location location = Location(
      latitude: 0,
      longitude: 0,
      speed: 0,
      bearing: 0,
      accuracy: 0,
      time: 0,
      altitude: 0,
      isMock: false);

  void backgroundFetchHeadlessTask(HeadlessTask task) async {
    String taskId = task.taskId;
    bool isTimeout = task.timeout;
    if (isTimeout) {
      // This task has exceeded its allowed running-time.
      // You must stop what you're doing and immediately .finish(taskId)
      BackgroundLocation.stopLocationService();
      debugPrint("stopLocationService");

      BackgroundFetch.finish(taskId);
      return;
    }
    // Do your work here...
    locationTracking();
    BackgroundFetch.finish(taskId);
  }

  
  
  void sentLocation(Location location)
 {
  }
  
  void locationTracking() async {
   await BackgroundLocation.setAndroidNotification(
      title: "Location Tracking",
      message: " Your Current Location is  ",
      icon: "@drawable/logo",
    );
   debugPrint("setAndroidNotification");

   await  BackgroundLocation.setAndroidConfiguration(10000);
   debugPrint("setAndroidConfiguration");

    await BackgroundLocation.startLocationService();
   debugPrint("startLocationService");

  BackgroundLocation.getLocationUpdates((p0) {});
  }

  Future<void> initBackgroundService(bool mounted) async {
    // Configure BackgroundFetch.
    await BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 15,
            stopOnTerminate: false,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            startOnBoot: true,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.ANY), (String taskId) async {
      // <-- Event handler
      // This is the fetch-event callback.

      BackgroundFetch.finish(taskId);
    }, (String taskId) async {
      // <-- Task timeout handler.
      // This task has exceeded its allowed running-time.  You must stop what you're doing and immediately .finish(taskId)
      BackgroundFetch.finish(taskId);
    });
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    BackgroundFetch.start();
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }
}
