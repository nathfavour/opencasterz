import '../models/device_model.dart';

class CastingService {
  static Device? _selectedDevice;

  static Future<List<Device>> getAvailableDevices() async {
    // Simulated device discovery
    await Future.delayed(Duration(seconds: 1));
    return [
      Device(id: '1', name: 'Living Room TV', type: 'TV'),
      Device(id: '2', name: 'Office Display', type: 'Monitor'),
      Device(id: '3', name: 'Kitchen Display', type: 'Smart Display'),
    ];
  }

  static void selectDevice(Device device) {
    _selectedDevice = device;
  }

  static Device? getSelectedDevice() {
    return _selectedDevice;
  }

  static Future<void> startCasting() async {
    if (_selectedDevice == null) {
      throw Exception('No device selected');
    }
    // Simulate casting delay
    await Future.delayed(Duration(seconds: 1));
  }
}
