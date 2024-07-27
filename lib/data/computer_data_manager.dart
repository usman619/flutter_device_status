import 'dart:async';

import 'package:flutter_device_status/data/computer_data.dart';

mixin ComputerDataManager {
  static StreamController<ComputerData> computerDataController =
      StreamController<ComputerData>.broadcast();
  static ComputerData computerData = ComputerData.emptyData();

  static void addComputerData(ComputerData? computerData) {
    if (computerData != null) {
      ComputerDataManager.computerData = computerData;
      ComputerDataManager.computerDataController.add(computerData);
    } else {
      ComputerDataManager.computerData = ComputerData.emptyData();
      ComputerDataManager.computerDataController.add(ComputerData.emptyData());
    }
  }
}
