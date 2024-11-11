import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GreenHouseController extends GetxController {
  ScrollController scrollController = ScrollController();
  final hide = false.obs;

  // Observable variables for sensor data
  final temperature = 'Loading...'.obs;
  final humidity = 'Loading...'.obs;
  final co2 = 'Loading...'.obs;
  final light = 'Loading...'.obs;

  // Observable variables for device control statuses
  final fanStatus = 'OFF'.obs;
  final lightStatus = 'OFF'.obs;
  final waterPumpStatus = 'OFF'.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(hideFxn);
    fetchSensorData();
  }

  void hideFxn() {
    if (scrollController.position.pixels > 180) {
      hide.value = true;
    } else {
      hide.value = false;
    }
  }

  // Fetch latest sensor data
  void fetchSensorData() async {
    // TODO: Implement fetching of sensor data, updating variables like temperature, humidity, etc.
    temperature.value = temperatureStatus();
    humidity.value = humidityStatus();
    co2.value = co2Status();
    light.value = lightIntensityStatus();
  }

  String temperatureStatus() {
    return 'Loading...';
  }

  String humidityStatus() {
    return 'Loading...';
  }

  String co2Status() {
    return 'Loading...';
  }

  String lightIntensityStatus() {
    return 'Loading...';
  }

  // Update fan status
  void updateFanStatus(String value) {
    fanStatus.value = value;
    // TODO: Implement actual API/mutation logic to update device status
  }

  // Update light status
  void updateLightStatus(String value) {
    lightStatus.value = value;
    // TODO: Implement actual API/mutation logic to update device status
  }

  // Update water pump status
  void updateWaterPumpStatus(String value) {
    waterPumpStatus.value = value;
    // TODO: Implement actual API/mutation logic to update device status
  }
}
