import 'package:flutter/material.dart';
import '../models/device_model.dart';
import '../services/casting_service.dart';

class DeviceList extends StatefulWidget {
  @override
  _DeviceListState createState() => _DeviceListState();
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  List<Device> devices = [];

  @override
  void initState() {
    super.initState();
    // Fetch devices
    fetchDevices();
  }

  void fetchDevices() async {
    // ...existing code...
    devices = await CastingService.getAvailableDevices();
    setState(() {});
    // ...existing code...
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.device_unknown),
              title: Text(
                devices[index].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(devices[index].type),
              onTap: () {
                // Select device and navigate to CastScreen
                CastingService.selectDevice(devices[index]);
                Navigator.pushNamed(context, '/cast');
              },
            ),
          );
        },
      ),
    );
  }
}
