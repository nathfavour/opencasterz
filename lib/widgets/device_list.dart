import 'package:flutter/material.dart';
import '../models/device_model.dart';
import '../services/casting_service.dart';
import '../utils/constants.dart';

class DeviceList extends StatefulWidget {
  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  List<Device> devices = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDevices();
  }

  Future<void> fetchDevices() async {
    setState(() => isLoading = true);
    try {
      final deviceList = await CastingService.getAvailableDevices();
      setState(() {
        devices = deviceList;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.borderRadius),
          ),
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.device_unknown),
            title: Text(device.name),
            subtitle: Text(device.type),
            onTap: () => _handleDeviceSelection(device),
          ),
        );
      },
    );
  }

  void _handleDeviceSelection(Device device) {
    CastingService.selectDevice(device);
    Navigator.pushNamed(context, '/cast');
  }
}
